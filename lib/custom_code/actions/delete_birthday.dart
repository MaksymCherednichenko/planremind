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

Future deleteBirthday(
  String name,
  DateTime date,
) async {
  // Add your function code here!
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    String uid = user.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Перевіряємо, чи існує документ з такою датою в колекції 'birthdayDate'
      QuerySnapshot dateSnapshot = await firestore
          .collection('birthdayDate')
          .where('userID', isEqualTo: uid)
          .where('date', isEqualTo: date)
          .get();

      if (dateSnapshot.docs.isNotEmpty) {
        // Якщо документ існує, отримуємо його ID
        String dateDocId = dateSnapshot.docs.first.id;

        // Перевіряємо, чи існує ім'я в колекції 'birthdayDateInfo' даного документа
        QuerySnapshot nameSnapshot = await firestore
            .collection('birthdayDate')
            .doc(dateDocId)
            .collection('birthdayDateInfo')
            .where('name', isEqualTo: name)
            .get();

        if (nameSnapshot.docs.isNotEmpty) {
          // Якщо ім'я існує, видаляємо його
          String nameDocId = nameSnapshot.docs.first.id;

          await firestore
              .collection('birthdayDate')
              .doc(dateDocId)
              .collection('birthdayDateInfo')
              .doc(nameDocId)
              .delete();

          // Перевіряємо, чи документ більше не має імен
          QuerySnapshot remainingNamesSnapshot = await firestore
              .collection('birthdayDate')
              .doc(dateDocId)
              .collection('birthdayDateInfo')
              .get();

          if (remainingNamesSnapshot.docs.isEmpty) {
            // Якщо документ не має імен, видаляємо його
            await firestore.collection('birthdayDate').doc(dateDocId).delete();
          }
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
