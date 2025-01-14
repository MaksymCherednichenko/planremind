import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/add_pets_event_popup/add_pets_event_popup_widget.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import '/walkthroughs/pets_first_enter.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'pets_planner_page_widget.dart' show PetsPlannerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsPlannerPageModel extends FlutterFlowModel<PetsPlannerPageWidget> {
  ///  Local state fields for this page.

  List<PetsEventRecord> todayList = [];
  void addToTodayList(PetsEventRecord item) => todayList.add(item);
  void removeFromTodayList(PetsEventRecord item) => todayList.remove(item);
  void removeAtIndexFromTodayList(int index) => todayList.removeAt(index);
  void insertAtIndexInTodayList(int index, PetsEventRecord item) =>
      todayList.insert(index, item);
  void updateTodayListAtIndex(int index, Function(PetsEventRecord) updateFn) =>
      todayList[index] = updateFn(todayList[index]);

  List<PetsRecord> pets = [];
  void addToPets(PetsRecord item) => pets.add(item);
  void removeFromPets(PetsRecord item) => pets.remove(item);
  void removeAtIndexFromPets(int index) => pets.removeAt(index);
  void insertAtIndexInPets(int index, PetsRecord item) =>
      pets.insert(index, item);
  void updatePetsAtIndex(int index, Function(PetsRecord) updateFn) =>
      pets[index] = updateFn(pets[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? petsFirstEnterController;
  // Stores action output result for [Backend Call - Read Document] action in PetsPlannerPage widget.
  UsersRecord? userInfoOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PetsPlannerPage widget.
  List<PetsEventRecord>? eventsOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PetsPlannerPage widget.
  List<PetsRecord>? petsOutput;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<PetsEventRecord>? eventsOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<PetsRecord>? petsOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<PetsEventRecord>? eventsOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<PetsRecord>? petsOutput3;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    petsFirstEnterController?.finish();
  }
}
