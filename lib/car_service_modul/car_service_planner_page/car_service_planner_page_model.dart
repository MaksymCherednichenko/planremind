import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/car_service_planner.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_service_planner_page_widget.dart' show CarServicePlannerPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServicePlannerPageModel
    extends FlutterFlowModel<CarServicePlannerPageWidget> {
  ///  Local state fields for this page.

  List<CarServiceTaskRecord> todaylist = [];
  void addToTodaylist(CarServiceTaskRecord item) => todaylist.add(item);
  void removeFromTodaylist(CarServiceTaskRecord item) => todaylist.remove(item);
  void removeAtIndexFromTodaylist(int index) => todaylist.removeAt(index);
  void insertAtIndexInTodaylist(int index, CarServiceTaskRecord item) =>
      todaylist.insert(index, item);
  void updateTodaylistAtIndex(
          int index, Function(CarServiceTaskRecord) updateFn) =>
      todaylist[index] = updateFn(todaylist[index]);

  int currentCardIndex = 0;

  bool isEmpty = true;

  List<CarsRecord> myCars = [];
  void addToMyCars(CarsRecord item) => myCars.add(item);
  void removeFromMyCars(CarsRecord item) => myCars.remove(item);
  void removeAtIndexFromMyCars(int index) => myCars.removeAt(index);
  void insertAtIndexInMyCars(int index, CarsRecord item) =>
      myCars.insert(index, item);
  void updateMyCarsAtIndex(int index, Function(CarsRecord) updateFn) =>
      myCars[index] = updateFn(myCars[index]);

  List<CarServiceTaskRecord> tomorrowList = [];
  void addToTomorrowList(CarServiceTaskRecord item) => tomorrowList.add(item);
  void removeFromTomorrowList(CarServiceTaskRecord item) =>
      tomorrowList.remove(item);
  void removeAtIndexFromTomorrowList(int index) => tomorrowList.removeAt(index);
  void insertAtIndexInTomorrowList(int index, CarServiceTaskRecord item) =>
      tomorrowList.insert(index, item);
  void updateTomorrowListAtIndex(
          int index, Function(CarServiceTaskRecord) updateFn) =>
      tomorrowList[index] = updateFn(tomorrowList[index]);

  List<CarServiceTaskRecord> upcomingList = [];
  void addToUpcomingList(CarServiceTaskRecord item) => upcomingList.add(item);
  void removeFromUpcomingList(CarServiceTaskRecord item) =>
      upcomingList.remove(item);
  void removeAtIndexFromUpcomingList(int index) => upcomingList.removeAt(index);
  void insertAtIndexInUpcomingList(int index, CarServiceTaskRecord item) =>
      upcomingList.insert(index, item);
  void updateUpcomingListAtIndex(
          int index, Function(CarServiceTaskRecord) updateFn) =>
      upcomingList[index] = updateFn(upcomingList[index]);

  bool allEventsShow = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? carServicePlannerController;
  // Stores action output result for [Backend Call - Read Document] action in CarServicePlannerPage widget.
  UsersRecord? userInfoOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in CarServicePlannerPage widget.
  List<CarServiceTaskRecord>? todayTaskOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in CarServicePlannerPage widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in CarServicePlannerPage widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in CarServicePlannerPage widget.
  List<CarsRecord>? allCars;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  int? carCount;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<CarServiceTaskRecord>? todayTaskOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<CarsRecord>? allCars2;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? todayTasks3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput5;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput5;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarsRecord>? allCars5;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? todayTaskOutput4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarsRecord>? allCars4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? todayTaskOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarsRecord>? allCars3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? todayTaskOutput6;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? tomorrowTaskOutput6;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarServiceTaskRecord>? upcomingTaskOutput6;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarsRecord>? allCars6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carServicePlannerController?.finish();
  }
}
