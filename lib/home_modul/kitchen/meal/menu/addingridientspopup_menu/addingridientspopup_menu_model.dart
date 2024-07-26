import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import 'addingridientspopup_menu_widget.dart'
    show AddingridientspopupMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddingridientspopupMenuModel
    extends FlutterFlowModel<AddingridientspopupMenuWidget> {
  ///  Local state fields for this component.

  int? buttonClick = 10;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CustomCountController component.
  late CustomCountControllerModel customCountControllerModel;

  @override
  void initState(BuildContext context) {
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