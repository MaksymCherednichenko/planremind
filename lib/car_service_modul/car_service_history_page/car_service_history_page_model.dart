import '/backend/backend.dart';
import '/car_service_modul/add_service_task_popup/add_service_task_popup_widget.dart';
import '/car_service_modul/service_task_info_popup/service_task_info_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'car_service_history_page_widget.dart' show CarServiceHistoryPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServiceHistoryPageModel
    extends FlutterFlowModel<CarServiceHistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
