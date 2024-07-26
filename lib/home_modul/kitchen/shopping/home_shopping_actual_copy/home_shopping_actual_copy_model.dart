import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/custom_components/check_box/check_box_widget.dart';
import '/custom_components/shop_list_item/shop_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import '/main/settings/user_friends/share_shoping_list_to/share_shoping_list_to_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'home_shopping_actual_copy_widget.dart'
    show HomeShoppingActualCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeShoppingActualCopyModel
    extends FlutterFlowModel<HomeShoppingActualCopyWidget> {
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

  int? numOfChoosedItems;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomeShoppingActualCopy widget.
  SettingsCategoryAndShopRecord? settings;
  // Stores action output result for [Custom Action - createSortListFromShopNames] action in HomeShoppingActualCopy widget.
  List<String>? createdSortList;
  // Model for appBar component.
  late AppBarModel appBarModel;
  List<ShoppingListRecord>? buttonPreviousSnapshot;
  // Model for checkBox component.
  late CheckBoxModel checkBoxModel;
  // Models for shopListItem dynamic component.
  late FlutterFlowDynamicModels<ShopListItemModel> shopListItemModels;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    checkBoxModel = createModel(context, () => CheckBoxModel());
    shopListItemModels = FlutterFlowDynamicModels(() => ShopListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    checkBoxModel.dispose();
    shopListItemModels.dispose();
  }
}
