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

Future<List<String>> createSortListFromShopNames(List<String>? setShops) async {
  // Add your function code here!
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  List<String> sortList = [];
  if (setShops != null) {
    sortList.addAll(setShops);
  }

  if (user != null) {
    String uid = user.uid;

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .doc(uid)
          .collection('Shopping_List')
          .get();

      List<String> shopListFromDB = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        shopListFromDB.add(document.data()['shop_name']);
      }

      for (var item in shopListFromDB) {
        if (!sortList.contains(item) && item != "") {
          sortList.add(item);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  return sortList;
}
