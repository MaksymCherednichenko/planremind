import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/car_service_modul/add_car_mileage_popup/add_car_mileage_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/mst2/mst2_widget.dart';
import '/walkthroughs/ftue.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'hub_page_widget.dart' show HubPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HubPageModel extends FlutterFlowModel<HubPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? ftueController;
  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HubPage widget.
  SettingsCategoryAndShopRecord? userSettings;
  // Stores action output result for [Firestore Query - Query a collection] action in HubPage widget.
  List<CarsRecord>? car;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ftueController?.finish();
    unfocusNode.dispose();
  }
}
