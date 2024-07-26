import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/planner.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_planner_page_widget.dart' show HomePlannerPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
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

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? plannerController;
  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ListOfDishesRecord? newListOfDishes;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    plannerController?.finish();
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future initTagClick(BuildContext context) async {
    insertAtIndexInTagClick(0, 'Breakfast');
    insertAtIndexInTagClick(1, 'Lunch');
    insertAtIndexInTagClick(2, 'Dinner');
    insertAtIndexInTagClick(3, 'Other');
  }
}
