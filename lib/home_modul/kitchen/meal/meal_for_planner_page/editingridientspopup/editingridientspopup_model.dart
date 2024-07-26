import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'editingridientspopup_widget.dart' show EditingridientspopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditingridientspopupModel
    extends FlutterFlowModel<EditingridientspopupWidget> {
  ///  Local state fields for this component.

  int? buttonClick = 10;

  double? oldQuantity;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in editingridientspopup widget.
  List<AddItemLibraryRecord>? allFoodInStock;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CustomCountController component.
  late CustomCountControllerModel customCountControllerModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AddItemLibraryRecord? chooseFoodInStock;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AddItemLibraryRecord? chooseFoodInStockDelete;

  @override
  void initState(BuildContext context) {
    customCountControllerModel =
        createModel(context, () => CustomCountControllerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    customCountControllerModel.dispose();
  }
}
