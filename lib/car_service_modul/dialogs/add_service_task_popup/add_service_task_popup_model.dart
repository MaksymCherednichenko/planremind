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
import 'add_service_task_popup_widget.dart' show AddServiceTaskPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddServiceTaskPopupModel
    extends FlutterFlowModel<AddServiceTaskPopupWidget> {
  ///  Local state fields for this component.

  CarsRecord? car;

  DateTime? selectedDate;

  DocumentReference? selectedCar;

  bool isPublicForm = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in addServiceTaskPopup widget.
  CarsRecord? carOutput;
  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for placeTextField widget.
  FocusNode? placeTextFieldFocusNode;
  TextEditingController? placeTextFieldTextController;
  String? Function(BuildContext, String?)?
      placeTextFieldTextControllerValidator;
  // State field(s) for descriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  // State field(s) for carDropDown widget.
  String? carDropDownValue;
  FormFieldController<String>? carDropDownValueController;
  // State field(s) for dateTextField widget.
  FocusNode? dateTextFieldFocusNode;
  TextEditingController? dateTextFieldTextController;
  String? Function(BuildContext, String?)? dateTextFieldTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CarServiceTaskRecord? createdItemOuptut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    placeTextFieldFocusNode?.dispose();
    placeTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();

    dateTextFieldFocusNode?.dispose();
    dateTextFieldTextController?.dispose();
  }
}
