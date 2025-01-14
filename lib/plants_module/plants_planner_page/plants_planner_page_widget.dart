import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import '/walkthroughs/plants_first_enter.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plants_planner_page_model.dart';
export 'plants_planner_page_model.dart';

class PlantsPlannerPageWidget extends StatefulWidget {
  const PlantsPlannerPageWidget({super.key});

  @override
  State<PlantsPlannerPageWidget> createState() =>
      _PlantsPlannerPageWidgetState();
}

class _PlantsPlannerPageWidgetState extends State<PlantsPlannerPageWidget>
    with TickerProviderStateMixin {
  late PlantsPlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantsPlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.plantModuleOpened == false) {
        safeSetState(() =>
            _model.plantsFirstEnterController = createPageWalkthrough(context));
        _model.plantsFirstEnterController?.show(context: context);

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              userLoginHistory: createUserLoginHistoryStruct(
                plantModuleOpened: true,
                clearUnsetFields: false,
              ),
            ));
      }
      _model.allPlants = await queryPlantsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.filteredTodayList = await actions.filterPlantsForTodayAction(
        _model.allPlants!.toList(),
      );
      _model.filteredTomorrowList = await actions.filterPlantsForTomorrowAction(
        _model.allPlants!.toList(),
      );
      _model.filteredUpcomingList = await actions.filterPlantsUpcomingAction(
        _model.allPlants!.toList(),
      );
      _model.todayList =
          _model.filteredTodayList!.toList().cast<PlantsRecord>();
      _model.tomorrowList =
          _model.filteredTomorrowList!.toList().cast<PlantsRecord>();
      _model.upcomingList =
          _model.filteredUpcomingList!.toList().cast<PlantsRecord>();
      _model.isEmpty =
          _model.allPlants != null && (_model.allPlants)!.isNotEmpty
              ? false
              : true;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('HubPage');
              },
              text: '',
              icon: Icon(
                FFIcons.kaltArrowLeft,
                color: FlutterFlowTheme.of(context).carService,
                size: 20.0,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).plants,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'zojps4qi' /* Plants */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed('Settings');
              },
              text: '',
              icon: Icon(
                FFIcons.ksettingsGrey,
                color: Color(0xFF515151),
                size: 15.0,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: TextStyle(
                  color: Color(0xFF515151),
                  fontWeight: FontWeight.w100,
                  fontSize: 2.0,
                ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  height: 59.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('MyPlantsPageList');
                            },
                            text: FFLocalizations.of(context).getText(
                              'e0l9n5en' /* My Plants */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF0B0B0B),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ).addWalkthrough(
                            button03hk0vdz,
                            _model.plantsFirstEnterController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'fthligmm' /* Planner */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).plants,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ).addWalkthrough(
                            button1jfae093,
                            _model.plantsFirstEnterController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: (_model.todayList.isNotEmpty) == true,
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 100.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Visibility(
                            visible: _model.todayList.isNotEmpty,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: PlantInfoPopupWidget(
                                          plant: _model.todayList
                                              .elementAtOrNull(
                                                  _model.currentCardIndex)!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.allPlants2 = await queryPlantsRecordOnce(
                                  parent: FFAppState().currentUserRef,
                                );
                                _model.filteredTodayList2 =
                                    await actions.filterPlantsForTodayAction(
                                  _model.allPlants2!.toList(),
                                );
                                _model.filteredTomorrowList2 =
                                    await actions.filterPlantsForTomorrowAction(
                                  _model.allPlants2!.toList(),
                                );
                                _model.filteredUpcomingList2 =
                                    await actions.filterPlantsUpcomingAction(
                                  _model.allPlants2!.toList(),
                                );
                                _model.todayList = _model.filteredTodayList2!
                                    .toList()
                                    .cast<PlantsRecord>();
                                _model.tomorrowList = _model
                                    .filteredTomorrowList2!
                                    .toList()
                                    .cast<PlantsRecord>();
                                _model.upcomingList = _model
                                    .filteredUpcomingList2!
                                    .toList()
                                    .cast<PlantsRecord>();
                                _model.isEmpty = _model.allPlants2 != null &&
                                        (_model.allPlants2)!.isNotEmpty
                                    ? false
                                    : true;
                                _model.currentCardIndex =
                                    _model.currentCardIndex <
                                            _model.filteredTodayList2!.length
                                        ? _model.currentCardIndex
                                        : 0;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'c7efo504' /* Today */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                _model.todayList.length > 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .plants,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Visibility(
                                                  visible: (_model.todayList
                                                          .isNotEmpty) ==
                                                      true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 5.0,
                                                                8.0, 5.0),
                                                    child: Text(
                                                      '${functions.sum(_model.currentCardIndex, 1).toString()}/${_model.todayList.length.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if ((_model.todayList.isNotEmpty) == true)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.todayList.length > 1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (_model
                                                            .currentCardIndex >
                                                        0) {
                                                      _model.currentCardIndex =
                                                          _model.currentCardIndex +
                                                              -1;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.currentCardIndex =
                                                          functions.minus(
                                                              _model.todayList
                                                                  .length,
                                                              1);
                                                      safeSetState(() {});
                                                    }

                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .reverse();
                                                    }
                                                  },
                                                  text: '',
                                                  icon: Icon(
                                                    Icons.chevron_left,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .plants,
                                                    size: 36.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 60.0,
                                                    height: 80.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        if ((_model.todayList.isNotEmpty) ==
                                            true)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                _model.todayList
                                                    .elementAtOrNull(
                                                        _model.currentCardIndex)
                                                    ?.photo,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v3Q92mpanUFl9yqWqBvt/assets/4m25uzr3vp9t/image_1.png',
                                              ),
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.todayList.length > 1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (_model
                                                            .currentCardIndex <
                                                        functions.minus(
                                                            _model.todayList
                                                                .length,
                                                            1)) {
                                                      _model.currentCardIndex =
                                                          _model.currentCardIndex +
                                                              1;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.currentCardIndex =
                                                          0;
                                                      safeSetState(() {});
                                                    }

                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .reverse();
                                                    }
                                                  },
                                                  text: '',
                                                  icon: Icon(
                                                    Icons.navigate_next,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .plants,
                                                    size: 36.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 60.0,
                                                    height: 80.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if ((_model.todayList.isNotEmpty) == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: Text(
                                        _model.todayList
                                            .elementAtOrNull(
                                                _model.currentCardIndex)!
                                            .name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    (_model.todayList.isNotEmpty) == false
                                        ? false
                                        : (functions.toWateringPlantToday(_model
                                                .todayList
                                                .elementAtOrNull(_model
                                                    .currentCardIndex)!) ==
                                            true),
                                    false,
                                  ))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons
                                              .kwateringCanAndPlantsBlackOutline19370,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0h9pa4rr' /* Watering */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  if (valueOrDefault<bool>(
                                    (_model.todayList.isNotEmpty) == false
                                        ? false
                                        : (functions.toFertilizationPlantToday(
                                                _model.todayList
                                                    .elementAtOrNull(_model
                                                        .currentCardIndex)!) ==
                                            true),
                                    false,
                                  ))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kseedingBlackOutline19388,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'hz5rktxk' /* Fertilization */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  if (valueOrDefault<bool>(
                                    (_model.todayList.isNotEmpty) == false
                                        ? false
                                        : (functions.toSolidChangePlantForToday(
                                                _model.todayList
                                                    .elementAtOrNull(_model
                                                        .currentCardIndex)!) ==
                                            true),
                                    false,
                                  ))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kplants,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'c9dfq7mv' /* Solig change */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                ].addToEnd(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Visibility(
                      visible: (_model.tomorrowList.isNotEmpty) == true,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'uf6oj82u' /* Tomorrow */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Builder(
                              builder: (context) {
                                final list = _model.tomorrowList.toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(list.length, (listIndex) {
                                      final listItem = list[listIndex];
                                      return Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PlantInfoPopupWidget(
                                                        plant: listItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              _model.allPlants3 =
                                                  await queryPlantsRecordOnce(
                                                parent:
                                                    FFAppState().currentUserRef,
                                              );
                                              _model.filteredTodayList3 =
                                                  await actions
                                                      .filterPlantsForTodayAction(
                                                _model.allPlants3!.toList(),
                                              );
                                              _model.filteredTomorrowList3 =
                                                  await actions
                                                      .filterPlantsForTomorrowAction(
                                                _model.allPlants3!.toList(),
                                              );
                                              _model.filteredUpcomingList3 =
                                                  await actions
                                                      .filterPlantsUpcomingAction(
                                                _model.allPlants3!.toList(),
                                              );
                                              _model.todayList = _model
                                                  .filteredTodayList3!
                                                  .toList()
                                                  .cast<PlantsRecord>();
                                              _model.tomorrowList = _model
                                                  .filteredTomorrowList3!
                                                  .toList()
                                                  .cast<PlantsRecord>();
                                              _model.upcomingList = _model
                                                  .filteredUpcomingList3!
                                                  .toList()
                                                  .cast<PlantsRecord>();
                                              _model.isEmpty =
                                                  _model.allPlants3 != null &&
                                                          (_model.allPlants3)!
                                                              .isNotEmpty
                                                      ? false
                                                      : true;
                                              _model.currentCardIndex = _model
                                                          .currentCardIndex <
                                                      _model.filteredTodayList3!
                                                          .length
                                                  ? _model.currentCardIndex
                                                  : 0;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listItem.photo,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v3Q92mpanUFl9yqWqBvt/assets/4m25uzr3vp9t/image_1.png',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                                Text(
                                                  listItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 5.0))
                                                  .addToEnd(
                                                      SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(SizedBox(width: 8.0)),
                                  ),
                                );
                              },
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Visibility(
                      visible: (_model.upcomingList.isNotEmpty) == true,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'px8fcort' /* Upcoming */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 10.0),
                                child: Builder(
                                  builder: (context) {
                                    final upcominglist =
                                        _model.upcomingList.toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: upcominglist.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder:
                                          (context, upcominglistIndex) {
                                        final upcominglistItem =
                                            upcominglist[upcominglistIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              PlantInfoPopupWidget(
                                                            plant:
                                                                upcominglistItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.allPlants4 =
                                                      await queryPlantsRecordOnce(
                                                    parent: FFAppState()
                                                        .currentUserRef,
                                                  );
                                                  _model.filteredTodayList4 =
                                                      await actions
                                                          .filterPlantsForTodayAction(
                                                    _model.allPlants4!.toList(),
                                                  );
                                                  _model.filteredTomorrowList4 =
                                                      await actions
                                                          .filterPlantsForTomorrowAction(
                                                    _model.allPlants4!.toList(),
                                                  );
                                                  _model.filteredUpcomingList4 =
                                                      await actions
                                                          .filterPlantsUpcomingAction(
                                                    _model.allPlants4!.toList(),
                                                  );
                                                  _model.todayList = _model
                                                      .filteredTodayList4!
                                                      .toList()
                                                      .cast<PlantsRecord>();
                                                  _model.tomorrowList = _model
                                                      .filteredTomorrowList4!
                                                      .toList()
                                                      .cast<PlantsRecord>();
                                                  _model.upcomingList = _model
                                                      .filteredUpcomingList4!
                                                      .toList()
                                                      .cast<PlantsRecord>();
                                                  _model.isEmpty = _model
                                                                  .allPlants4 !=
                                                              null &&
                                                          (_model.allPlants4)!
                                                              .isNotEmpty
                                                      ? false
                                                      : true;
                                                  _model
                                                      .currentCardIndex = _model
                                                              .currentCardIndex <
                                                          _model
                                                              .filteredTodayList4!
                                                              .length
                                                      ? _model.currentCardIndex
                                                      : 0;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              upcominglistItem
                                                                  .photo,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v3Q92mpanUFl9yqWqBvt/assets/4m25uzr3vp9t/image_1.png',
                                                            ),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        Text(
                                                          upcominglistItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (functions
                                                                .toWateringPlantUpcoming(
                                                                    upcominglistItem) ==
                                                            true)
                                                          Icon(
                                                            Icons.water_drop,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        if (functions
                                                                .toSolidChangePlantUpcoming(
                                                                    upcominglistItem) ==
                                                            true)
                                                          Icon(
                                                            FFIcons.kplants,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        if (functions
                                                                .toFertilizationPlantUpcoming(
                                                                    upcominglistItem) ==
                                                            true)
                                                          Icon(
                                                            Icons
                                                                .workspaces_filled,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (upcominglistIndex <
                                                functions.minus(
                                                    _model.upcomingList.length,
                                                    1))
                                              Divider(
                                                thickness: 0.2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ),
                  if (_model.isEmpty)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'j0qh5m3j' /* Наразі записи відсутні */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
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
          safeSetState(() => _model.plantsFirstEnterController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
