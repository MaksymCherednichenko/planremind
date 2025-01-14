import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/add_pets_popup/add_pets_popup_widget.dart';
import '/pets_module/popups/pets_page_expanded_float_menu/pets_page_expanded_float_menu_widget.dart';
import '/walkthroughs/pets_add_pet.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'pets_pet_page_widget.dart' show PetsPetPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetsPetPageModel extends FlutterFlowModel<PetsPetPageWidget> {
  ///  Local state fields for this page.

  List<PetsRecord> allPets = [];
  void addToAllPets(PetsRecord item) => allPets.add(item);
  void removeFromAllPets(PetsRecord item) => allPets.remove(item);
  void removeAtIndexFromAllPets(int index) => allPets.removeAt(index);
  void insertAtIndexInAllPets(int index, PetsRecord item) =>
      allPets.insert(index, item);
  void updateAllPetsAtIndex(int index, Function(PetsRecord) updateFn) =>
      allPets[index] = updateFn(allPets[index]);

  int currentIndex = 0;

  List<PetsEatingPlanTimeRecord> eatingPlan = [];
  void addToEatingPlan(PetsEatingPlanTimeRecord item) => eatingPlan.add(item);
  void removeFromEatingPlan(PetsEatingPlanTimeRecord item) =>
      eatingPlan.remove(item);
  void removeAtIndexFromEatingPlan(int index) => eatingPlan.removeAt(index);
  void insertAtIndexInEatingPlan(int index, PetsEatingPlanTimeRecord item) =>
      eatingPlan.insert(index, item);
  void updateEatingPlanAtIndex(
          int index, Function(PetsEatingPlanTimeRecord) updateFn) =>
      eatingPlan[index] = updateFn(eatingPlan[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? petsAddPetController;
  // Stores action output result for [Backend Call - Read Document] action in PetsPetPage widget.
  UsersRecord? userInfoOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PetsPetPage widget.
  List<PetsRecord>? allPetsOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in PetsPetPage widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<PetsRecord>? allPetsOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput3;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PetsRecord>? allPetsOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput6;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput5;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PetsRecord>? allPetsOutput4;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PetsEatingPlanTimeRecord>? eatingPlanOutput4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    petsAddPetController?.finish();
  }
}
