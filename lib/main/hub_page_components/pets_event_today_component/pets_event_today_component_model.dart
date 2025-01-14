import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pets_event_today_component_widget.dart'
    show PetsEventTodayComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsEventTodayComponentModel
    extends FlutterFlowModel<PetsEventTodayComponentWidget> {
  ///  Local state fields for this component.

  List<PetsEventRecord> todayEvents = [];
  void addToTodayEvents(PetsEventRecord item) => todayEvents.add(item);
  void removeFromTodayEvents(PetsEventRecord item) => todayEvents.remove(item);
  void removeAtIndexFromTodayEvents(int index) => todayEvents.removeAt(index);
  void insertAtIndexInTodayEvents(int index, PetsEventRecord item) =>
      todayEvents.insert(index, item);
  void updateTodayEventsAtIndex(
          int index, Function(PetsEventRecord) updateFn) =>
      todayEvents[index] = updateFn(todayEvents[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in petsEventTodayComponent widget.
  List<PetsEventRecord>? allEventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
