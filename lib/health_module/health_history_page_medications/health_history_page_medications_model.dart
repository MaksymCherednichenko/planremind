import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/medication_actions/medication_actions_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_history_page_medications_widget.dart'
    show HealthHistoryPageMedicationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthHistoryPageMedicationsModel
    extends FlutterFlowModel<HealthHistoryPageMedicationsWidget> {
  ///  Local state fields for this page.

  List<DateTime> dates = [];
  void addToDates(DateTime item) => dates.add(item);
  void removeFromDates(DateTime item) => dates.remove(item);
  void removeAtIndexFromDates(int index) => dates.removeAt(index);
  void insertAtIndexInDates(int index, DateTime item) =>
      dates.insert(index, item);
  void updateDatesAtIndex(int index, Function(DateTime) updateFn) =>
      dates[index] = updateFn(dates[index]);

  List<MedicationsArchiveRecord> allmedications = [];
  void addToAllmedications(MedicationsArchiveRecord item) =>
      allmedications.add(item);
  void removeFromAllmedications(MedicationsArchiveRecord item) =>
      allmedications.remove(item);
  void removeAtIndexFromAllmedications(int index) =>
      allmedications.removeAt(index);
  void insertAtIndexInAllmedications(
          int index, MedicationsArchiveRecord item) =>
      allmedications.insert(index, item);
  void updateAllmedicationsAtIndex(
          int index, Function(MedicationsArchiveRecord) updateFn) =>
      allmedications[index] = updateFn(allmedications[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HealthHistoryPageMedications widget.
  List<MedicationsArchiveRecord>? allMedicationOutput;
  // Stores action output result for [Bottom Sheet - medicationActions] action in Container widget.
  bool? res;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<MedicationsArchiveRecord>? allMedicationOutput2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
