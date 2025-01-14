import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/new_medication_popup/new_medication_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'today_medication_page_widget.dart' show TodayMedicationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TodayMedicationPageModel
    extends FlutterFlowModel<TodayMedicationPageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDay;

  List<MedicationRecord> todayMedication = [];
  void addToTodayMedication(MedicationRecord item) => todayMedication.add(item);
  void removeFromTodayMedication(MedicationRecord item) =>
      todayMedication.remove(item);
  void removeAtIndexFromTodayMedication(int index) =>
      todayMedication.removeAt(index);
  void insertAtIndexInTodayMedication(int index, MedicationRecord item) =>
      todayMedication.insert(index, item);
  void updateTodayMedicationAtIndex(
          int index, Function(MedicationRecord) updateFn) =>
      todayMedication[index] = updateFn(todayMedication[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TodayMedicationPage widget.
  List<MedicationRecord>? allMedication;
  // Stores action output result for [Custom Action - filterMedicationForDay] action in TodayMedicationPage widget.
  List<MedicationRecord>? filteredMedication;
  // State field(s) for MedicationCalendar widget.
  DateTimeRange? medicationCalendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in MedicationCalendar widget.
  List<MedicationRecord>? allMedication2;
  // Stores action output result for [Custom Action - filterMedicationForDay] action in MedicationCalendar widget.
  List<MedicationRecord>? filteredMedication2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<MedicationRecord>? allMedication3;
  // Stores action output result for [Custom Action - filterMedicationForDay] action in Container widget.
  List<MedicationRecord>? filteredMedication3;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  MedicationsArchiveRecord? medicationCountCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  MedicationsArchiveRecord? medicationCount;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  MedicationsArchiveRecord? createdIte;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<MedicationRecord>? allMedication4;
  // Stores action output result for [Custom Action - filterMedicationForDay] action in FloatingActionButton widget.
  List<MedicationRecord>? filteredMedication4;

  @override
  void initState(BuildContext context) {
    medicationCalendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
