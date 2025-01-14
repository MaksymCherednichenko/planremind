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
import 'hub_page_model.dart';
export 'hub_page_model.dart';

class HubPageWidget extends StatefulWidget {
  const HubPageWidget({
    super.key,
    bool? startGuide,
  }) : this.startGuide = startGuide ?? false;

  final bool startGuide;

  @override
  State<HubPageWidget> createState() => _HubPageWidgetState();
}

class _HubPageWidgetState extends State<HubPageWidget> {
  late HubPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HubPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isFirstLogin =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.isFirstLogin?.userLoginHistory?.userLogginedEver == false) {
        context.goNamed('WellcomePage');
      } else {
        await action_blocks.loadAndUpdateModuleStates(context);
        safeSetState(() {});

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              pushNotificationServerHour: 12,
            ));
        if (widget!.startGuide == true) {
          safeSetState(
              () => _model.ftueController = createPageWalkthrough(context));
          _model.ftueController?.show(context: context);
        }
        FFAppState().currentUserRef = currentUserReference;
        FFAppState().userID = currentUserUid;
        FFAppState().curentMonthsYear =
            functions.createMonthsYear().toList().cast<DateTime>();
        safeSetState(() {});
        _model.userSettings = await querySettingsCategoryAndShopRecordOnce(
          parent: FFAppState().currentUserRef,
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().namesOfShops =
            _model.userSettings!.shops.toList().cast<String>();
        FFAppState().categoryHousehold =
            _model.userSettings!.categoryHousehold.toList().cast<String>();
        FFAppState().category =
            _model.userSettings!.categoryFood.toList().cast<String>();
        safeSetState(() {});
        _model.carListOutput = await queryCarsRecordOnce(
          parent: FFAppState().currentUserRef,
        );
        _model.carIndex = 0;
        safeSetState(() {});
        while (_model.carIndex < _model.carListOutput!.length) {
          _model.carIndex = _model.carIndex + 1;
          safeSetState(() {});
          if (functions.calculateDaysDifference(
                  _model.carListOutput!
                      .elementAtOrNull(_model.carIndex)!
                      .lastDateOfChangeMileage!,
                  getCurrentTimestamp) >=
              30) {
            triggerPushNotification(
              notificationTitle: 'Зміна пробігу',
              notificationText:
                  'Пора оновити пробіг автомобіля ${_model.carListOutput?.elementAtOrNull(_model.carIndex)?.brand} ${_model.carListOutput?.elementAtOrNull(_model.carIndex)?.model}',
              userRefs: [FFAppState().currentUserRef!],
              initialPageName: 'CarServicePlannerPage',
              parameterData: {},
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 40.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.5),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('WellcomePage');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Xnip2023-11-14_15-48-41-removebg.png',
                              width: 172.5,
                              height: 93.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Settings');
                            },
                            child: Icon(
                              FFIcons.ksettings,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 1),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 25.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '320asavf' /* Сьогодні */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.homeTodayComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: HomeTodayComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .carTodayTaskListComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                CarTodayTaskListComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .plantsTodayTaskComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                PlantsTodayTaskComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .healthTaskTodayComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                HealthTaskTodayComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .petsEventTodayComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                PetsEventTodayComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .sportTodayEventComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                SportTodayEventComponentWidget(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 50.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 394.0,
                                  height: 551.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 30.0, 0.0),
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 30.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                              ),
                                            ).addWalkthrough(
                                              containerYobbt3fq,
                                              _model.ftueController,
                                            ),
                                            Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                              ),
                                            ),
                                            Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                              ),
                                            ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Health) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'HealthPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Pets) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'PetsPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Sport) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'SportsPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ).addWalkthrough(
                                          gridView7djlhu3o,
                                          _model.ftueController,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 30.0, 0.0),
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 30.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Home) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'HomePlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .home,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          FFIcons.khouse,
                                                          color:
                                                              Color(0xFF020202),
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'hf1ytjcl' /* Дім */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Car) ==
                                                true)
                                              Container(
                                                width: 150.0,
                                                height: 150.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .carService,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'CarServicePlannerPage');
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          FFIcons.kcar,
                                                          color: Colors.black,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vkc0ptx5' /* Гараж */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Plants) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'PlantsPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .plants,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          FFIcons.kplants,
                                                          color:
                                                              Color(0xFF0F0E0E),
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9dvs4lp2' /* Рослини */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Health) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'HealthPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .health,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          FFIcons.kheartPulse,
                                                          color:
                                                              Color(0xFF020202),
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'bwxexx4u' /* Здоровʼя */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Pets) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'PetsPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pets,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          FFIcons.kpaw,
                                                          color: Colors.black,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'i7demk40' /* Улюбленці */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (functions.getModuleState(
                                                    FFAppState()
                                                        .moduleStates
                                                        .toList(),
                                                    ModulesEnum.Sport) ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'SportsPlannerPage');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Icon(
                                                          Icons.sports_tennis,
                                                          color: Colors.black,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '1h1idrun' /* Спорт */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 25.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '67wciw7h' /* У найближчі дні */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model
                                                .homeUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                HomeUpcomingComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .carTaskUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                CarTaskUpcomingComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .plantTasksUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                PlantTasksUpcomingComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .healthEventUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                HealthEventUpcomingComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .petsEventUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                PetsEventUpcomingComponentWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .sportEventUpcomingComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                SportEventUpcomingComponentWidget(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 50.0)),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 1),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {});
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 8.0,
                                radius: 8.0,
                                dotWidth: 8.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 54.0))
                  .addToStart(SizedBox(height: 54.0)),
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.ftueController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
