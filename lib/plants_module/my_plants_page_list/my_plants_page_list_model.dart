import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/plants_module/add_new_plant_popup/add_new_plant_popup_widget.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import 'my_plants_page_list_widget.dart' show MyPlantsPageListWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPlantsPageListModel extends FlutterFlowModel<MyPlantsPageListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
