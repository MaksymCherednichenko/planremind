import '/auth/firebase_auth/auth_util.dart';
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
import 'new_medication_popup_widget.dart' show NewMedicationPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewMedicationPopupModel
    extends FlutterFlowModel<NewMedicationPopupWidget> {
  ///  Local state fields for this component.

  MedicationFrequencyStruct? medicationFrequency;
  void updateMedicationFrequencyStruct(
      Function(MedicationFrequencyStruct) updateFn) {
    updateFn(medicationFrequency ??= MedicationFrequencyStruct());
  }

  bool timeError = false;

  bool weekSelectorError = false;

  int loopIndex = 0;

  int currentFrequencyIndex = 1;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wiqh8b0n' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for DaysTextField widget.
  FocusNode? daysTextFieldFocusNode;
  TextEditingController? daysTextFieldTextController;
  String? Function(BuildContext, String?)? daysTextFieldTextControllerValidator;
  String? _daysTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e69tjyhr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SpecificDateTextField widget.
  FocusNode? specificDateTextFieldFocusNode;
  TextEditingController? specificDateTextFieldTextController;
  String? Function(BuildContext, String?)?
      specificDateTextFieldTextControllerValidator;
  String? _specificDateTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'czqzq4jl' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DurationTextField widget.
  FocusNode? durationTextFieldFocusNode;
  TextEditingController? durationTextFieldTextController;
  String? Function(BuildContext, String?)?
      durationTextFieldTextControllerValidator;
  String? _durationTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g3ln7f2w' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for doseTextField widget.
  FocusNode? doseTextFieldFocusNode;
  TextEditingController? doseTextFieldTextController;
  String? Function(BuildContext, String?)? doseTextFieldTextControllerValidator;
  String? _doseTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qkoofji1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DoseDropDown widget.
  String? doseDropDownValue;
  FormFieldController<String>? doseDropDownValueController;
  // State field(s) for NotificationsEnambleSwitch widget.
  bool? notificationsEnambleSwitchValue;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    daysTextFieldTextControllerValidator =
        _daysTextFieldTextControllerValidator;
    specificDateTextFieldTextControllerValidator =
        _specificDateTextFieldTextControllerValidator;
    durationTextFieldTextControllerValidator =
        _durationTextFieldTextControllerValidator;
    doseTextFieldTextControllerValidator =
        _doseTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    daysTextFieldFocusNode?.dispose();
    daysTextFieldTextController?.dispose();

    specificDateTextFieldFocusNode?.dispose();
    specificDateTextFieldTextController?.dispose();

    durationTextFieldFocusNode?.dispose();
    durationTextFieldTextController?.dispose();

    doseTextFieldFocusNode?.dispose();
    doseTextFieldTextController?.dispose();
  }

  /// Action blocks.
  Future<bool?> hasDoubleTime(BuildContext context) async {
    if (medicationFrequency!.timeOfUsage.length > 1) {
      loopIndex = 1;
      while (loopIndex < medicationFrequency!.timeOfUsage.length) {
        if (dateTimeFormat(
              "Hm",
              (medicationFrequency?.timeOfUsage?.elementAtOrNull(loopIndex))
                  ?.time,
              locale: FFLocalizations.of(context).languageCode,
            ) ==
            dateTimeFormat(
              "Hm",
              (medicationFrequency?.timeOfUsage
                      ?.elementAtOrNull(functions.minus(loopIndex, 1)))
                  ?.time,
              locale: FFLocalizations.of(context).languageCode,
            )) {
          return true;
        }
        loopIndex = loopIndex + 1;
      }
    }
    return false;
  }
}
