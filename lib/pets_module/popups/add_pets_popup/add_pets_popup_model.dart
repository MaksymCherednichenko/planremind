import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_pets_popup_widget.dart' show AddPetsPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPetsPopupModel extends FlutterFlowModel<AddPetsPopupWidget> {
  ///  Local state fields for this component.

  String? img = '';

  MyColorsEnum? selectedColor = MyColorsEnum.red;

  int loopIndex = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PetsEventRecord>? eventsToDelete;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PetsEatingPlanTimeRecord>? planListToDelete;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's20pixxz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for BirthdayTextField widget.
  FocusNode? birthdayTextFieldFocusNode;
  TextEditingController? birthdayTextFieldTextController;
  String? Function(BuildContext, String?)?
      birthdayTextFieldTextControllerValidator;
  String? _birthdayTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5h5e10dh' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for PetsTypeDropDown widget.
  int? petsTypeDropDownValue;
  FormFieldController<int>? petsTypeDropDownValueController;
  // State field(s) for BreedTextField widget.
  FocusNode? breedTextFieldFocusNode;
  TextEditingController? breedTextFieldTextController;
  String? Function(BuildContext, String?)?
      breedTextFieldTextControllerValidator;
  String? _breedTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6rlv9a4n' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for WeightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldTextController;
  String? Function(BuildContext, String?)?
      weightTextFieldTextControllerValidator;
  String? _weightTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wapc0gpu' /* Field is required */,
      );
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    birthdayTextFieldTextControllerValidator =
        _birthdayTextFieldTextControllerValidator;
    breedTextFieldTextControllerValidator =
        _breedTextFieldTextControllerValidator;
    weightTextFieldTextControllerValidator =
        _weightTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    birthdayTextFieldFocusNode?.dispose();
    birthdayTextFieldTextController?.dispose();

    breedTextFieldFocusNode?.dispose();
    breedTextFieldTextController?.dispose();

    weightTextFieldFocusNode?.dispose();
    weightTextFieldTextController?.dispose();
  }
}
