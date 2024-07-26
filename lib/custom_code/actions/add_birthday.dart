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

import 'package:firebase_auth/firebase_auth.dart';

Future addBirthday(
  String name,
  DateTime date,
  int? age,
) async {
  // Add your function code here!
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    String uid = user.uid;
    DateTime now = DateTime.now();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Перевіряємо, чи існує документ з такою датою в колекції 'birthdayDate'
      QuerySnapshot dateSnapshot = await firestore
          .collection('birthdayDate')
          .where('userID', isEqualTo: uid)
          .where('date', isEqualTo: date)
          .get();

      if (dateSnapshot.docs.isNotEmpty) {
        // Якщо документ існує, оновлюємо його
        DocumentSnapshot existingDate = dateSnapshot.docs.first;

        await firestore
            .collection('birthdayDate')
            .doc(existingDate.id)
            .collection('birthdayDateInfo')
            .add({
          'name': name,
          'age': age ?? _calculateAge(date),
        });
      } else {
        // Якщо документ не існує, створюємо його
        DocumentReference newDateRef =
            await firestore.collection('birthdayDate').add({
          'date': date,
          'userID': uid,
          'dateDay': DateTime(now.year, date.month, date.day),
          'dateMonth': DateTime(now.year, date.month, 1),
        });

        await newDateRef.collection('birthdayDateInfo').add({
          'name': name,
          'age': age ?? _calculateAge(date),
        });
      }
    } catch (error) {
      print(error);
    }
  }
}

// Допоміжна функція для розрахунку віку
int _calculateAge(DateTime birthday) {
  DateTime now = DateTime.now();
  int age = now.year - birthday.year;

  if (now.month < birthday.month ||
      (now.month == birthday.month && now.day < birthday.day)) {
    age--;
  }

  return age;
}
