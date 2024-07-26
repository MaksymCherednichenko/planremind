import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/meal/menu/addingridientspopup_menu/addingridientspopup_menu_widget.dart';
import '/home_modul/kitchen/meal/menu/editingridientspopup_menu/editingridientspopup_menu_widget.dart';
import 'create_item_in_menu_widget.dart' show CreateItemInMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateItemInMenuModel extends FlutterFlowModel<CreateItemInMenuWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> ingredients = [];
  void addToIngredients(DocumentReference item) => ingredients.add(item);
  void removeFromIngredients(DocumentReference item) =>
      ingredients.remove(item);
  void removeAtIndexFromIngredients(int index) => ingredients.removeAt(index);
  void insertAtIndexInIngredients(int index, DocumentReference item) =>
      ingredients.insert(index, item);
  void updateIngredientsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      ingredients[index] = updateFn(ingredients[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z3nm8kzw' /* Please enter a name */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MenuItemIngredientsRecord? ingredientsList;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
