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

Future createUpcomingData() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    String uid = user.uid;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot itemsSnapshot = await firestore
          .collection('users')
          .doc(uid)
          .collection('Add_Item_Library')
          .get();

      for (var doc in itemsSnapshot.docs) {
        if (doc.exists) {
          String name =
              doc['name'] ?? ''; // Use default value if 'name' doesn't exist
          DateTime endDate = (doc['end_date'] as Timestamp?)?.toDate() ??
              DateTime.now(); // Use default value if 'end_date' doesn't exist
          String itemID = doc.id;

          QuerySnapshot dateSnapshot = await firestore
              .collection('upcomingData')
              .where('date', isEqualTo: Timestamp.fromDate(endDate))
              .where('userID', isEqualTo: uid)
              .get();

          if (dateSnapshot.docs.isEmpty) {
            DocumentReference newDateDocRef =
                await firestore.collection('upcomingData').add({
              'date': Timestamp.fromDate(endDate),
              'userID': uid,
            });

            await firestore
                .collection('upcomingData')
                .doc(newDateDocRef.id)
                .collection('upcomingNames')
                .add({
              'name': name,
              'item_id': itemID,
            });
          } else {
            for (var dateDoc in dateSnapshot.docs) {
              QuerySnapshot namesSnapshot = await firestore
                  .collection('upcomingData')
                  .doc(dateDoc.id)
                  .collection('upcomingNames')
                  .where('name', isEqualTo: name)
                  .get();

              if (namesSnapshot.docs.isEmpty) {
                await firestore
                    .collection('upcomingData')
                    .doc(dateDoc.id)
                    .collection('upcomingNames')
                    .add({
                  'name': name,
                  'item_id': itemID,
                });
              }
            }
          }
        } else {
          print('Document does not exist.');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
