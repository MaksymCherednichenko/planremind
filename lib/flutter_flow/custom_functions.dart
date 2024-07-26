import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

Color setColorForItemInStock(bool itemInStock) {
  if (itemInStock) {
    return Color.fromRGBO(128, 127, 254, 1);
  } else {
    return Color.fromRGBO(245, 127, 68, 1);
  }
}

DateTime increaseDate(
  DateTime inputDate,
  int dayNum,
) {
  return inputDate.add(Duration(days: dayNum));
}

DateTime getDateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

List<DateTime>? dateRange(
  DateTime firstDate,
  DateTime? secondDate,
) {
  if (secondDate != null) {
    // Якщо secondDate не null, генеруємо список дат
    List<DateTime> dateList = [];
    for (DateTime date = firstDate;
        date.isBefore(secondDate);
        date = date.add(Duration(days: 1))) {
      dateList.add(date);
    }
    // Додаємо і останню дату (secondDate)
    dateList.add(secondDate);

    return dateList;
  } else {
    // Якщо secondDate null, повертаємо null
    return null;
  }
}

List<DateTime> createMonthsYear() {
  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime(currentDate.year + 1, currentDate.month, 1);

  List<DateTime> monthsList = [];

  while (currentDate.isBefore(endDate)) {
    monthsList.add(DateTime(currentDate.year, currentDate.month, 1));
    currentDate = DateTime(currentDate.year, currentDate.month + 1, 1);
  }

  return monthsList;
}

DateTime monthOnly(DateTime date) {
  DateTime currentDate = DateTime.now();
  return DateTime(currentDate.year, date.month, 1);
}

DateTime buildFullDate(
  String date,
  String month,
  String year,
) {
  DateTime dateTime =
      DateTime(int.parse(year), int.parse(month), int.parse(date));
  return dateTime;
}

int calculateDaysDifference(
  DateTime startDate,
  DateTime endDate,
) {
  Duration difference = endDate.difference(startDate);

  // Перетворюємо різницю в днях (truncateToDays обрізає години, хвилини та секунди)
  int daysDifference = difference.inDays;

  return daysDifference;
}

bool? getModuleState(
  List<ModuleStruct> moduleList,
  Module name,
) {
  var item = moduleList.where((element) => element.name == name);
  if (item.isNotEmpty) return item.first.active;
  return false;
}

bool hasActiveModules(List<ModuleStruct> modules) {
  for (var e in modules) if (e.active == true) return true;
  return false;
}

int getPercentageOfSparePart(
  int a,
  int b,
  int realMilleage,
) {
  return (realMilleage - a) ~/ ((b - a) ~/ 100);
}

int minus(
  int a,
  int b,
) {
  return a - b;
}

int sum(
  int a,
  int b,
) {
  return a + b;
}

int toInt(String str) {
  return int.parse(str);
}
