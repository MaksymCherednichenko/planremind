import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/event_info_popup/event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_history_page_events_widget.dart'
    show HealthHistoryPageEventsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HealthHistoryPageEventsModel
    extends FlutterFlowModel<HealthHistoryPageEventsWidget> {
  ///  Local state fields for this page.

  List<HealthEventArchiveRecord> allevenst = [];
  void addToAllevenst(HealthEventArchiveRecord item) => allevenst.add(item);
  void removeFromAllevenst(HealthEventArchiveRecord item) =>
      allevenst.remove(item);
  void removeAtIndexFromAllevenst(int index) => allevenst.removeAt(index);
  void insertAtIndexInAllevenst(int index, HealthEventArchiveRecord item) =>
      allevenst.insert(index, item);
  void updateAllevenstAtIndex(
          int index, Function(HealthEventArchiveRecord) updateFn) =>
      allevenst[index] = updateFn(allevenst[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HealthHistoryPageEvents widget.
  List<HealthEventArchiveRecord>? allEventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
