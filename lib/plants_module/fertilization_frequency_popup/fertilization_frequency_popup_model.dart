import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'fertilization_frequency_popup_widget.dart'
    show FertilizationFrequencyPopupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FertilizationFrequencyPopupModel
    extends FlutterFlowModel<FertilizationFrequencyPopupWidget> {
  ///  Local state fields for this component.

  FertilizationFrequencyStruct? frequency;
  void updateFrequencyStruct(Function(FertilizationFrequencyStruct) updateFn) {
    updateFn(frequency ??= FertilizationFrequencyStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
