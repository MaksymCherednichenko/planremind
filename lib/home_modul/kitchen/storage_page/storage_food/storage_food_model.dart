import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/storage_page/add_storage_stuff/add_storage_stuff_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'storage_food_widget.dart' show StorageFoodWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StorageFoodModel extends FlutterFlowModel<StorageFoodWidget> {
  ///  Local state fields for this page.

  bool isAll = true;

  List<bool> categoriesIsOpened = [];
  void addToCategoriesIsOpened(bool item) => categoriesIsOpened.add(item);
  void removeFromCategoriesIsOpened(bool item) =>
      categoriesIsOpened.remove(item);
  void removeAtIndexFromCategoriesIsOpened(int index) =>
      categoriesIsOpened.removeAt(index);
  void insertAtIndexInCategoriesIsOpened(int index, bool item) =>
      categoriesIsOpened.insert(index, item);
  void updateCategoriesIsOpenedAtIndex(int index, Function(bool) updateFn) =>
      categoriesIsOpened[index] = updateFn(categoriesIsOpened[index]);

  int? itemNum = 0;

  int? index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in StorageFood widget.
  SettingsCategoryAndShopRecord? categoryOutput;
  // Model for appBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
