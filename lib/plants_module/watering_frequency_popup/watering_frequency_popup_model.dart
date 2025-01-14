import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'watering_frequency_popup_widget.dart' show WateringFrequencyPopupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WateringFrequencyPopupModel
    extends FlutterFlowModel<WateringFrequencyPopupWidget> {
  ///  Local state fields for this component.

  WateringFrequencyStruct? frequency;
  void updateFrequencyStruct(Function(WateringFrequencyStruct) updateFn) {
    updateFn(frequency ??= WateringFrequencyStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for wateringShemeDropdown widget.
  int? wateringShemeDropdownValue;
  FormFieldController<int>? wateringShemeDropdownValueController;
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
