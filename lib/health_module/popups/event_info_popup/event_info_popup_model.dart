import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/new_event_popup/new_event_popup_widget.dart';
import 'dart:ui';
import 'event_info_popup_widget.dart' show EventInfoPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventInfoPopupModel extends FlutterFlowModel<EventInfoPopupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for timeTextField widget.
  FocusNode? timeTextFieldFocusNode;
  TextEditingController? timeTextFieldTextController;
  String? Function(BuildContext, String?)? timeTextFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for descriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timeTextFieldFocusNode?.dispose();
    timeTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();
  }
}
