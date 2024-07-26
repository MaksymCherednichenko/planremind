import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/birthdays/add_birthday/add_birthday_widget.dart';
import '/home_modul/birthdays/edit_birthday/edit_birthday_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'birthdays_contacts_page_widget.dart' show BirthdaysContactsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BirthdaysContactsPageModel
    extends FlutterFlowModel<BirthdaysContactsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
