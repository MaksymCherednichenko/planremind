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

Future<bool> isNewUser(String uid) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentSnapshot userSnapshot =
          await firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        dynamic userData = userSnapshot.data();

        if (userData is Map && userData['created_time'] != null) {
          Timestamp createdTime = userData['created_time'];

          if (createdTime is Timestamp) {
            DateTime now = DateTime.now();
            DateTime userCreationTime = createdTime.toDate();

            return now.difference(userCreationTime).inHours < 24;
          }
        }
      }
    }
  } catch (e) {
    print('Error checking user status: $e');
  }

  return false;
}
