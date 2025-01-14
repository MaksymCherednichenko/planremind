import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pets_event_info_popup_widget.dart' show PetsEventInfoPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsEventInfoPopupModel
    extends FlutterFlowModel<PetsEventInfoPopupWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedPet;

  ///  State fields for stateful widgets in this component.

  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  // State field(s) for EventSelectDropDown widget.
  int? eventSelectDropDownValue;
  FormFieldController<int>? eventSelectDropDownValueController;
  // State field(s) for VetAddressTextField widget.
  FocusNode? vetAddressTextFieldFocusNode;
  TextEditingController? vetAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      vetAddressTextFieldTextControllerValidator;
  String? _vetAddressTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7be40w63' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for VetDoctorTextField widget.
  FocusNode? vetDoctorTextFieldFocusNode;
  TextEditingController? vetDoctorTextFieldTextController;
  String? Function(BuildContext, String?)?
      vetDoctorTextFieldTextControllerValidator;
  String? _vetDoctorTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'byyj1jyr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for GroomingAddressTextField widget.
  FocusNode? groomingAddressTextFieldFocusNode;
  TextEditingController? groomingAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      groomingAddressTextFieldTextControllerValidator;
  String? _groomingAddressTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sp7dajao' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for GroomingMasterTextField widget.
  FocusNode? groomingMasterTextFieldFocusNode;
  TextEditingController? groomingMasterTextFieldTextController;
  String? Function(BuildContext, String?)?
      groomingMasterTextFieldTextControllerValidator;
  String? _groomingMasterTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pp7heuju' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ShopNameTextField widget.
  FocusNode? shopNameTextFieldFocusNode;
  TextEditingController? shopNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      shopNameTextFieldTextControllerValidator;
  String? _shopNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9au0xyh5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ProductTextField widget.
  FocusNode? productTextFieldFocusNode;
  TextEditingController? productTextFieldTextController;
  String? Function(BuildContext, String?)?
      productTextFieldTextControllerValidator;
  String? _productTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'div6d5r1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for VaccinationClinicAddressTextField widget.
  FocusNode? vaccinationClinicAddressTextFieldFocusNode;
  TextEditingController? vaccinationClinicAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      vaccinationClinicAddressTextFieldTextControllerValidator;
  String? _vaccinationClinicAddressTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lajl3cls' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for VaccinationDoctorTextField widget.
  FocusNode? vaccinationDoctorTextFieldFocusNode;
  TextEditingController? vaccinationDoctorTextFieldTextController;
  String? Function(BuildContext, String?)?
      vaccinationDoctorTextFieldTextControllerValidator;
  String? _vaccinationDoctorTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'miwq8oj7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for MedicationTextField widget.
  FocusNode? medicationTextFieldFocusNode;
  TextEditingController? medicationTextFieldTextController;
  String? Function(BuildContext, String?)?
      medicationTextFieldTextControllerValidator;
  String? _medicationTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4by5ix0u' /* Field is required */,
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
        'zvfn7jw9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DoseDropDown widget.
  String? doseDropDownValue;
  FormFieldController<String>? doseDropDownValueController;
  // State field(s) for TimeTextField widget.
  FocusNode? timeTextFieldFocusNode;
  TextEditingController? timeTextFieldTextController;
  String? Function(BuildContext, String?)? timeTextFieldTextControllerValidator;
  String? _timeTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lg8tpool' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for frequencyTextField widget.
  FocusNode? frequencyTextFieldFocusNode;
  TextEditingController? frequencyTextFieldTextController;
  String? Function(BuildContext, String?)?
      frequencyTextFieldTextControllerValidator;
  // State field(s) for DateTypeDropDown widget.
  int? dateTypeDropDownValue;
  FormFieldController<int>? dateTypeDropDownValueController;

  @override
  void initState(BuildContext context) {
    vetAddressTextFieldTextControllerValidator =
        _vetAddressTextFieldTextControllerValidator;
    vetDoctorTextFieldTextControllerValidator =
        _vetDoctorTextFieldTextControllerValidator;
    groomingAddressTextFieldTextControllerValidator =
        _groomingAddressTextFieldTextControllerValidator;
    groomingMasterTextFieldTextControllerValidator =
        _groomingMasterTextFieldTextControllerValidator;
    shopNameTextFieldTextControllerValidator =
        _shopNameTextFieldTextControllerValidator;
    productTextFieldTextControllerValidator =
        _productTextFieldTextControllerValidator;
    vaccinationClinicAddressTextFieldTextControllerValidator =
        _vaccinationClinicAddressTextFieldTextControllerValidator;
    vaccinationDoctorTextFieldTextControllerValidator =
        _vaccinationDoctorTextFieldTextControllerValidator;
    medicationTextFieldTextControllerValidator =
        _medicationTextFieldTextControllerValidator;
    doseTextFieldTextControllerValidator =
        _doseTextFieldTextControllerValidator;
    timeTextFieldTextControllerValidator =
        _timeTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    vetAddressTextFieldFocusNode?.dispose();
    vetAddressTextFieldTextController?.dispose();

    vetDoctorTextFieldFocusNode?.dispose();
    vetDoctorTextFieldTextController?.dispose();

    groomingAddressTextFieldFocusNode?.dispose();
    groomingAddressTextFieldTextController?.dispose();

    groomingMasterTextFieldFocusNode?.dispose();
    groomingMasterTextFieldTextController?.dispose();

    shopNameTextFieldFocusNode?.dispose();
    shopNameTextFieldTextController?.dispose();

    productTextFieldFocusNode?.dispose();
    productTextFieldTextController?.dispose();

    vaccinationClinicAddressTextFieldFocusNode?.dispose();
    vaccinationClinicAddressTextFieldTextController?.dispose();

    vaccinationDoctorTextFieldFocusNode?.dispose();
    vaccinationDoctorTextFieldTextController?.dispose();

    medicationTextFieldFocusNode?.dispose();
    medicationTextFieldTextController?.dispose();

    doseTextFieldFocusNode?.dispose();
    doseTextFieldTextController?.dispose();

    timeTextFieldFocusNode?.dispose();
    timeTextFieldTextController?.dispose();

    frequencyTextFieldFocusNode?.dispose();
    frequencyTextFieldTextController?.dispose();
  }
}
