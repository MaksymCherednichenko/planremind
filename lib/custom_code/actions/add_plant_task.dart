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

Future addPlantTask() async {
  // Add your function code here!
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;

  if (user != null) {
    final String uid = user.uid;
    final CollectionReference plantsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('plants');
    final CollectionReference tasksCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('plantScheduledTask');

    // Отримуємо дані про рослини з бази даних
    final QuerySnapshot plantsSnapshot = await plantsCollection.get();

    plantsSnapshot.docs.forEach((plantDoc) async {
      final String name = plantDoc['name'];
      final String wateringFrequency = plantDoc['wateringFrequency'];

      // Перевіряємо, чи вже існують завдання для цієї рослини
      final QuerySnapshot existingTasksSnapshot =
          await tasksCollection.where('title', arrayContains: name).get();

      // Отримуємо поточну дату
      final DateTime currentDate = DateTime.now();
      // Зберігаємо дату без часу
      final DateTime currentDateTime =
          DateTime(currentDate.year, currentDate.month, currentDate.day);

      // Визначаємо дату для нового завдання залежно від частоти поливу
      DateTime scheduledDate;

      switch (wateringFrequency) {
        case "Every day":
        case "Кожен день":
          scheduledDate = currentDateTime.add(Duration(days: 1));
          break;
        case "Every two days":
        case "Кожні два дні":
          scheduledDate = currentDateTime.add(Duration(days: 2));
          break;
        case "Twice a week":
        case "Двічі на тиждень":
          scheduledDate = currentDateTime
              .add(Duration(days: 3)); // Наприклад, поливати через кожні 3 дні
          break;
        case "Once a week":
        case "Раз на тиждень":
          scheduledDate = currentDateTime.add(Duration(days: 7));
          break;
        default:
          scheduledDate = currentDateTime.add(Duration(
              days: 1)); // За замовчуванням, поливати на наступний день
          break;
      }

      // Отримуємо документ з такою датою, якщо він існує
      final QuerySnapshot existingDateSnapshot =
          await tasksCollection.where('date', isEqualTo: scheduledDate).get();

      if (existingDateSnapshot.docs.isNotEmpty) {
        // Оновлюємо існуючий документ, додаючи назву рослини до списку
        final String existingDocId = existingDateSnapshot.docs.first.id;
        final List<dynamic> existingTitles =
            existingDateSnapshot.docs.first['title'];

        // Перевіряємо, чи назва рослини ще не міститься в списку
        if (!existingTitles.contains(name)) {
          existingTitles.add(name);

          await tasksCollection.doc(existingDocId).update({
            'title': existingTitles,
          });
        }
      } else {
        // Створюємо новий документ
        await tasksCollection.add({
          'date': scheduledDate,
          'title': [name],
        });
      }
    });
  }
}
