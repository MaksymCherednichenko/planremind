import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/menu_select_popup/menu_select_popup_widget.dart';
import '/walkthroughs/home_first_visit.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_planner_page_widget.dart' show HomePlannerPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePlannerPageModel extends FlutterFlowModel<HomePlannerPageWidget> {
  ///  Local state fields for this page.

  List<String> tagClick = [];
  void addToTagClick(String item) => tagClick.add(item);
  void removeFromTagClick(String item) => tagClick.remove(item);
  void removeAtIndexFromTagClick(int index) => tagClick.removeAt(index);
  void insertAtIndexInTagClick(int index, String item) =>
      tagClick.insert(index, item);
  void updateTagClickAtIndex(int index, Function(String) updateFn) =>
      tagClick[index] = updateFn(tagClick[index]);

  List<ListOfDishesRecord> breakfasts = [];
  void addToBreakfasts(ListOfDishesRecord item) => breakfasts.add(item);
  void removeFromBreakfasts(ListOfDishesRecord item) => breakfasts.remove(item);
  void removeAtIndexFromBreakfasts(int index) => breakfasts.removeAt(index);
  void insertAtIndexInBreakfasts(int index, ListOfDishesRecord item) =>
      breakfasts.insert(index, item);
  void updateBreakfastsAtIndex(
          int index, Function(ListOfDishesRecord) updateFn) =>
      breakfasts[index] = updateFn(breakfasts[index]);

  List<ListOfDishesRecord> lunches = [];
  void addToLunches(ListOfDishesRecord item) => lunches.add(item);
  void removeFromLunches(ListOfDishesRecord item) => lunches.remove(item);
  void removeAtIndexFromLunches(int index) => lunches.removeAt(index);
  void insertAtIndexInLunches(int index, ListOfDishesRecord item) =>
      lunches.insert(index, item);
  void updateLunchesAtIndex(int index, Function(ListOfDishesRecord) updateFn) =>
      lunches[index] = updateFn(lunches[index]);

  List<ListOfDishesRecord> dinners = [];
  void addToDinners(ListOfDishesRecord item) => dinners.add(item);
  void removeFromDinners(ListOfDishesRecord item) => dinners.remove(item);
  void removeAtIndexFromDinners(int index) => dinners.removeAt(index);
  void insertAtIndexInDinners(int index, ListOfDishesRecord item) =>
      dinners.insert(index, item);
  void updateDinnersAtIndex(int index, Function(ListOfDishesRecord) updateFn) =>
      dinners[index] = updateFn(dinners[index]);

  List<ListOfDishesRecord> others = [];
  void addToOthers(ListOfDishesRecord item) => others.add(item);
  void removeFromOthers(ListOfDishesRecord item) => others.remove(item);
  void removeAtIndexFromOthers(int index) => others.removeAt(index);
  void insertAtIndexInOthers(int index, ListOfDishesRecord item) =>
      others.insert(index, item);
  void updateOthersAtIndex(int index, Function(ListOfDishesRecord) updateFn) =>
      others[index] = updateFn(others[index]);

  List<int> ind = [];
  void addToInd(int item) => ind.add(item);
  void removeFromInd(int item) => ind.remove(item);
  void removeAtIndexFromInd(int index) => ind.removeAt(index);
  void insertAtIndexInInd(int index, int item) => ind.insert(index, item);
  void updateIndAtIndex(int index, Function(int) updateFn) =>
      ind[index] = updateFn(ind[index]);

  List<int> numOfDocs = [];
  void addToNumOfDocs(int item) => numOfDocs.add(item);
  void removeFromNumOfDocs(int item) => numOfDocs.remove(item);
  void removeAtIndexFromNumOfDocs(int index) => numOfDocs.removeAt(index);
  void insertAtIndexInNumOfDocs(int index, int item) =>
      numOfDocs.insert(index, item);
  void updateNumOfDocsAtIndex(int index, Function(int) updateFn) =>
      numOfDocs[index] = updateFn(numOfDocs[index]);

  int? temp = 0;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeFirstVisitController;
  // Stores action output result for [Backend Call - Read Document] action in HomePlannerPage widget.
  UsersRecord? userInfoOutput;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  DateListOfDishesRecord? todaysListOfDishes;
  // Stores action output result for [Backend Call - Read Document] action in Calendar widget.
  ListOfDishesRecord? breakfast;
  // Stores action output result for [Backend Call - Read Document] action in Calendar widget.
  ListOfDishesRecord? lunch;
  // Stores action output result for [Backend Call - Read Document] action in Calendar widget.
  ListOfDishesRecord? dinner;
  // Stores action output result for [Backend Call - Read Document] action in Calendar widget.
  ListOfDishesRecord? other;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    homeFirstVisitController?.finish();
    appBarModel.dispose();
  }

  /// Action blocks.
  Future initTagClick(BuildContext context) async {
    insertAtIndexInTagClick(0, 'Breakfast');
    insertAtIndexInTagClick(1, 'Lunch');
    insertAtIndexInTagClick(2, 'Dinner');
    insertAtIndexInTagClick(3, 'Other');
  }
}
