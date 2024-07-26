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

Future<List<MenuItemIngredientsRecord>?> getMenuIngredientsReferences(
    DocumentReference menuCollectionRef) async {
  // Add your function code here!
  try {
    QuerySnapshot menuItemIngredientsSnapshot =
        await menuCollectionRef.collection('menuItemIngredients').get();

    List<MenuItemIngredientsRecord> references = menuItemIngredientsSnapshot
        .docs
        .map((doc) => MenuItemIngredientsRecord.fromSnapshot(doc))
        .toList();

    return references;
  } catch (e) {
    print('Помилка при отриманні референсів: $e');
    return null;
  }
}
