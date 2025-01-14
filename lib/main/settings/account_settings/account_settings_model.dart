import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/subscription_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'account_settings_widget.dart' show AccountSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountSettingsModel extends FlutterFlowModel<AccountSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AccountSettings widget.
  UsersRecord? userInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
