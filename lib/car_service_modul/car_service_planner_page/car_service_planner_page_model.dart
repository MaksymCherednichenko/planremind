import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/car_service_modul/add_service_task_popup/add_service_task_popup_widget.dart';
import '/car_service_modul/service_task_info_popup/service_task_info_popup_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/car_service.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_service_planner_page_widget.dart' show CarServicePlannerPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServicePlannerPageModel
    extends FlutterFlowModel<CarServicePlannerPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? carServiceController;
  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    carServiceController?.finish();
    unfocusNode.dispose();
  }
}
