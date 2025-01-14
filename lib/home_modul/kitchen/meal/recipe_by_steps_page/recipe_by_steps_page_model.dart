import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/step_description/step_description_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'recipe_by_steps_page_widget.dart' show RecipeByStepsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecipeByStepsPageModel extends FlutterFlowModel<RecipeByStepsPageWidget> {
  ///  Local state fields for this page.

  List<int> stepOpacity = [];
  void addToStepOpacity(int item) => stepOpacity.add(item);
  void removeFromStepOpacity(int item) => stepOpacity.remove(item);
  void removeAtIndexFromStepOpacity(int index) => stepOpacity.removeAt(index);
  void insertAtIndexInStepOpacity(int index, int item) =>
      stepOpacity.insert(index, item);
  void updateStepOpacityAtIndex(int index, Function(int) updateFn) =>
      stepOpacity[index] = updateFn(stepOpacity[index]);

  int? indOpacity;

  String? siteLink = '';

  String? videoLink = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for siteCheckbox widget.
  bool? siteCheckboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for videoCheckbox widget.
  bool? videoCheckboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for stepDescription dynamic component.
  late FlutterFlowDynamicModels<StepDescriptionModel> stepDescriptionModels;

  @override
  void initState(BuildContext context) {
    stepDescriptionModels =
        FlutterFlowDynamicModels(() => StepDescriptionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    stepDescriptionModels.dispose();
  }
}
