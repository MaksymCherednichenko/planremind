import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/settings/edit_category_household/edit_category_household_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'settings_storage_household_categories_widget.dart'
    show SettingsStorageHouseholdCategoriesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsStorageHouseholdCategoriesModel
    extends FlutterFlowModel<SettingsStorageHouseholdCategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - reorderItem] action in ListView widget.
  List<String>? updatedList;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
