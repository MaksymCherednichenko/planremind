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

Future<ListOfDishesRecord> duplicateDishesAndIngredients(
  DocumentReference collectionPath,
  DateTime newDate,
) async {
  // Add your function code here!
  DocumentSnapshot listOfDishesSnapshot = await collectionPath.get();
  Map<String, dynamic> listOfDishesData =
      listOfDishesSnapshot.data() as Map<String, dynamic>;

  // Отримуємо дані з підколекції
  QuerySnapshot ingredientsSnapshot =
      await collectionPath.collection('ingredientsOfDishes').get();
  List<Map<String, dynamic>> ingredientsData = ingredientsSnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  // Змінюємо значення date в listOfDishes
  listOfDishesData['date'] = Timestamp.fromDate(newDate);

  // Створюємо новий запис в базі даних зі зміненими даними
  DocumentReference newDishesDocumentRef = await FirebaseFirestore.instance
      .collection('listOfDishes')
      .add(listOfDishesData);

  // Додаємо новий запис в підколекцію ingredientsOfDishes
  for (Map<String, dynamic> ingredientData in ingredientsData) {
    await newDishesDocumentRef
        .collection('ingredientsOfDishes')
        .add(ingredientData);
  }

  // Повертаємо новий запис
  return ListOfDishesRecord.fromSnapshot(await newDishesDocumentRef.get());
}
