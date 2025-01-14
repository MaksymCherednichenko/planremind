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

Future<List<DateTime>> getSortedUniqueDates(List<SportRecord> sports) async {
  // Add your function code here!
  // Якщо список порожній або null, повертаємо порожній список
  if (sports == null || sports.isEmpty) {
    return [];
  }

  // Створюємо список для дат
  List<DateTime> dates = [];

  // Проходимося по кожному запису в sports
  for (var sport in sports) {
    DateTime? date = sport.dateTime; // Поле може бути null

    // Перевіряємо, чи date не є null
    if (date != null) {
      // Обрізаємо час, залишаючи лише дату з часом 00:00:00
      DateTime onlyDate = DateTime(date.year, date.month, date.day);

      // Додаємо дату до списку, якщо її там ще немає
      if (!dates.contains(onlyDate)) {
        dates.add(onlyDate);
      }
    }
  }

  // Сортуємо список дат
  dates.sort((a, b) => a.compareTo(b));

  return dates;
}
