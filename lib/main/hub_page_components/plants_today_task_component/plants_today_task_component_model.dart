import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'plants_today_task_component_widget.dart'
    show PlantsTodayTaskComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantsTodayTaskComponentModel
    extends FlutterFlowModel<PlantsTodayTaskComponentWidget> {
  ///  Local state fields for this component.

  List<PlantsRecord> todayList = [];
  void addToTodayList(PlantsRecord item) => todayList.add(item);
  void removeFromTodayList(PlantsRecord item) => todayList.remove(item);
  void removeAtIndexFromTodayList(int index) => todayList.removeAt(index);
  void insertAtIndexInTodayList(int index, PlantsRecord item) =>
      todayList.insert(index, item);
  void updateTodayListAtIndex(int index, Function(PlantsRecord) updateFn) =>
      todayList[index] = updateFn(todayList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in plantsTodayTaskComponent widget.
  List<PlantsRecord>? allPlantsOutput;
  // Stores action output result for [Custom Action - filterPlantsForTodayAction] action in plantsTodayTaskComponent widget.
  List<PlantsRecord>? filteredPlantsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
