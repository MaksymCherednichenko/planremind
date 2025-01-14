import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'settings_modules_widget.dart' show SettingsModulesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModulesModel extends FlutterFlowModel<SettingsModulesWidget> {
  ///  Local state fields for this page.

  DocumentReference? modulesDoc;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? homeDisable;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? carDisable;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? plantsDisable;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? healthDisable;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? petsDisable;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // Stores action output result for [Action Block - updateModuleState] action in Switch widget.
  bool? sportDisable;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
