import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'share_shoping_list_to_widget.dart' show ShareShopingListToWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShareShopingListToModel
    extends FlutterFlowModel<ShareShopingListToWidget> {
  ///  Local state fields for this component.

  List<UsersFriendsRecord> usersToSend = [];
  void addToUsersToSend(UsersFriendsRecord item) => usersToSend.add(item);
  void removeFromUsersToSend(UsersFriendsRecord item) =>
      usersToSend.remove(item);
  void removeAtIndexFromUsersToSend(int index) => usersToSend.removeAt(index);
  void insertAtIndexInUsersToSend(int index, UsersFriendsRecord item) =>
      usersToSend.insert(index, item);
  void updateUsersToSendAtIndex(
          int index, Function(UsersFriendsRecord) updateFn) =>
      usersToSend[index] = updateFn(usersToSend[index]);

  int? ind;

  int? ind2;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<UsersFriendsRecord, bool> checkboxValueMap = {};
  List<UsersFriendsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
