import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import '/home_modul/kitchen/storage_page/share_shop_list_for_user_popup/share_shop_list_for_user_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

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

  bool selectMode = false;

  List<DocumentReference> selectedItemsList = [];
  void addToSelectedItemsList(DocumentReference item) =>
      selectedItemsList.add(item);
  void removeFromSelectedItemsList(DocumentReference item) =>
      selectedItemsList.remove(item);
  void removeAtIndexFromSelectedItemsList(int index) =>
      selectedItemsList.removeAt(index);
  void insertAtIndexInSelectedItemsList(int index, DocumentReference item) =>
      selectedItemsList.insert(index, item);
  void updateSelectedItemsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedItemsList[index] = updateFn(selectedItemsList[index]);

  bool selectedAll = false;

  int loopIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<ShoppingListRecord>? shopListToDoneAllOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<ShoppingListRecord>? selectAllOutput;
  // State field(s) for Checkbox widget.
  Map<ShoppingListRecord, bool> checkboxValueMap = {};
  List<ShoppingListRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  StaffStorageRecord? storageItemOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  StaffStorageRecord? storageItemOutputOff;

  /// Query cache managers for this widget.

  final _shopListCacheManager =
      StreamRequestManager<List<ShoppingListRecord>>();
  Stream<List<ShoppingListRecord>> shopListCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ShoppingListRecord>> Function() requestFn,
  }) =>
      _shopListCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearShopListCacheCache() => _shopListCacheManager.clear();
  void clearShopListCacheCacheKey(String? uniqueKey) =>
      _shopListCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearShopListCacheCache();
  }
}
