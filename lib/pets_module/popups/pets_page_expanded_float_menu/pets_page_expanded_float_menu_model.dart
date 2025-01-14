import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pets_module/popups/add_pets_popup/add_pets_popup_widget.dart';
import 'dart:ui';
import 'pets_page_expanded_float_menu_widget.dart'
    show PetsPageExpandedFloatMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsPageExpandedFloatMenuModel
    extends FlutterFlowModel<PetsPageExpandedFloatMenuWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
