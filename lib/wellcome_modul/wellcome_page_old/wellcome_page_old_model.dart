import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wellcome_modul/add_units_of_measurement/add_units_of_measurement_widget.dart';
import '/wellcome_modul/select_language/select_language_widget.dart';
import 'dart:ui';
import 'wellcome_page_old_widget.dart' show WellcomePageOldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WellcomePageOldModel extends FlutterFlowModel<WellcomePageOldWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in WellcomePageOld widget.
  int? numOfDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
