import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'my_car_popup_widget.dart' show MyCarPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyCarPopupModel extends FlutterFlowModel<MyCarPopupWidget> {
  ///  Local state fields for this component.

  String photo =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-team-project-2gydmv/assets/as14jz04l540/pngaaa.com-791768.png';

  bool showImgPath = false;

  int deleteIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<CarServiceTaskHistoryRecord>? history;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<CarServiceTaskRecord>? taskList;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<CarSparePartsRecord>? spareList;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
