import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/new_event_popup/new_event_popup_widget.dart';
import '/walkthroughs/health_first_enter.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_planner_page_widget.dart' show HealthPlannerPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthPlannerPageModel extends FlutterFlowModel<HealthPlannerPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? healthFirstEnterController;
  // Stores action output result for [Backend Call - Read Document] action in HealthPlannerPage widget.
  UsersRecord? userInfoOutput;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for Checkbox widget.
  Map<HealthEventRecord, bool> checkboxValueMap = {};
  List<HealthEventRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  HealthEventArchiveRecord? historyCheck;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    healthFirstEnterController?.finish();
  }
}
