import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_service_history_page_widget.dart' show CarServiceHistoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServiceHistoryPageModel
    extends FlutterFlowModel<CarServiceHistoryPageWidget> {
  ///  Local state fields for this page.

  List<CarServiceTaskHistoryRecord> taskList = [];
  void addToTaskList(CarServiceTaskHistoryRecord item) => taskList.add(item);
  void removeFromTaskList(CarServiceTaskHistoryRecord item) =>
      taskList.remove(item);
  void removeAtIndexFromTaskList(int index) => taskList.removeAt(index);
  void insertAtIndexInTaskList(int index, CarServiceTaskHistoryRecord item) =>
      taskList.insert(index, item);
  void updateTaskListAtIndex(
          int index, Function(CarServiceTaskHistoryRecord) updateFn) =>
      taskList[index] = updateFn(taskList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CarServiceHistoryPage widget.
  List<CarServiceTaskHistoryRecord>? list;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskHistoryRecord>? list3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
