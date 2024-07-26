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

Future moveToHistory() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  String? userID = user?.uid;

  if (userID != null) {
    QuerySnapshot boughtItemsSnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('Shopping_List')
        .where('bought', isEqualTo: true)
        .get();

    DateTime today = DateTime.now();
    bool foundToday = false;

    QuerySnapshot historySnapshot = await firestore
        .collection('historyShoppingList')
        .where('userID', isEqualTo: userID)
        .where('date',
            isGreaterThanOrEqualTo:
                DateTime(today.year, today.month, today.day))
        .where('date',
            isLessThan: DateTime(today.year, today.month, today.day + 1))
        .orderBy('date')
        .get();

    if (historySnapshot.docs.isNotEmpty) {
      for (var doc in historySnapshot.docs) {
        DateTime docDate = (doc['date'] as Timestamp).toDate();
        if (docDate.year == today.year &&
            docDate.month == today.month &&
            docDate.day == today.day) {
          foundToday = true;

          var todayData = boughtItemsSnapshot.docs
              .where((doc) => doc['bought'] == true)
              .toList();

          if (todayData.isNotEmpty) {
            var dateInfoData = todayData.map((doc) {
              return {
                'name': doc['name'],
                'shop_name': doc['shop_name'],
                'unit': doc['unit'],
                'quantity': doc['quantity'],
                'category': doc['categoryTag'],
              };
            }).toList();

            for (var data in dateInfoData) {
              await firestore
                  .collection('historyShoppingList')
                  .doc(doc.id)
                  .collection('dateInfo')
                  .add(data);
            }

            for (var doc in todayData) {
              await firestore
                  .collection('users')
                  .doc(userID)
                  .collection('Shopping_List')
                  .doc(doc.id)
                  .delete();
            }
          }
        }
      }
    }

    if (!foundToday) {
      var todayData = boughtItemsSnapshot.docs
          .where((doc) => doc['bought'] == true)
          .toList();

      if (todayData.isNotEmpty) {
        DocumentReference newHistoryDocumentRef =
            await firestore.collection('historyShoppingList').add({
          'date': Timestamp.fromDate(today),
          'userID': userID,
        });

        var dateInfoData = todayData.map((doc) {
          return {
            'name': doc['name'],
            'shop_name': doc['shop_name'],
            'unit': doc['unit'],
            'quantity': doc['quantity'],
            'category': doc['categoryTag'],
          };
        }).toList();

        for (var data in dateInfoData) {
          await firestore
              .collection('historyShoppingList')
              .doc(newHistoryDocumentRef.id)
              .collection('dateInfo')
              .add(data);
        }

        for (var doc in todayData) {
          await firestore
              .collection('users')
              .doc(userID)
              .collection('Shopping_List')
              .doc(doc.id)
              .delete();
        }
      }
    }
  }
}
