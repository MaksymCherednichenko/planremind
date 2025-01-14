import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pets_event_upcoming_component_widget.dart'
    show PetsEventUpcomingComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsEventUpcomingComponentModel
    extends FlutterFlowModel<PetsEventUpcomingComponentWidget> {
  ///  Local state fields for this component.

  List<PetsEventRecord> petsEvent = [];
  void addToPetsEvent(PetsEventRecord item) => petsEvent.add(item);
  void removeFromPetsEvent(PetsEventRecord item) => petsEvent.remove(item);
  void removeAtIndexFromPetsEvent(int index) => petsEvent.removeAt(index);
  void insertAtIndexInPetsEvent(int index, PetsEventRecord item) =>
      petsEvent.insert(index, item);
  void updatePetsEventAtIndex(int index, Function(PetsEventRecord) updateFn) =>
      petsEvent[index] = updateFn(petsEvent[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in petsEventUpcomingComponent widget.
  List<PetsEventRecord>? allEventsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future<List<PetsEventRecord>?> getUpcomingList(BuildContext context) async {
    return null;
  }
}
