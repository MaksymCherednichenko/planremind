import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'addingridientspopup_widget.dart' show AddingridientspopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddingridientspopupModel
    extends FlutterFlowModel<AddingridientspopupWidget> {
  ///  Local state fields for this component.

  List<UnitsEnum> imperialUnitsList = [
    UnitsEnum.piece,
    UnitsEnum.oz,
    UnitsEnum.pound,
    UnitsEnum.pint,
    UnitsEnum.litre
  ];
  void addToImperialUnitsList(UnitsEnum item) => imperialUnitsList.add(item);
  void removeFromImperialUnitsList(UnitsEnum item) =>
      imperialUnitsList.remove(item);
  void removeAtIndexFromImperialUnitsList(int index) =>
      imperialUnitsList.removeAt(index);
  void insertAtIndexInImperialUnitsList(int index, UnitsEnum item) =>
      imperialUnitsList.insert(index, item);
  void updateImperialUnitsListAtIndex(
          int index, Function(UnitsEnum) updateFn) =>
      imperialUnitsList[index] = updateFn(imperialUnitsList[index]);

  List<UnitsEnum> metricUnitsList = [
    UnitsEnum.piece,
    UnitsEnum.gram,
    UnitsEnum.kilogram,
    UnitsEnum.millilitre,
    UnitsEnum.litre
  ];
  void addToMetricUnitsList(UnitsEnum item) => metricUnitsList.add(item);
  void removeFromMetricUnitsList(UnitsEnum item) =>
      metricUnitsList.remove(item);
  void removeAtIndexFromMetricUnitsList(int index) =>
      metricUnitsList.removeAt(index);
  void insertAtIndexInMetricUnitsList(int index, UnitsEnum item) =>
      metricUnitsList.insert(index, item);
  void updateMetricUnitsListAtIndex(int index, Function(UnitsEnum) updateFn) =>
      metricUnitsList[index] = updateFn(metricUnitsList[index]);

  List<String> unitsDropdownList = [];
  void addToUnitsDropdownList(String item) => unitsDropdownList.add(item);
  void removeFromUnitsDropdownList(String item) =>
      unitsDropdownList.remove(item);
  void removeAtIndexFromUnitsDropdownList(int index) =>
      unitsDropdownList.removeAt(index);
  void insertAtIndexInUnitsDropdownList(int index, String item) =>
      unitsDropdownList.insert(index, item);
  void updateUnitsDropdownListAtIndex(int index, Function(String) updateFn) =>
      unitsDropdownList[index] = updateFn(unitsDropdownList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in addingridientspopup widget.
  SettingsCategoryAndShopRecord? foodCategories;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's9hy3zmc' /* Назва продукту is required */,
      );
    }

    return null;
  }

  // State field(s) for CoundTextField widget.
  FocusNode? coundTextFieldFocusNode;
  TextEditingController? coundTextFieldTextController;
  String? Function(BuildContext, String?)?
      coundTextFieldTextControllerValidator;
  String? _coundTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'glmqdb60' /* Кількість is required */,
      );
    }

    return null;
  }

  // State field(s) for UnitDropDown widget.
  UnitsEnum? unitDropDownValue;
  FormFieldController<UnitsEnum>? unitDropDownValueController;
  // State field(s) for CategoryTextField widget.
  final categoryTextFieldKey = GlobalKey();
  FocusNode? categoryTextFieldFocusNode;
  TextEditingController? categoryTextFieldTextController;
  String? categoryTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      categoryTextFieldTextControllerValidator;
  // Stores action output result for [Action Block - tryToAddHomeStuffCategory] action in Button widget.
  String? createdCategoryOuput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  IngredientsOfDishesRecord? newIngredient;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    coundTextFieldTextControllerValidator =
        _coundTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    coundTextFieldFocusNode?.dispose();
    coundTextFieldTextController?.dispose();

    categoryTextFieldFocusNode?.dispose();
  }
}
