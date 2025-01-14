import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_module/popups/event_info_popup/event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_event_upcoming_component_widget.dart'
    show HealthEventUpcomingComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthEventUpcomingComponentModel
    extends FlutterFlowModel<HealthEventUpcomingComponentWidget> {
  ///  Local state fields for this component.

  List<HealthEventRecord> healtEventList = [];
  void addToHealtEventList(HealthEventRecord item) => healtEventList.add(item);
  void removeFromHealtEventList(HealthEventRecord item) =>
      healtEventList.remove(item);
  void removeAtIndexFromHealtEventList(int index) =>
      healtEventList.removeAt(index);
  void insertAtIndexInHealtEventList(int index, HealthEventRecord item) =>
      healtEventList.insert(index, item);
  void updateHealtEventListAtIndex(
          int index, Function(HealthEventRecord) updateFn) =>
      healtEventList[index] = updateFn(healtEventList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in healthEventUpcomingComponent widget.
  List<HealthEventRecord>? allEventListOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
