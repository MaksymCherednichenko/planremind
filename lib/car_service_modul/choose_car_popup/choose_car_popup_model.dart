import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'choose_car_popup_widget.dart' show ChooseCarPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseCarPopupModel extends FlutterFlowModel<ChooseCarPopupWidget> {
  ///  Local state fields for this component.

  DocumentReference? car;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<CarsRecord, bool> checkboxValueMap = {};
  List<CarsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
