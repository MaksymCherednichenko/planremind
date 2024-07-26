import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home_modul/kitchen/storage_page/not_field_category/not_field_category_widget.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import 'add_item_household_widget.dart' show AddItemHouseholdWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddItemHouseholdModel extends FlutterFlowModel<AddItemHouseholdWidget> {
  ///  Local state fields for this component.

  int? bottonClick = 10;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'le9phul3' /* Please enter a name */,
      );
    }

    return null;
  }

  // Model for CustomCountController component.
  late CustomCountControllerModel customCountControllerModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    customCountControllerModel =
        createModel(context, () => CustomCountControllerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    customCountControllerModel.dispose();
  }
}