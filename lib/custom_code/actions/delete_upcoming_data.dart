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

Future deleteUpcomingData(
  String itemID,
  String uid,
) async {
  // Add your function code here!
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Отримання даних з Add_Item_Library для видалення
  DocumentSnapshot itemSnapshot = await firestore
      .collection('users')
      .doc(uid)
      .collection('Add_Item_Library')
      .doc(itemID)
      .get();

  if (itemSnapshot.exists) {
    String name = itemSnapshot['name'];
    DateTime endDate = (itemSnapshot['end_date'] as Timestamp).toDate();

    // Отримання даних з upcomingData для видалення
    QuerySnapshot dateSnapshot = await firestore
        .collection('upcomingData')
        .where('date', isEqualTo: Timestamp.fromDate(endDate))
        .where('userID', isEqualTo: uid)
        .get();

    for (var dateDoc in dateSnapshot.docs) {
      // Отримання даних з upcomingNames для видалення
      QuerySnapshot namesSnapshot = await firestore
          .collection('upcomingData')
          .doc(dateDoc.id)
          .collection('upcomingNames')
          .where('item_id', isEqualTo: itemID)
          .get();

      for (var nameDoc in namesSnapshot.docs) {
        // Видалення документу з upcomingNames
        await firestore
            .collection('upcomingData')
            .doc(dateDoc.id)
            .collection('upcomingNames')
            .doc(nameDoc.id)
            .delete();
      }

      // Якщо у upcomingNames більше немає даних, видаляємо весь документ з upcomingData
      if (namesSnapshot.docs.isEmpty) {
        await firestore.collection('upcomingData').doc(dateDoc.id).delete();
      }
    }

    // Перевірка чи немає більше документів в upcomingData
    if (dateSnapshot.docs.isNotEmpty) {
      QuerySnapshot remainingData = await firestore
          .collection('upcomingData')
          .doc(dateSnapshot.docs.first.id)
          .collection('upcomingNames')
          .get();

      if (remainingData.docs.isEmpty) {
        print('У upcomingData немає більше даних. Видаляємо весь документ.');
        await firestore
            .collection('upcomingData')
            .doc(dateSnapshot.docs.first.id)
            .delete();
      }
    } else {
      print('Немає документів в dateSnapshot для перевірки залишкових даних.');
    }
  } else {
    print('Документ в Add_Item_Library з itemID $itemID не знайдений.');
  }
}
