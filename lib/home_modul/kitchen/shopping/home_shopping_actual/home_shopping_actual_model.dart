import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import '/home_modul/kitchen/shopping/editingridientspopup_shopping/editingridientspopup_shopping_widget.dart';
import '/main/settings/user_friends/share_shoping_list_to/share_shoping_list_to_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'home_shopping_actual_widget.dart' show HomeShoppingActualWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeShoppingActualModel
    extends FlutterFlowModel<HomeShoppingActualWidget> {
  ///  Local state fields for this page.

  int? boughtItemNum = 0;

  int? index = 0;

  List<String> sortByShop = [];
  void addToSortByShop(String item) => sortByShop.add(item);
  void removeFromSortByShop(String item) => sortByShop.remove(item);
  void removeAtIndexFromSortByShop(int index) => sortByShop.removeAt(index);
  void insertAtIndexInSortByShop(int index, String item) =>
      sortByShop.insert(index, item);
  void updateSortByShopAtIndex(int index, Function(String) updateFn) =>
      sortByShop[index] = updateFn(sortByShop[index]);

  bool isFilterOpen = false;

  int? numTemp = 0;

  int? showFilterCategory = 0;

  String? categoryTag = '';

  bool isAllCategory = true;

  List<ShoppingListRecord> forShareList = [];
  void addToForShareList(ShoppingListRecord item) => forShareList.add(item);
  void removeFromForShareList(ShoppingListRecord item) =>
      forShareList.remove(item);
  void removeAtIndexFromForShareList(int index) => forShareList.removeAt(index);
  void insertAtIndexInForShareList(int index, ShoppingListRecord item) =>
      forShareList.insert(index, item);
  void updateForShareListAtIndex(
          int index, Function(ShoppingListRecord) updateFn) =>
      forShareList[index] = updateFn(forShareList[index]);

  bool isAllItemChoosed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomeShoppingActual widget.
  SettingsCategoryAndShopRecord? settings;
  // Stores action output result for [Custom Action - createSortListFromShopNames] action in HomeShoppingActual widget.
  List<String>? createdSortList;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for Checkbox widget.
  Map<ShoppingListRecord, bool> checkboxValueMap = {};
  List<ShoppingListRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

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
