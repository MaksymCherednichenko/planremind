import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_module/popups/event_info_popup/event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_task_today_component_widget.dart'
    show HealthTaskTodayComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthTaskTodayComponentModel
    extends FlutterFlowModel<HealthTaskTodayComponentWidget> {
  ///  Local state fields for this component.

  List<HealthEventRecord> healthTodayEventList = [];
  void addToHealthTodayEventList(HealthEventRecord item) =>
      healthTodayEventList.add(item);
  void removeFromHealthTodayEventList(HealthEventRecord item) =>
      healthTodayEventList.remove(item);
  void removeAtIndexFromHealthTodayEventList(int index) =>
      healthTodayEventList.removeAt(index);
  void insertAtIndexInHealthTodayEventList(int index, HealthEventRecord item) =>
      healthTodayEventList.insert(index, item);
  void updateHealthTodayEventListAtIndex(
          int index, Function(HealthEventRecord) updateFn) =>
      healthTodayEventList[index] = updateFn(healthTodayEventList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in healthTaskTodayComponent widget.
  List<HealthEventRecord>? allEventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
