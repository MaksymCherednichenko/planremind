import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pets_history_page_widget.dart' show PetsHistoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsHistoryPageModel extends FlutterFlowModel<PetsHistoryPageWidget> {
  ///  Local state fields for this page.

  List<PetsEventRecord> historyEventsList = [];
  void addToHistoryEventsList(PetsEventRecord item) =>
      historyEventsList.add(item);
  void removeFromHistoryEventsList(PetsEventRecord item) =>
      historyEventsList.remove(item);
  void removeAtIndexFromHistoryEventsList(int index) =>
      historyEventsList.removeAt(index);
  void insertAtIndexInHistoryEventsList(int index, PetsEventRecord item) =>
      historyEventsList.insert(index, item);
  void updateHistoryEventsListAtIndex(
          int index, Function(PetsEventRecord) updateFn) =>
      historyEventsList[index] = updateFn(historyEventsList[index]);

  List<PetsRecord> pets = [];
  void addToPets(PetsRecord item) => pets.add(item);
  void removeFromPets(PetsRecord item) => pets.remove(item);
  void removeAtIndexFromPets(int index) => pets.removeAt(index);
  void insertAtIndexInPets(int index, PetsRecord item) =>
      pets.insert(index, item);
  void updatePetsAtIndex(int index, Function(PetsRecord) updateFn) =>
      pets[index] = updateFn(pets[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PetsHistoryPage widget.
  List<PetsEventRecord>? allEventsOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PetsHistoryPage widget.
  List<PetsRecord>? allPetsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
