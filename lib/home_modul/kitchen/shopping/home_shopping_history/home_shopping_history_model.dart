import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/custom_components/total_sum/total_sum_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/delete_history/delete_history_widget.dart';
import '/home_modul/kitchen/shopping/delete_or_add_to_shopping_list/delete_or_add_to_shopping_list_widget.dart';
import 'home_shopping_history_widget.dart' show HomeShoppingHistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeShoppingHistoryModel
    extends FlutterFlowModel<HomeShoppingHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
  }
}
