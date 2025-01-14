import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_new_plant_popup_widget.dart' show AddNewPlantPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewPlantPopupModel extends FlutterFlowModel<AddNewPlantPopupWidget> {
  ///  Local state fields for this component.

  WateringFrequencyStruct? wateringFrequency;
  void updateWateringFrequencyStruct(
      Function(WateringFrequencyStruct) updateFn) {
    updateFn(wateringFrequency ??= WateringFrequencyStruct());
  }

  FertilizationFrequencyStruct? fertilizationFrequency;
  void updateFertilizationFrequencyStruct(
      Function(FertilizationFrequencyStruct) updateFn) {
    updateFn(fertilizationFrequency ??= FertilizationFrequencyStruct());
  }

  String? img;

  bool wateringWeekDaySelectorError = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2hwc5gxx' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for amountOfWaterTextField widget.
  FocusNode? amountOfWaterTextFieldFocusNode;
  TextEditingController? amountOfWaterTextFieldTextController;
  String? Function(BuildContext, String?)?
      amountOfWaterTextFieldTextControllerValidator;
  String? _amountOfWaterTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0e77gi1t' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for wateringShemeDropdown widget.
  int? wateringShemeDropdownValue;
  FormFieldController<int>? wateringShemeDropdownValueController;
  // State field(s) for WateringEveryDaysTextField widget.
  FocusNode? wateringEveryDaysTextFieldFocusNode;
  TextEditingController? wateringEveryDaysTextFieldTextController;
  String? Function(BuildContext, String?)?
      wateringEveryDaysTextFieldTextControllerValidator;
  String? _wateringEveryDaysTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4q9m7h7t' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for FertilizationDaysTextField widget.
  FocusNode? fertilizationDaysTextFieldFocusNode;
  TextEditingController? fertilizationDaysTextFieldTextController;
  String? Function(BuildContext, String?)?
      fertilizationDaysTextFieldTextControllerValidator;
  String? _fertilizationDaysTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h24iosxm' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for lightingDropDown widget.
  int? lightingDropDownValue;
  FormFieldController<int>? lightingDropDownValueController;
  // State field(s) for temperatureDropDown widget.
  int? temperatureDropDownValue;
  FormFieldController<int>? temperatureDropDownValueController;
  // State field(s) for solidChangeDropDown widget.
  int? solidChangeDropDownValue;
  FormFieldController<int>? solidChangeDropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PlantsRecord? newPlant;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    amountOfWaterTextFieldTextControllerValidator =
        _amountOfWaterTextFieldTextControllerValidator;
    wateringEveryDaysTextFieldTextControllerValidator =
        _wateringEveryDaysTextFieldTextControllerValidator;
    fertilizationDaysTextFieldTextControllerValidator =
        _fertilizationDaysTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    amountOfWaterTextFieldFocusNode?.dispose();
    amountOfWaterTextFieldTextController?.dispose();

    wateringEveryDaysTextFieldFocusNode?.dispose();
    wateringEveryDaysTextFieldTextController?.dispose();

    fertilizationDaysTextFieldFocusNode?.dispose();
    fertilizationDaysTextFieldTextController?.dispose();
  }
}
