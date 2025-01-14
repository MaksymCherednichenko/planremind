import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'plant_tasks_upcoming_component_widget.dart'
    show PlantTasksUpcomingComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantTasksUpcomingComponentModel
    extends FlutterFlowModel<PlantTasksUpcomingComponentWidget> {
  ///  Local state fields for this component.

  List<PlantsRecord> plantsList = [];
  void addToPlantsList(PlantsRecord item) => plantsList.add(item);
  void removeFromPlantsList(PlantsRecord item) => plantsList.remove(item);
  void removeAtIndexFromPlantsList(int index) => plantsList.removeAt(index);
  void insertAtIndexInPlantsList(int index, PlantsRecord item) =>
      plantsList.insert(index, item);
  void updatePlantsListAtIndex(int index, Function(PlantsRecord) updateFn) =>
      plantsList[index] = updateFn(plantsList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in plantTasksUpcomingComponent widget.
  List<PlantsRecord>? allPlantsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
