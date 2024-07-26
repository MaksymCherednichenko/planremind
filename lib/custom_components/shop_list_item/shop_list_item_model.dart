import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/check_box/check_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shop_list_item_widget.dart' show ShopListItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopListItemModel extends FlutterFlowModel<ShopListItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for checkBox component.
  late CheckBoxModel checkBoxModel;

  @override
  void initState(BuildContext context) {
    checkBoxModel = createModel(context, () => CheckBoxModel());
  }

  @override
  void dispose() {
    checkBoxModel.dispose();
  }
}
