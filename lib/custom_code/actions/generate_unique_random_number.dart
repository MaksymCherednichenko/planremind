// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

Future generateUniqueRandomNumber() async {
  // Add your function code here!
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Random random = Random();

  try {
    if (user != null) {
      String uid = user.uid;

      // Отримуємо інформацію про користувача
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      // Перевіряємо, чи поле uniqueUserCode існує в документі
      if (userDoc.exists &&
          (userDoc.data() as Map<String, dynamic>)
              .containsKey('uniqueUserCode')) {
        // Поле uniqueUserCode існує, отримуємо його значення
        var existingCode = userDoc['uniqueUserCode'];
        print('Existing unique code: $existingCode');
      } else {
        // Поле uniqueUserCode не існує в документі, генеруємо новий код
        int generatedNumber;

        // Генерація нового випадкового числа та перевірка на унікальність
        do {
          generatedNumber = 100000 + random.nextInt(900000);
        } while (await isNumberUsed(firestore, generatedNumber));

        // Позначаємо це число як використане (зберігаємо його в базі даних)
        await firestore.collection('usedUserCode').add({
          'userNumber': generatedNumber,
        });

        // Позначаємо це число як використане для конкретного користувача (зберігаємо його в базі даних)
        await firestore.collection('users').doc(uid).update({
          'uniqueUserCode': generatedNumber,
        });
        print('Generated and saved unique code: $generatedNumber');
      }
    }
  } catch (error) {
    print('Error: $error');
  }
}

Future<bool> isNumberUsed(
    FirebaseFirestore firestore, int generatedNumber) async {
  // Перевірка, чи вже використовується згенероване число в колекції
  QuerySnapshot usedNumbersSnapshot =
      await firestore.collection('usedUserCode').get();

  for (QueryDocumentSnapshot usedNumberDoc in usedNumbersSnapshot.docs) {
    int? usedNumber = usedNumberDoc['userNumber'];
    if (usedNumber != null && usedNumber == generatedNumber) {
      return true; // Знайдено використане число
    }
  }
  return false; // Число не використовується
}
