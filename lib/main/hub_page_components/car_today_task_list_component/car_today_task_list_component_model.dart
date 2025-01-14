import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_today_task_list_component_widget.dart'
    show CarTodayTaskListComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarTodayTaskListComponentModel
    extends FlutterFlowModel<CarTodayTaskListComponentWidget> {
  ///  Local state fields for this component.

  List<CarServiceTaskRecord> todayList = [];
  void addToTodayList(CarServiceTaskRecord item) => todayList.add(item);
  void removeFromTodayList(CarServiceTaskRecord item) => todayList.remove(item);
  void removeAtIndexFromTodayList(int index) => todayList.removeAt(index);
  void insertAtIndexInTodayList(int index, CarServiceTaskRecord item) =>
      todayList.insert(index, item);
  void updateTodayListAtIndex(
          int index, Function(CarServiceTaskRecord) updateFn) =>
      todayList[index] = updateFn(todayList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in carTodayTaskListComponent widget.
  List<CarServiceTaskRecord>? allEventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
