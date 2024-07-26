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

Future checkAndDeleteIfNoSubcollectionData() async {
  // Add your function code here!
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Отримання основних даних
  QuerySnapshot mainDataSnapshot =
      await firestore.collection('historyShoppingList').get();

  // Проходимося по кожному документу в основній колекції
  for (var doc in mainDataSnapshot.docs) {
    String mainDocId = doc.id;

    // Перевіряємо наявність підбази даних для кожного документу
    QuerySnapshot subCollectionSnapshot = await firestore
        .collection('historyShoppingList')
        .doc(mainDocId)
        .collection('dateInfo')
        .get();

    // Якщо немає даних у підбазі, видаляємо основний документ
    if (subCollectionSnapshot.docs.isEmpty) {
      await firestore.collection('historyShoppingList').doc(mainDocId).delete();
    }
  }
}
