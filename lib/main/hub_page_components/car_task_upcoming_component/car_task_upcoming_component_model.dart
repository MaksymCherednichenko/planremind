import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_task_upcoming_component_widget.dart'
    show CarTaskUpcomingComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarTaskUpcomingComponentModel
    extends FlutterFlowModel<CarTaskUpcomingComponentWidget> {
  ///  Local state fields for this component.

  List<CarServiceTaskRecord> eventList = [];
  void addToEventList(CarServiceTaskRecord item) => eventList.add(item);
  void removeFromEventList(CarServiceTaskRecord item) => eventList.remove(item);
  void removeAtIndexFromEventList(int index) => eventList.removeAt(index);
  void insertAtIndexInEventList(int index, CarServiceTaskRecord item) =>
      eventList.insert(index, item);
  void updateEventListAtIndex(
          int index, Function(CarServiceTaskRecord) updateFn) =>
      eventList[index] = updateFn(eventList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in carTaskUpcomingComponent widget.
  List<CarServiceTaskRecord>? allTaskOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
