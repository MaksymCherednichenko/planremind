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

List<PlantsRecord> filterPlantsForTomorrow(List<PlantsRecord> plantlistparam) {
  List<PlantsRecord> plantlist = List.from(plantlistparam);
  List<PlantsRecord> todelete = [];
  var today = DateTime.now();
  var tomorrow = DateTime(today.year, today.month, today.day);
  tomorrow.add(Duration(days: 1));
  plantlist.forEach((e) {
    if (e.wateringFrequency.scheme ==
        FrequencySchemeEnum.EveryXDay) // every x day
    if (tomorrow.difference(e.wateringFrequency.lastDate!).inDays %
            (e.wateringFrequency.everyXDay + 1) !=
        0) todelete.add(e);
    if (e.wateringFrequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek) //
    if (e.wateringFrequency.dayOfWeek.contains(tomorrow.weekday) == false)
      todelete.add(e);
  });
  todelete.forEach((e) => plantlist.remove(e));
  return plantlist;
}

bool checkPetEventForADateFunction(
  PetsEventRecord item,
  DateTime date,
) {
  if (getDateOnly(item.date!) == getDateOnly(date))
    return true;
  else if (item.frequencyType == EventTypeEnum.regular) {
    int k = 1;
    if (item.dateType == DateTypesEnum.week) k = 7;
    if (item.dateType == DateTypesEnum.month) k = 30;
    if (item.dateType == DateTypesEnum.year) k = 365;
    if (getDateOnly(item.date!).difference(getDateOnly(date)).inDays %
            (k *
                (item.repeat +
                    ((item.dateType == DateTypesEnum.day) ? 1 : 0))) ==
        0) return true;
  }
  return false;
}

List<PetsEventRecord> filterPetsEventForADateRangeFunction(
  List<PetsEventRecord> list,
  List<DateTime> date,
) {
  List<PetsEventRecord> newList = [];
  list.forEach((e) {
    for (var i = 0; i < date.length; i++) {
      if (checkPetEventForADateFunction(e, date[i])) {
        newList.add(e);

        break;
      }
    }
  });

  return newList;
}

List<PlantsRecord> filterPlantsUpcoming(List<PlantsRecord> plantlistparam) {
  List<PlantsRecord> plantlist = List.from(plantlistparam);
  List<PlantsRecord> todelete = [];
  var today = DateTime.now();
  var upcoming = DateTime(today.year, today.month, today.day + 2);
  plantlist.forEach((e) {
    if (e.wateringFrequency.scheme ==
        FrequencySchemeEnum.EveryXDay) // every x day
    if (upcoming.difference(e.wateringFrequency.lastDate!).inDays %
            (e.wateringFrequency.everyXDay + 1) <
        3) todelete.add(e);
    if (e.wateringFrequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek) {
      var dltFlag = true;
      e.wateringFrequency.dayOfWeek.forEach((day) {
        if ((upcoming.weekday - day).abs() <= 3) dltFlag = false;
      });
      if (dltFlag) todelete.add(e);
    }
  });
  todelete.forEach((e) => plantlist.remove(e));
  return plantlist;
}

List<PlantsRecord> filterPlantsForToday(List<PlantsRecord> plantlistparam) {
  List<PlantsRecord> plantlist = List.from(plantlistparam);
  List<PlantsRecord> todelete = [];
  var today = DateTime.now();
  plantlist.forEach((e) {
    if (e.wateringFrequency.scheme ==
        FrequencySchemeEnum.EveryXDay) // every x day
    if (today.difference(e.wateringFrequency.lastDate!).inDays %
            (e.wateringFrequency.everyXDay + 1) !=
        0) todelete.add(e);
    if (e.wateringFrequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek) //
    if (e.wateringFrequency.dayOfWeek.contains(today.weekday) == false)
      todelete.add(e);
  });
  todelete.forEach((e) => plantlist.remove(e));
  return plantlist;
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
  ModulesEnum name,
) {
  var item = moduleList.where((element) => element.name == name);
  if (item.isNotEmpty) return item.first.active;
  return false;
}

bool hasActiveModules(List<ModuleStruct> modules) {
  for (var e in modules) if (e.active == true) return true;
  return false;
}

List<DateTime> getDatesFromServiceTaskHistoryCollection(
    List<CarServiceTaskHistoryRecord> list) {
  list.sort((a, b) => a.date!.compareTo(b.date!));

  List<DateTime> dates = [];
  if (list.isNotEmpty) {
    DateTime lastTime = list.elementAt(0).date!;
    dates.add(lastTime);
    for (var i = 0; i < list.length; i++) {
      if (lastTime != list.elementAt(i).date) {
        lastTime = list.elementAt(i).date!;
        dates.add(lastTime);
      }
    }
  }
  return dates;
}

int getPercentageOfSparePart(
  int a,
  int b,
  int realMilleage,
) {
  return (realMilleage - a) ~/ (b ~/ 100);
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

List<DateTime> getDatesFromServiceTaskCollection(
    List<CarServiceTaskRecord> list) {
  list.sort((a, b) => a.date!.compareTo(b.date!));

  List<DateTime> dates = [];
  if (list.isNotEmpty) {
    DateTime lastTime = list.elementAt(0).date!;
    dates.add(lastTime);
    for (var i = 0; i < list.length; i++) {
      if (lastTime != list.elementAt(i).date) {
        lastTime = list.elementAt(i).date!;
        dates.add(lastTime);
      }
    }
  }
  return dates;
}

List<DateTime> getTimeListForMedicationEvents(List<HealthEventRecord> events) {
  List<DateTime> timeList = [];

  events.forEach((e) {
    if (e.time != null) if (!timeList.contains(getDateOnly(e.time!)))
      timeList.add(getDateOnly(e.time!));
  });

  return timeList;
}

DateTime getTomorrowDate() {
  var nowDate = DateTime.now();
  var tomorrowDate = nowDate.add(new Duration(days: 1));
  return DateTime(tomorrowDate.year, tomorrowDate.month, tomorrowDate.day);
}

List<PlantsRecord> filterPlantsForADay(
  List<PlantsRecord> plantlistparam,
  DateTime day,
) {
  List<PlantsRecord> plantlist = List.from(plantlistparam);
  List<PlantsRecord> todelete = [];
  var today = day;
  plantlist.forEach((e) {
    if (e.wateringFrequency.scheme ==
        FrequencySchemeEnum.EveryXDay) // every x day
    if (today.difference(e.wateringFrequency.lastDate!).inDays %
            (e.wateringFrequency.everyXDay + 1) !=
        0) todelete.add(e);
    if (e.wateringFrequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek) //
    if (e.wateringFrequency.dayOfWeek.contains(today.weekday) == false)
      todelete.add(e);
  });
  todelete.forEach((e) => plantlist.remove(e));
  return plantlist;
}

bool toWateringPlantToday(PlantsRecord plant) {
  var today = DateTime.now();
  if (plant.wateringFrequency.scheme == FrequencySchemeEnum.EveryDay)
    return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.EveryXDay) // every x day
  if ((today.difference(plant.wateringFrequency.lastDate!).inDays - 1) %
          (plant.wateringFrequency.everyXDay) ==
      0) return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.SpecificDayOfWeek) //
  if (plant.wateringFrequency.dayOfWeek.contains(today.weekday)) return true;
  return false;
}

bool toWateringPlantTomorrow(PlantsRecord plant) {
  var today = DateTime.now();
  var tomorrow = DateTime(today.year, today.month, today.day + 1);
  if (plant.wateringFrequency.scheme == FrequencySchemeEnum.EveryDay)
    return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.EveryXDay) // every x day
  if (tomorrow.difference(plant.wateringFrequency.lastDate!).inDays %
          (plant.wateringFrequency.everyXDay + 1) ==
      0) return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.SpecificDayOfWeek) //
  if (plant.wateringFrequency.dayOfWeek.contains(tomorrow.weekday)) return true;
  return false;
}

bool toWateringPlantUpcoming(PlantsRecord plant) {
  var today = DateTime.now();
  var upcoming = DateTime(today.year, today.month, today.day + 2);
  if (plant.wateringFrequency.scheme == FrequencySchemeEnum.EveryDay)
    return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.EveryXDay) // every x day
  if ((upcoming.difference(plant.wateringFrequency.lastDate!).inDays %
              (plant.wateringFrequency.everyXDay + 1) ==
          0) ||
      ((upcoming.difference(plant.wateringFrequency.lastDate!).inDays + 1) %
              (plant.wateringFrequency.everyXDay + 1) ==
          0) ||
      ((upcoming.difference(plant.wateringFrequency.lastDate!).inDays + 2) %
              (plant.wateringFrequency.everyXDay + 1) ==
          0)) return true;
  if (plant.wateringFrequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek) {
    //specific day of week
    var flag = false;
    plant.wateringFrequency.dayOfWeek.forEach((day) {
      var diff = day - upcoming.weekday;
      if (diff < 0) diff += 7;
      if (diff <= 3) flag = true;
    });
    if (flag) return true;
  }

  return false;
}

bool toFertilizationPlantToday(PlantsRecord plant) {
  try {
    var today = DateTime.now();
    if (today
                .difference(plant.fertilizationFrequency.lastFertilization!)
                .inDays %
            (plant.fertilizationFrequency.everyXDay + 1) ==
        0) return true;
    return false;
  } catch (_) {
    return false;
  }
}

bool toFertilizationTomorrow(PlantsRecord plant) {
  try {
    var today = DateTime.now();
    var tomorrow = DateTime(today.year, today.month, today.day + 1);
    if (tomorrow
                .difference(plant.fertilizationFrequency.lastFertilization!)
                .inDays %
            (plant.fertilizationFrequency.everyXDay + 1) ==
        0) return true;
    return false;
  } catch (_) {
    return false;
  }
}

bool toFertilizationPlantUpcoming(PlantsRecord plant) {
  try {
    var today = DateTime.now();
    var upcoming = DateTime(today.year, today.month, today.day + 2);
    if ((upcoming
                    .difference(plant.fertilizationFrequency.lastFertilization!)
                    .inDays %
                (plant.fertilizationFrequency.everyXDay + 1) ==
            0) ||
        (upcoming
                    .difference(plant.fertilizationFrequency.lastFertilization!)
                    .inDays +
                1 % (plant.fertilizationFrequency.everyXDay + 1) ==
            0) ||
        (upcoming
                    .difference(plant.fertilizationFrequency.lastFertilization!)
                    .inDays +
                2 % (plant.fertilizationFrequency.everyXDay + 1) ==
            0)) return true;
    return false;
  } catch (_) {
    return false;
  }
}

bool toSolidChangePlantForToday(PlantsRecord plant) {
  try {
    var daysInYear = 365;
    var today = DateTime.now();
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryTwoYears) daysInYear *= 2;
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryThreeYears) daysInYear *= 3;
    if (today.difference(plant.solidChangeFrequency.lastChange!).inDays ==
        daysInYear) return true;

    return false;
  } catch (_) {
    return false;
  }
}

bool toSolidChangePlantTomorrow(PlantsRecord plant) {
  try {
    var daysInYear = 365;
    var today = DateTime.now();
    var tomorrow = DateTime(today.year, today.month, today.day);
    tomorrow.add(Duration(days: 1));
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryTwoYears) daysInYear *= 2;
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryThreeYears) daysInYear *= 3;
    if (today.difference(plant.solidChangeFrequency.lastChange!).inDays ==
        daysInYear) return true;

    return false;
  } catch (_) {
    return false;
  }
}

bool toSolidChangePlantUpcoming(PlantsRecord plant) {
  try {
    var daysInYear = 365;
    var today = DateTime.now();
    var upcoming = DateTime(today.year, today.month, today.day);
    upcoming.add(Duration(days: 2));
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryTwoYears) daysInYear *= 2;
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryThreeYears) daysInYear *= 3;
    var lastDate = plant.solidChangeFrequency.lastChange!;
    lastDate.add(Duration(days: daysInYear));
    if (lastDate.difference(upcoming).inDays >= 0 &&
        lastDate.difference(upcoming).inDays < 3) return true;

    return false;
  } catch (_) {
    return false;
  }
}

bool toFertilizationPlantForADay(
  PlantsRecord plant,
  DateTime day,
) {
  try {
    var today = day;
    if (today
                .difference(plant.fertilizationFrequency.lastFertilization!)
                .inDays %
            (plant.fertilizationFrequency.everyXDay + 1) ==
        0) return true;
    return false;
  } catch (_) {
    return false;
  }
}

DateTime dateAddDays(
  DateTime date,
  int days,
) {
  return date.add(Duration(days: days));
}

DateTime getModayDate(DateTime date) {
  date = date.subtract(Duration(days: date.weekday));
  date = date.add(Duration(days: 1));
  return date;
}

int getWeekDay(DateTime date) {
  return date.weekday;
}

bool toUseMedication(
  MedicationRecord medication,
  DateTime date,
) {
  if (medication.frequency.scheme == FrequencySchemeEnum.OnceAtSpecificDate &&
      date.difference(medication.frequency.specificDay!).inDays == 0)
    return true;

  if (date.compareTo(medication.frequency.lastDate!) == -1) return false;
  if (date.difference(medication.frequency.lastDate!).inDays >
      medication.duration - 1) return false;

  if (medication.frequency.scheme == FrequencySchemeEnum.EveryDay ||
      medication.frequency.scheme == FrequencySchemeEnum.XTimesADay)
    return true;
  if ((medication.frequency.scheme == FrequencySchemeEnum.EveryXDay) &&
      ((date.difference(medication.frequency.lastDate!).inDays %
              medication.frequency.everyXDays) ==
          0)) return true;
  if (medication.frequency.scheme == FrequencySchemeEnum.SpecificDayOfWeek &&
      medication.frequency.daysOfWeek.contains(date.weekday) == true)
    return true;
  return false;
}

bool toSolidChangePlantForADay(
  PlantsRecord plant,
  DateTime date,
) {
  try {
    var daysInYear = 365;
    var today = date;
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryTwoYears) daysInYear *= 2;
    if (plant.solidChangeFrequency.frequency ==
        FrequencySolidChangeEnum.onceEveryThreeYears) daysInYear *= 3;
    if (today.difference(plant.solidChangeFrequency.lastChange!).inDays ==
        daysInYear) return true;

    return false;
  } catch (_) {
    return false;
  }
}

List<MedicationUsageTimeStruct> toggleUseageFlagonTimeList(
  List<MedicationUsageTimeStruct> list,
  MedicationUsageTimeStruct time,
) {
  list.forEach((e) {
    if (e == time) e.isUseg = !e.isUseg;
  });
  return list;
}

bool medicationIsUsed(List<MedicationUsageTimeStruct> list) {
  for (var e in list) {
    if (e.isUseg == false) return false;
  }
  return true;
}

List<DateTime> getTimeListForMedicationHistoryEvents(
    List<HealthEventArchiveRecord> events) {
  List<DateTime> timeList = [];

  events.forEach((e) {
    if (e.date != null) if (!timeList.contains(getDateOnly(e.date!)))
      timeList.add(getDateOnly(e.date!));
  });

  return timeList;
}

List<DateTime> getTimeListForMedications(
    List<MedicationsArchiveRecord> medications) {
  List<DateTime> timeList = [];

  medications.forEach((e) {
    if (e.date != null) if (!timeList.contains(getDateOnly(e.date!)))
      timeList.add(getDateOnly(e.date!));
  });

  return timeList;
}

bool toWateringPlantForADay(
  PlantsRecord plant,
  DateTime day,
) {
  var today = day;
  if (plant.wateringFrequency.scheme == FrequencySchemeEnum.EveryDay)
    return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.EveryXDay) // every x day
  if ((today.difference(plant.wateringFrequency.lastDate!).inDays - 1) %
          (plant.wateringFrequency.everyXDay) ==
      0) return true;
  if (plant.wateringFrequency.scheme ==
      FrequencySchemeEnum.SpecificDayOfWeek) //
  if (plant.wateringFrequency.dayOfWeek.contains(today.weekday)) return true;
  return false;
}

List<PetsEventRecord> filterPetsEventByDateFunction(
  List<PetsEventRecord> list,
  DateTime date,
) {
  List<PetsEventRecord> newList = [];
  list.forEach((e) {
    if (checkPetEventForADateFunction(e, date)) newList.add(e);
  });
  return newList;
}

List<DateTime> getDatesFromPetEventsFunction(List<PetsEventRecord> list) {
  list.sort((a, b) => a.date!.compareTo(b.date!));

  List<DateTime> dates = [];
  if (list.isNotEmpty) {
    DateTime lastTime = getDateOnly(list.elementAt(0).date!);
    dates.add(lastTime);
    list.forEach((e) {
      if (lastTime != getDateOnly(e.date!)) {
        lastTime = getDateOnly(e.date!);
        dates.add(lastTime);
      }
    });
  }
  return dates;
}

List<DateTime> generateDatesList(
  DateTime fromDate,
  int numberOfDates,
  int step,
) {
  List<DateTime> list = [];
  for (var i = 0; i < numberOfDates; i++) {
    list.add(dateAddDays(fromDate, i));
  }
  return list;
}

bool isMedicationUsedAtTime(
  List<MedicationUsageTimeStruct> listOfUsedTime,
  DateTime atTime,
) {
  for (var i = 0; i < listOfUsedTime.length; i++)
    if (listOfUsedTime[i].time.hour == atTime.hour &&
        listOfUsedTime[i].time.minute == atTime.minute &&
        listOfUsedTime[i].isUseg) return true;
  return false;
}

DateTime setHourForDate(
  DateTime date,
  int hour,
) {
  var newDate = date.copyWith(hour: hour);
  return newDate;
}

bool hasDoubleMedicationTime(List<MedicationUsageTimeStruct> list) {
  for (var i = 1; i < list.length; i++) {
    if (list
            .where((e) => (e.time.hour == list[i].time.hour &&
                e.time.minute == list[i].time.minute))
            .length >
        1) return true;
  }
  return false;
}

double sumDouble(
  double a,
  double b,
) {
  return a + b;
}

double minusDouble(
  double a,
  double b,
) {
  return a - b;
}

bool stringHasSpacesOnly(String line) {
  for (var i = 0; i < line.length; i++) {
    if (line[i] != " ") return false;
  }

  return true;
}
