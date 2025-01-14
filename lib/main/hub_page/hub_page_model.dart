import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/hub_page_components/car_task_upcoming_component/car_task_upcoming_component_widget.dart';
import '/main/hub_page_components/car_today_task_list_component/car_today_task_list_component_widget.dart';
import '/main/hub_page_components/health_event_upcoming_component/health_event_upcoming_component_widget.dart';
import '/main/hub_page_components/health_task_today_component/health_task_today_component_widget.dart';
import '/main/hub_page_components/home_today_component/home_today_component_widget.dart';
import '/main/hub_page_components/home_upcoming_component/home_upcoming_component_widget.dart';
import '/main/hub_page_components/pets_event_today_component/pets_event_today_component_widget.dart';
import '/main/hub_page_components/pets_event_upcoming_component/pets_event_upcoming_component_widget.dart';
import '/main/hub_page_components/plant_tasks_upcoming_component/plant_tasks_upcoming_component_widget.dart';
import '/main/hub_page_components/plants_today_task_component/plants_today_task_component_widget.dart';
import '/main/hub_page_components/sport_event_upcoming_component/sport_event_upcoming_component_widget.dart';
import '/main/hub_page_components/sport_today_event_component/sport_today_event_component_widget.dart';
import '/walkthroughs/ftue.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'hub_page_widget.dart' show HubPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HubPageModel extends FlutterFlowModel<HubPageWidget> {
  ///  Local state fields for this page.

  List<HealthEventRecord> healthEventsToday = [];
  void addToHealthEventsToday(HealthEventRecord item) =>
      healthEventsToday.add(item);
  void removeFromHealthEventsToday(HealthEventRecord item) =>
      healthEventsToday.remove(item);
  void removeAtIndexFromHealthEventsToday(int index) =>
      healthEventsToday.removeAt(index);
  void insertAtIndexInHealthEventsToday(int index, HealthEventRecord item) =>
      healthEventsToday.insert(index, item);
  void updateHealthEventsTodayAtIndex(
          int index, Function(HealthEventRecord) updateFn) =>
      healthEventsToday[index] = updateFn(healthEventsToday[index]);

  List<PetsEventRecord> petsEventToday = [];
  void addToPetsEventToday(PetsEventRecord item) => petsEventToday.add(item);
  void removeFromPetsEventToday(PetsEventRecord item) =>
      petsEventToday.remove(item);
  void removeAtIndexFromPetsEventToday(int index) =>
      petsEventToday.removeAt(index);
  void insertAtIndexInPetsEventToday(int index, PetsEventRecord item) =>
      petsEventToday.insert(index, item);
  void updatePetsEventTodayAtIndex(
          int index, Function(PetsEventRecord) updateFn) =>
      petsEventToday[index] = updateFn(petsEventToday[index]);

  List<MedicationRecord> medicationToday = [];
  void addToMedicationToday(MedicationRecord item) => medicationToday.add(item);
  void removeFromMedicationToday(MedicationRecord item) =>
      medicationToday.remove(item);
  void removeAtIndexFromMedicationToday(int index) =>
      medicationToday.removeAt(index);
  void insertAtIndexInMedicationToday(int index, MedicationRecord item) =>
      medicationToday.insert(index, item);
  void updateMedicationTodayAtIndex(
          int index, Function(MedicationRecord) updateFn) =>
      medicationToday[index] = updateFn(medicationToday[index]);

  int carIndex = 0;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? ftueController;
  // Stores action output result for [Backend Call - Read Document] action in HubPage widget.
  UsersRecord? isFirstLogin;
  // Stores action output result for [Firestore Query - Query a collection] action in HubPage widget.
  SettingsCategoryAndShopRecord? userSettings;
  // Stores action output result for [Firestore Query - Query a collection] action in HubPage widget.
  List<CarsRecord>? carListOutput;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for homeTodayComponent component.
  late HomeTodayComponentModel homeTodayComponentModel;
  // Model for carTodayTaskListComponent component.
  late CarTodayTaskListComponentModel carTodayTaskListComponentModel;
  // Model for plantsTodayTaskComponent component.
  late PlantsTodayTaskComponentModel plantsTodayTaskComponentModel;
  // Model for healthTaskTodayComponent component.
  late HealthTaskTodayComponentModel healthTaskTodayComponentModel;
  // Model for petsEventTodayComponent component.
  late PetsEventTodayComponentModel petsEventTodayComponentModel;
  // Model for sportTodayEventComponent component.
  late SportTodayEventComponentModel sportTodayEventComponentModel;
  // Model for homeUpcomingComponent component.
  late HomeUpcomingComponentModel homeUpcomingComponentModel;
  // Model for carTaskUpcomingComponent component.
  late CarTaskUpcomingComponentModel carTaskUpcomingComponentModel;
  // Model for plantTasksUpcomingComponent component.
  late PlantTasksUpcomingComponentModel plantTasksUpcomingComponentModel;
  // Model for healthEventUpcomingComponent component.
  late HealthEventUpcomingComponentModel healthEventUpcomingComponentModel;
  // Model for petsEventUpcomingComponent component.
  late PetsEventUpcomingComponentModel petsEventUpcomingComponentModel;
  // Model for sportEventUpcomingComponent component.
  late SportEventUpcomingComponentModel sportEventUpcomingComponentModel;

  @override
  void initState(BuildContext context) {
    homeTodayComponentModel =
        createModel(context, () => HomeTodayComponentModel());
    carTodayTaskListComponentModel =
        createModel(context, () => CarTodayTaskListComponentModel());
    plantsTodayTaskComponentModel =
        createModel(context, () => PlantsTodayTaskComponentModel());
    healthTaskTodayComponentModel =
        createModel(context, () => HealthTaskTodayComponentModel());
    petsEventTodayComponentModel =
        createModel(context, () => PetsEventTodayComponentModel());
    sportTodayEventComponentModel =
        createModel(context, () => SportTodayEventComponentModel());
    homeUpcomingComponentModel =
        createModel(context, () => HomeUpcomingComponentModel());
    carTaskUpcomingComponentModel =
        createModel(context, () => CarTaskUpcomingComponentModel());
    plantTasksUpcomingComponentModel =
        createModel(context, () => PlantTasksUpcomingComponentModel());
    healthEventUpcomingComponentModel =
        createModel(context, () => HealthEventUpcomingComponentModel());
    petsEventUpcomingComponentModel =
        createModel(context, () => PetsEventUpcomingComponentModel());
    sportEventUpcomingComponentModel =
        createModel(context, () => SportEventUpcomingComponentModel());
  }

  @override
  void dispose() {
    ftueController?.finish();
    homeTodayComponentModel.dispose();
    carTodayTaskListComponentModel.dispose();
    plantsTodayTaskComponentModel.dispose();
    healthTaskTodayComponentModel.dispose();
    petsEventTodayComponentModel.dispose();
    sportTodayEventComponentModel.dispose();
    homeUpcomingComponentModel.dispose();
    carTaskUpcomingComponentModel.dispose();
    plantTasksUpcomingComponentModel.dispose();
    healthEventUpcomingComponentModel.dispose();
    petsEventUpcomingComponentModel.dispose();
    sportEventUpcomingComponentModel.dispose();
  }
}
