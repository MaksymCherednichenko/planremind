import '/backend/backend.dart';
import '/car_service_modul/add_car_popup/add_car_popup_widget.dart';
import '/custom_components/delete/delete_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'car_service_information_page_widget.dart'
    show CarServiceInformationPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServiceInformationPageModel
    extends FlutterFlowModel<CarServiceInformationPageWidget> {
  ///  Local state fields for this page.

  int? showInfo = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
