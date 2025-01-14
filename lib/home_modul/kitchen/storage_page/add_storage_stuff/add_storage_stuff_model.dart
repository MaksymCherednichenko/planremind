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
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_storage_stuff_widget.dart' show AddStorageStuffWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddStorageStuffModel extends FlutterFlowModel<AddStorageStuffWidget> {
  ///  Local state fields for this component.

  HomeStuffEnum? itemType = HomeStuffEnum.food;

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

  List<String> unitDropdownLabelList = [];
  void addToUnitDropdownLabelList(String item) =>
      unitDropdownLabelList.add(item);
  void removeFromUnitDropdownLabelList(String item) =>
      unitDropdownLabelList.remove(item);
  void removeAtIndexFromUnitDropdownLabelList(int index) =>
      unitDropdownLabelList.removeAt(index);
  void insertAtIndexInUnitDropdownLabelList(int index, String item) =>
      unitDropdownLabelList.insert(index, item);
  void updateUnitDropdownLabelListAtIndex(
          int index, Function(String) updateFn) =>
      unitDropdownLabelList[index] = updateFn(unitDropdownLabelList[index]);

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

  DateTime? endDate;

  bool nameError = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in addStorageStuff widget.
  SettingsCategoryAndShopRecord? settingscategoryAndShopOutput;
  // State field(s) for ItemTypeDropDown widget.
  HomeStuffEnum? itemTypeDropDownValue;
  FormFieldController<HomeStuffEnum>? itemTypeDropDownValueController;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9ihiohjv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for CountTextField widget.
  FocusNode? countTextFieldFocusNode;
  TextEditingController? countTextFieldTextController;
  String? Function(BuildContext, String?)?
      countTextFieldTextControllerValidator;
  String? _countTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nxkzc8a6' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
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
  // State field(s) for endDateTextField widget.
  FocusNode? endDateTextFieldFocusNode;
  TextEditingController? endDateTextFieldTextController;
  String? Function(BuildContext, String?)?
      endDateTextFieldTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Action Block - tryToAddHomeStuffCategory] action in Button widget.
  String? savedCategoryOuput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? sameNameCountOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StaffStorageRecord? newItemInShoppingList;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    countTextFieldTextControllerValidator =
        _countTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    countTextFieldFocusNode?.dispose();
    countTextFieldTextController?.dispose();

    categoryTextFieldFocusNode?.dispose();

    endDateTextFieldFocusNode?.dispose();
    endDateTextFieldTextController?.dispose();
  }
}
