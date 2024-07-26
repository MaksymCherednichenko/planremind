import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/calendar_popup/calendar_popup_widget.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_menu_to_plan_popup_widget.dart' show AddMenuToPlanPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMenuToPlanPopupModel
    extends FlutterFlowModel<AddMenuToPlanPopupWidget> {
  ///  Local state fields for this component.

  int? buttonClick = 10;

  int? index = 0;

  int? numOfItems = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ListOfDishesRecord? newMeal;
  // Stores action output result for [Custom Action - getMenuIngredientsReferences] action in Button widget.
  List<MenuItemIngredientsRecord>? ingredientsMenu;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
