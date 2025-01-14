import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/addingridientspopup/addingridientspopup_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_new_meal_widget.dart' show AddNewMealWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewMealModel extends FlutterFlowModel<AddNewMealWidget> {
  ///  Local state fields for this page.

  int? ind = 0;

  int? tag = 0;

  ListOfDishesRecord? dish;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n8rl6eu6' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ListOfDishesRecord? dishOutput;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
