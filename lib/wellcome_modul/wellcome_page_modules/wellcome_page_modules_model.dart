import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'wellcome_page_modules_widget.dart' show WellcomePageModulesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WellcomePageModulesModel
    extends FlutterFlowModel<WellcomePageModulesWidget> {
  ///  Local state fields for this page.

  String nextbtntext = 'Next >';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in WellcomePageModules widget.
  ModuleStatesRecord? moduleStatesIsExist;
  // Stores action output result for [Backend Call - Create Document] action in WellcomePageModules widget.
  ModuleStatesRecord? moduleStatesVarCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in WellcomePageModules widget.
  ModuleStatesRecord? moduleStatesVar;
  // Stores action output result for [Custom Action - updateModuleState] action in WellcomePageModules widget.
  List<ModuleStruct>? moduleList;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  UsersRecord? userOutput;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedHomeDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedHomeAdd;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedCarDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedCarAdd;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedPlantsDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedPlantsAdd;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedHealthDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedHealthAdd;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedPetsDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedPetsAdd;
  // Stores action output result for [Custom Action - updateModuleState] action in deletebtn widget.
  List<ModuleStruct>? updatedSportDelete;
  // Stores action output result for [Custom Action - updateModuleState] action in addbtn widget.
  List<ModuleStruct>? updatedSportAdd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
