import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/menu_select_popup/menu_select_popup_widget.dart';
import '/walkthroughs/home_first_visit.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
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
import 'home_planner_page_model.dart';
export 'home_planner_page_model.dart';

class HomePlannerPageWidget extends StatefulWidget {
  const HomePlannerPageWidget({super.key});

  @override
  State<HomePlannerPageWidget> createState() => _HomePlannerPageWidgetState();
}

class _HomePlannerPageWidgetState extends State<HomePlannerPageWidget>
    with TickerProviderStateMixin {
  late HomePlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.homeModuleOpened == false) {
        safeSetState(() =>
            _model.homeFirstVisitController = createPageWalkthrough(context));
        _model.homeFirstVisitController?.show(context: context);

        await _model.userInfoOutput!.reference.update(createUsersRecordData(
          userLoginHistory: createUserLoginHistoryStruct(
            homeModuleOpened: true,
            clearUnsetFields: false,
          ),
        ));
      }
      FFAppState().indexMain = 0;
      FFAppState().selectedDate = functions.getDateOnly(getCurrentTimestamp);
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          while (FFAppState().indexMain < 4) {
            _model.insertAtIndexInTagClick(FFAppState().indexMain, '0');
            safeSetState(() {});
            FFAppState().indexMain = FFAppState().indexMain + 1;
            safeSetState(() {});
          }
          FFAppState().indexMain = 0;
          safeSetState(() {});
          unawaited(
            () async {
              await _model.initTagClick(context);
            }(),
          );
        }),
        Future(() async {
          _model.breakfasts = [];
          _model.lunches = [];
          _model.dinners = [];
          _model.others = [];
          _model.ind = [];
          _model.numOfDocs = [];
          _model.temp = 0;
          safeSetState(() {});
        }),
      ]);
    });

    animationsMap.addAll({
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: MenuSelectPopupWidget(
                      date: _model.calendarSelectedDay!.start,
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).home,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ).addWalkthrough(
          floatingActionButtonD08rlbxl,
          _model.homeFirstVisitController,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarWidget(
                  title: 'Home',
                  colorButton: FlutterFlowTheme.of(context).home,
                  isSettingButton: true,
                  isAddButton: false,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('HomeShoppingActual');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'fah9820a' /* Shopping */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    )
                                        .addWalkthrough(
                                          buttonEue9zxtz,
                                          _model.homeFirstVisitController,
                                        )
                                        .animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation1']!),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '2uxti7t7' /* Planner */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF57F44),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ).addWalkthrough(
                                      buttonBnnauo5i,
                                      _model.homeFirstVisitController,
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('StorageFood');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'xlw47m23' /* Storage */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    )
                                        .addWalkthrough(
                                          buttonItusy0fi,
                                          _model.homeFirstVisitController,
                                        )
                                        .animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).addWalkthrough(
                          container3p7o7qv6,
                          _model.homeFirstVisitController,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: FlutterFlowCalendar(
                        color: Color(0xFFF57F44),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        weekFormat: false,
                        weekStartsMonday: true,
                        initialDate: getCurrentTimestamp,
                        rowHeight: 40.0,
                        onChange: (DateTimeRange? newSelectedDate) async {
                          if (_model.calendarSelectedDay == newSelectedDate) {
                            return;
                          }
                          _model.calendarSelectedDay = newSelectedDate;
                          FFAppState().selectedDate =
                              _model.calendarSelectedDay?.start;
                          FFAppState().update(() {});
                          _model.breakfasts = [];
                          _model.lunches = [];
                          _model.dinners = [];
                          _model.others = [];
                          _model.ind = [];
                          _model.numOfDocs = [];
                          _model.temp = 0;
                          safeSetState(() {});
                          _model.todaysListOfDishes =
                              await queryDateListOfDishesRecordOnce(
                            parent: FFAppState().currentUserRef,
                            queryBuilder: (dateListOfDishesRecord) =>
                                dateListOfDishesRecord.where(
                              'date',
                              isEqualTo: FFAppState().selectedDate,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.todaysListOfDishes?.reference != null) {
                            while (_model.temp! < 4) {
                              _model.insertAtIndexInInd(_model.temp!, 0);
                              safeSetState(() {});
                              _model.temp = _model.temp! + 1;
                              safeSetState(() {});
                            }
                            await Future.wait([
                              Future(() async {
                                if (_model.todaysListOfDishes?.breakfasts
                                        ?.length !=
                                    0) {
                                  _model.insertAtIndexInNumOfDocs(
                                      0,
                                      _model.todaysListOfDishes!.breakfasts
                                          .length);
                                  safeSetState(() {});
                                  while (_model.ind.elementAtOrNull(0)! <
                                      _model.numOfDocs.elementAtOrNull(0)!) {
                                    _model.breakfast = await ListOfDishesRecord
                                        .getDocumentOnce(_model
                                            .todaysListOfDishes!.breakfasts
                                            .elementAtOrNull(_model.ind
                                                .elementAtOrNull(0)!)!);
                                    _model.addToBreakfasts(_model.breakfast!);
                                    safeSetState(() {});
                                    _model.updateIndAtIndex(
                                      0,
                                      (e) => e + 1,
                                    );
                                    safeSetState(() {});
                                  }
                                }
                              }),
                              Future(() async {
                                if (_model
                                        .todaysListOfDishes?.lunches?.length !=
                                    0) {
                                  _model.insertAtIndexInNumOfDocs(
                                      1,
                                      _model
                                          .todaysListOfDishes!.lunches.length);
                                  safeSetState(() {});
                                  while (_model.ind.elementAtOrNull(1)! <
                                      _model.numOfDocs.elementAtOrNull(1)!) {
                                    _model.lunch = await ListOfDishesRecord
                                        .getDocumentOnce(_model
                                            .todaysListOfDishes!.lunches
                                            .elementAtOrNull(_model.ind
                                                .elementAtOrNull(1)!)!);
                                    _model.addToLunches(_model.lunch!);
                                    safeSetState(() {});
                                    _model.updateIndAtIndex(
                                      1,
                                      (e) => e + 1,
                                    );
                                    safeSetState(() {});
                                  }
                                }
                              }),
                              Future(() async {
                                if (_model
                                        .todaysListOfDishes?.dinners?.length !=
                                    0) {
                                  _model.insertAtIndexInNumOfDocs(
                                      2,
                                      _model
                                          .todaysListOfDishes!.dinners.length);
                                  safeSetState(() {});
                                  while (_model.ind.elementAtOrNull(2)! <
                                      _model.numOfDocs.elementAtOrNull(2)!) {
                                    _model.dinner = await ListOfDishesRecord
                                        .getDocumentOnce(_model
                                            .todaysListOfDishes!.dinners
                                            .elementAtOrNull(_model.ind
                                                .elementAtOrNull(2)!)!);
                                    _model.addToDinners(_model.dinner!);
                                    safeSetState(() {});
                                    _model.updateIndAtIndex(
                                      2,
                                      (e) => e + 1,
                                    );
                                    safeSetState(() {});
                                  }
                                }
                              }),
                              Future(() async {
                                if (_model.todaysListOfDishes?.others?.length !=
                                    0) {
                                  _model.insertAtIndexInNumOfDocs(3,
                                      _model.todaysListOfDishes!.others.length);
                                  safeSetState(() {});
                                  while (_model.ind.elementAtOrNull(3)! <
                                      _model.numOfDocs.elementAtOrNull(3)!) {
                                    _model.other = await ListOfDishesRecord
                                        .getDocumentOnce(_model
                                            .todaysListOfDishes!.others
                                            .elementAtOrNull(_model.ind
                                                .elementAtOrNull(3)!)!);
                                    _model.addToOthers(_model.other!);
                                    safeSetState(() {});
                                    _model.updateIndAtIndex(
                                      3,
                                      (e) => e + 1,
                                    );
                                    safeSetState(() {});
                                  }
                                }
                              }),
                            ]);
                          }
                          safeSetState(() {});
                        },
                        titleStyle: GoogleFonts.getFont(
                          'Inter',
                          color: Color(0xFF0B0B0B),
                          fontSize: 20.0,
                        ),
                        dayOfWeekStyle: GoogleFonts.getFont(
                          'Inter',
                          color: Color(0xFF919191),
                          fontSize: 15.0,
                        ),
                        dateStyle: GoogleFonts.getFont(
                          'Inter',
                          color: Color(0xFF0B0B0B),
                          fontSize: 15.0,
                        ),
                        selectedDateStyle: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        inactiveDateStyle: TextStyle(
                          color: Color(0xFF919191),
                          fontSize: 15.0,
                        ),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          height: 400.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(36.0),
                              topRight: Radius.circular(36.0),
                            ),
                          ),
                          child: StreamBuilder<List<DateListOfDishesRecord>>(
                            stream: queryDateListOfDishesRecord(
                              parent: FFAppState().currentUserRef,
                              queryBuilder: (dateListOfDishesRecord) =>
                                  dateListOfDishesRecord.where(
                                'date',
                                isEqualTo: _model.calendarSelectedDay?.start,
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFF57F44),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<DateListOfDishesRecord>
                                  dateInfoDateListOfDishesRecordList =
                                  snapshot.data!;
                              final dateInfoDateListOfDishesRecord =
                                  dateInfoDateListOfDishesRecordList.isNotEmpty
                                      ? dateInfoDateListOfDishesRecordList.first
                                      : null;

                              return Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kbreakfast8978070,
                                                color: Color(0xFF0B0B0B),
                                                size: 25.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 10.0, 0.0, 10.0),
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
                                                    if (_model.tagClick
                                                            .elementAtOrNull(
                                                                0) ==
                                                        'Breakfast') {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        0,
                                                        (_) => 'Breakfast',
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '250mxy60' /* Сніданок */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.tagClick
                                                .elementAtOrNull(0) ==
                                            'Breakfast')
                                          Builder(
                                            builder: (context) {
                                              final breakfastList =
                                                  dateInfoDateListOfDishesRecord
                                                          ?.breakfasts
                                                          ?.toList() ??
                                                      [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    breakfastList.length,
                                                    (breakfastListIndex) {
                                                  final breakfastListItem =
                                                      breakfastList[
                                                          breakfastListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        ListOfDishesRecord>(
                                                      stream: ListOfDishesRecord
                                                          .getDocument(
                                                              breakfastListItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFFF57F44),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final nameListOfDishesRecord =
                                                            snapshot.data!;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'MealIngridients',
                                                              queryParameters: {
                                                                'choosedMeal':
                                                                    serializeParam(
                                                                  breakfastListItem,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                nameListOfDishesRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.ksalad2515150,
                                                color: Color(0xFF0B0B0B),
                                                size: 25.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 10.0, 0.0, 10.0),
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
                                                    if (_model.tagClick
                                                            .elementAtOrNull(
                                                                1) ==
                                                        'Lunch') {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        1,
                                                        (_) => 'Lunch',
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1rel2ajb' /* Обід */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.tagClick
                                                .elementAtOrNull(1) ==
                                            'Lunch')
                                          Builder(
                                            builder: (context) {
                                              final lunchesList =
                                                  dateInfoDateListOfDishesRecord
                                                          ?.lunches
                                                          ?.toList() ??
                                                      [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    lunchesList.length,
                                                    (lunchesListIndex) {
                                                  final lunchesListItem =
                                                      lunchesList[
                                                          lunchesListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        ListOfDishesRecord>(
                                                      stream: ListOfDishesRecord
                                                          .getDocument(
                                                              lunchesListItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFFF57F44),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final nameListOfDishesRecord =
                                                            snapshot.data!;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'MealIngridients',
                                                              queryParameters: {
                                                                'choosedMeal':
                                                                    serializeParam(
                                                                  lunchesListItem,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                nameListOfDishesRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kchristmasDinner3778437,
                                                color: Color(0xFF0B0B0B),
                                                size: 25.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 10.0, 0.0, 10.0),
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
                                                    if (_model.tagClick
                                                            .elementAtOrNull(
                                                                2) ==
                                                        'Dinner') {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        2,
                                                        (_) => 'Dinner',
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'h6y2qab1' /* Вечеря */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.tagClick
                                                .elementAtOrNull(2) ==
                                            'Dinner')
                                          Builder(
                                            builder: (context) {
                                              final dinnersList =
                                                  dateInfoDateListOfDishesRecord
                                                          ?.dinners
                                                          ?.toList() ??
                                                      [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    dinnersList.length,
                                                    (dinnersListIndex) {
                                                  final dinnersListItem =
                                                      dinnersList[
                                                          dinnersListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        ListOfDishesRecord>(
                                                      stream: ListOfDishesRecord
                                                          .getDocument(
                                                              dinnersListItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFFF57F44),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final nameListOfDishesRecord =
                                                            snapshot.data!;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'MealIngridients',
                                                              queryParameters: {
                                                                'choosedMeal':
                                                                    serializeParam(
                                                                  dinnersListItem,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                nameListOfDishesRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kfoodTray4200884,
                                                color: Color(0xFF0B0B0B),
                                                size: 25.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 10.0, 0.0, 10.0),
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
                                                    if (_model.tagClick
                                                            .elementAtOrNull(
                                                                3) ==
                                                        'Other') {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .updateTagClickAtIndex(
                                                        3,
                                                        (_) => 'Other',
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'facn0rrm' /* Інше */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.tagClick
                                                .elementAtOrNull(3) ==
                                            'Other')
                                          Builder(
                                            builder: (context) {
                                              final othersList =
                                                  dateInfoDateListOfDishesRecord
                                                          ?.others
                                                          ?.toList() ??
                                                      [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    othersList.length,
                                                    (othersListIndex) {
                                                  final othersListItem =
                                                      othersList[
                                                          othersListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        ListOfDishesRecord>(
                                                      stream: ListOfDishesRecord
                                                          .getDocument(
                                                              othersListItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFFF57F44),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final nameListOfDishesRecord =
                                                            snapshot.data!;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'MealIngridients',
                                                              queryParameters: {
                                                                'choosedMeal':
                                                                    serializeParam(
                                                                  othersListItem,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                nameListOfDishesRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                      ].addToEnd(SizedBox(height: 50.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.homeFirstVisitController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
