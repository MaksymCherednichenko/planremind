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

Future<List<PlantsRecord>> filterPlantsForTodayAction(
    List<PlantsRecord> list) async {
  List<PlantsRecord> todelete = [];
  list.forEach((e) {
    if (toWateringPlantToday(e) == false &&
        toFertilizationPlantToday(e) == false &&
        toSolidChangePlantForToday(e) == false) todelete.add(e);
  });
  todelete.forEach((e) => list.remove(e));
  return list;
  // Add your function code here!
}
