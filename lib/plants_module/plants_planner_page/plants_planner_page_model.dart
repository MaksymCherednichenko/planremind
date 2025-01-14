import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import '/walkthroughs/plants_first_enter.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'plants_planner_page_widget.dart' show PlantsPlannerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantsPlannerPageModel extends FlutterFlowModel<PlantsPlannerPageWidget> {
  ///  Local state fields for this page.

  List<PlantsRecord> todayList = [];
  void addToTodayList(PlantsRecord item) => todayList.add(item);
  void removeFromTodayList(PlantsRecord item) => todayList.remove(item);
  void removeAtIndexFromTodayList(int index) => todayList.removeAt(index);
  void insertAtIndexInTodayList(int index, PlantsRecord item) =>
      todayList.insert(index, item);
  void updateTodayListAtIndex(int index, Function(PlantsRecord) updateFn) =>
      todayList[index] = updateFn(todayList[index]);

  int currentCardIndex = 0;

  bool isEmpty = false;

  List<PlantsRecord> tomorrowList = [];
  void addToTomorrowList(PlantsRecord item) => tomorrowList.add(item);
  void removeFromTomorrowList(PlantsRecord item) => tomorrowList.remove(item);
  void removeAtIndexFromTomorrowList(int index) => tomorrowList.removeAt(index);
  void insertAtIndexInTomorrowList(int index, PlantsRecord item) =>
      tomorrowList.insert(index, item);
  void updateTomorrowListAtIndex(int index, Function(PlantsRecord) updateFn) =>
      tomorrowList[index] = updateFn(tomorrowList[index]);

  List<PlantsRecord> upcomingList = [];
  void addToUpcomingList(PlantsRecord item) => upcomingList.add(item);
  void removeFromUpcomingList(PlantsRecord item) => upcomingList.remove(item);
  void removeAtIndexFromUpcomingList(int index) => upcomingList.removeAt(index);
  void insertAtIndexInUpcomingList(int index, PlantsRecord item) =>
      upcomingList.insert(index, item);
  void updateUpcomingListAtIndex(int index, Function(PlantsRecord) updateFn) =>
      upcomingList[index] = updateFn(upcomingList[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? plantsFirstEnterController;
  // Stores action output result for [Backend Call - Read Document] action in PlantsPlannerPage widget.
  UsersRecord? userInfoOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PlantsPlannerPage widget.
  List<PlantsRecord>? allPlants;
  // Stores action output result for [Custom Action - filterPlantsForTodayAction] action in PlantsPlannerPage widget.
  List<PlantsRecord>? filteredTodayList;
  // Stores action output result for [Custom Action - filterPlantsForTomorrowAction] action in PlantsPlannerPage widget.
  List<PlantsRecord>? filteredTomorrowList;
  // Stores action output result for [Custom Action - filterPlantsUpcomingAction] action in PlantsPlannerPage widget.
  List<PlantsRecord>? filteredUpcomingList;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PlantsRecord>? allPlants2;
  // Stores action output result for [Custom Action - filterPlantsForTodayAction] action in Column widget.
  List<PlantsRecord>? filteredTodayList2;
  // Stores action output result for [Custom Action - filterPlantsForTomorrowAction] action in Column widget.
  List<PlantsRecord>? filteredTomorrowList2;
  // Stores action output result for [Custom Action - filterPlantsUpcomingAction] action in Column widget.
  List<PlantsRecord>? filteredUpcomingList2;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PlantsRecord>? allPlants3;
  // Stores action output result for [Custom Action - filterPlantsForTodayAction] action in Column widget.
  List<PlantsRecord>? filteredTodayList3;
  // Stores action output result for [Custom Action - filterPlantsForTomorrowAction] action in Column widget.
  List<PlantsRecord>? filteredTomorrowList3;
  // Stores action output result for [Custom Action - filterPlantsUpcomingAction] action in Column widget.
  List<PlantsRecord>? filteredUpcomingList3;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<PlantsRecord>? allPlants4;
  // Stores action output result for [Custom Action - filterPlantsForTodayAction] action in Row widget.
  List<PlantsRecord>? filteredTodayList4;
  // Stores action output result for [Custom Action - filterPlantsForTomorrowAction] action in Row widget.
  List<PlantsRecord>? filteredTomorrowList4;
  // Stores action output result for [Custom Action - filterPlantsUpcomingAction] action in Row widget.
  List<PlantsRecord>? filteredUpcomingList4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    plantsFirstEnterController?.finish();
  }

  /// Action blocks.
  Future updateAll(BuildContext context) async {
    List<PlantsRecord>? plants;
    List<PlantsRecord>? todayList;
    List<PlantsRecord>? tomorrowList;
    List<PlantsRecord>? upcomingList;

    plants = await queryPlantsRecordOnce(
      parent: FFAppState().currentUserRef,
    );
    todayList = await actions.filterPlantsForTodayAction(
      plants!.toList(),
    );
    tomorrowList = await actions.filterPlantsForTomorrowAction(
      plants!.toList(),
    );
    upcomingList = await actions.filterPlantsUpcomingAction(
      plants!.toList(),
    );
    todayList = todayList!.toList().cast<PlantsRecord>();
    if (currentCardIndex >= todayList.length) {
      currentCardIndex = 0;
    }
  }
}
