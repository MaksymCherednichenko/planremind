import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'editingridientspopup_shopping_widget.dart'
    show EditingridientspopupShoppingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditingridientspopupShoppingModel
    extends FlutterFlowModel<EditingridientspopupShoppingWidget> {
  ///  Local state fields for this component.

  int? buttonClick = 10;

  int? categoryColorClick = 0;

  String categoryTag = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for CustomCountController component.
  late CustomCountControllerModel customCountControllerModel;
  // State field(s) for TextField widget.
  final textFieldKey2 = GlobalKey();
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? textFieldSelectedOption2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - createSortListFromShopNames] action in Button widget.
  List<String>? updatedSortList;
  // Stores action output result for [Custom Action - createSortListFromShopNames] action in Button widget.
  List<String>? deletedSortList;

  @override
  void initState(BuildContext context) {
    customCountControllerModel =
        createModel(context, () => CustomCountControllerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    customCountControllerModel.dispose();
    textFieldFocusNode2?.dispose();
  }
}
