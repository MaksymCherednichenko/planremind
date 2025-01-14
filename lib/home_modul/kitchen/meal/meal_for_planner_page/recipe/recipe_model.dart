import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/custom_components/check_box/check_box_widget.dart';
import '/custom_components/switcher_home_shop/switcher_home_shop_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/meal/delete_meal/delete_meal_widget.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/addingridientspopup/addingridientspopup_widget.dart';
import 'dart:ui';
import 'recipe_widget.dart' show RecipeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecipeModel extends FlutterFlowModel<RecipeWidget> {
  ///  Local state fields for this page.

  bool isEditMode = false;

  String? name;

  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for checkBoxSite.
  late CheckBoxModel checkBoxSiteModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for checkBoxVideo.
  late CheckBoxModel checkBoxVideoModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    checkBoxSiteModel = createModel(context, () => CheckBoxModel());
    checkBoxVideoModel = createModel(context, () => CheckBoxModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    checkBoxSiteModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    checkBoxVideoModel.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
