import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/planner.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
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
      FFAppState().indexMain = 0;
      FFAppState().selectedDate = getCurrentTimestamp;
      setState(() {});
      while (FFAppState().indexMain < 4) {
        _model.insertAtIndexInTagClick(FFAppState().indexMain, '0');
        setState(() {});
        FFAppState().indexMain = FFAppState().indexMain + 1;
        setState(() {});
      }
      FFAppState().indexMain = 0;
      setState(() {});
      unawaited(
        () async {
          await _model.initTagClick(context);
        }(),
      );
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('HomeCategories');
              },
              text: '',
              icon: Icon(
                FFIcons.kaltArrowLeft,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 24.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Color(0xFFF57F44),
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
                'ormc4x80' /* Home */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('Settings');
                },
                text: '',
                icon: Icon(
                  FFIcons.ksettingsGrey,
                  color: FlutterFlowTheme.of(context).home,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 24.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
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
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 59.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
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
                                  context.pushNamed('HomeShoppingActual');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'fah9820a' /* Shopping */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation1']!),
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
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('StorageFood');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'xlw47m23' /* Storage */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                      setState(() {});
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
                  ).addWalkthrough(
                    calendarQ4bvrncx,
                    _model.plannerController,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 242.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 24.0, 0.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.tagClick[0] ==
                                                  'Breakfast') {
                                                _model.updateTagClickAtIndex(
                                                  0,
                                                  (_) => '0',
                                                );
                                                setState(() {});
                                              } else {
                                                _model.updateTagClickAtIndex(
                                                  0,
                                                  (_) => 'Breakfast',
                                                );
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '250mxy60' /* Сніданок */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  if (_model.tagClick[0] == 'Breakfast')
                                    StreamBuilder<List<ListOfDishesRecord>>(
                                      stream: queryListOfDishesRecord(
                                        queryBuilder: (listOfDishesRecord) =>
                                            listOfDishesRecord
                                                .where(
                                                  'date',
                                                  isEqualTo:
                                                      FFAppState().selectedDate,
                                                )
                                                .where(
                                                  'tag',
                                                  isEqualTo: 'Breakfast',
                                                )
                                                .where(
                                                  'userID',
                                                  isEqualTo:
                                                      FFAppState().userID,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF57F44),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListOfDishesRecord>
                                            columnListOfDishesRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnListOfDishesRecordList
                                                  .length, (columnIndex) {
                                            final columnListOfDishesRecord =
                                                columnListOfDishesRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'MealIngridients',
                                                    queryParameters: {
                                                      'choosedMeal':
                                                          serializeParam(
                                                        columnListOfDishesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                onLongPress: () async {
                                                  await columnListOfDishesRecord
                                                      .reference
                                                      .delete();
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    columnListOfDishesRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(25.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                              ),
                                            );
                                          }),
                                        ).addWalkthrough(
                                          columnHrvnza0x,
                                          _model.plannerController,
                                        );
                                      },
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          FFIcons.ksalad2515150,
                                          color: Color(0xFF0B0B0B),
                                          size: 25.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.tagClick[1] ==
                                                  'Lunch') {
                                                _model.updateTagClickAtIndex(
                                                  1,
                                                  (_) => '0',
                                                );
                                                setState(() {});
                                              } else {
                                                _model.updateTagClickAtIndex(
                                                  1,
                                                  (_) => 'Lunch',
                                                );
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1rel2ajb' /* Обід */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  if (_model.tagClick[1] == 'Lunch')
                                    StreamBuilder<List<ListOfDishesRecord>>(
                                      stream: queryListOfDishesRecord(
                                        queryBuilder: (listOfDishesRecord) =>
                                            listOfDishesRecord
                                                .where(
                                                  'date',
                                                  isEqualTo:
                                                      FFAppState().selectedDate,
                                                )
                                                .where(
                                                  'tag',
                                                  isEqualTo: 'Lunch',
                                                )
                                                .where(
                                                  'userID',
                                                  isEqualTo:
                                                      FFAppState().userID,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF57F44),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListOfDishesRecord>
                                            columnListOfDishesRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnListOfDishesRecordList
                                                  .length, (columnIndex) {
                                            final columnListOfDishesRecord =
                                                columnListOfDishesRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'MealIngridients',
                                                    queryParameters: {
                                                      'choosedMeal':
                                                          serializeParam(
                                                        columnListOfDishesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                onLongPress: () async {
                                                  await columnListOfDishesRecord
                                                      .reference
                                                      .delete();
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    columnListOfDishesRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(25.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          FFIcons.kchristmasDinner3778437,
                                          color: Color(0xFF0B0B0B),
                                          size: 25.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.tagClick[2] ==
                                                  'Dinner') {
                                                _model.updateTagClickAtIndex(
                                                  2,
                                                  (_) => '0',
                                                );
                                                setState(() {});
                                              } else {
                                                _model.updateTagClickAtIndex(
                                                  2,
                                                  (_) => 'Dinner',
                                                );
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h6y2qab1' /* Вечеря */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  if (_model.tagClick[2] == 'Dinner')
                                    StreamBuilder<List<ListOfDishesRecord>>(
                                      stream: queryListOfDishesRecord(
                                        queryBuilder: (listOfDishesRecord) =>
                                            listOfDishesRecord
                                                .where(
                                                  'date',
                                                  isEqualTo:
                                                      FFAppState().selectedDate,
                                                )
                                                .where(
                                                  'tag',
                                                  isEqualTo: 'Dinner',
                                                )
                                                .where(
                                                  'userID',
                                                  isEqualTo:
                                                      FFAppState().userID,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF57F44),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListOfDishesRecord>
                                            columnListOfDishesRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnListOfDishesRecordList
                                                  .length, (columnIndex) {
                                            final columnListOfDishesRecord =
                                                columnListOfDishesRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'MealIngridients',
                                                    queryParameters: {
                                                      'choosedMeal':
                                                          serializeParam(
                                                        columnListOfDishesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                onLongPress: () async {
                                                  await columnListOfDishesRecord
                                                      .reference
                                                      .delete();
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    columnListOfDishesRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(25.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          FFIcons.kfoodTray4200884,
                                          color: Color(0xFF0B0B0B),
                                          size: 25.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.tagClick[3] ==
                                                  'Other') {
                                                _model.updateTagClickAtIndex(
                                                  3,
                                                  (_) => '0',
                                                );
                                                setState(() {});
                                              } else {
                                                _model.updateTagClickAtIndex(
                                                  3,
                                                  (_) => 'Other',
                                                );
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'facn0rrm' /* Інше */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  if (_model.tagClick[3] == 'Other')
                                    StreamBuilder<List<ListOfDishesRecord>>(
                                      stream: queryListOfDishesRecord(
                                        queryBuilder: (listOfDishesRecord) =>
                                            listOfDishesRecord
                                                .where(
                                                  'date',
                                                  isEqualTo:
                                                      FFAppState().selectedDate,
                                                )
                                                .where(
                                                  'tag',
                                                  isEqualTo: 'Other',
                                                )
                                                .where(
                                                  'userID',
                                                  isEqualTo:
                                                      FFAppState().userID,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF57F44),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListOfDishesRecord>
                                            columnListOfDishesRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnListOfDishesRecordList
                                                  .length, (columnIndex) {
                                            final columnListOfDishesRecord =
                                                columnListOfDishesRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'MealIngridients',
                                                    queryParameters: {
                                                      'choosedMeal':
                                                          serializeParam(
                                                        columnListOfDishesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                onLongPress: () async {
                                                  await columnListOfDishesRecord
                                                      .reference
                                                      .delete();
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    columnListOfDishesRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(25.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var listOfDishesRecordReference =
                                      ListOfDishesRecord.collection.doc();
                                  await listOfDishesRecordReference
                                      .set(createListOfDishesRecordData(
                                    userID: FFAppState().userID,
                                  ));
                                  _model.newListOfDishes =
                                      ListOfDishesRecord.getDocumentFromData(
                                          createListOfDishesRecordData(
                                            userID: FFAppState().userID,
                                          ),
                                          listOfDishesRecordReference);
                                  FFAppState().isDateRange = false;
                                  setState(() {});

                                  context.pushNamed(
                                    'AddMealForPlannerPage',
                                    queryParameters: {
                                      'listOfDishesRef': serializeParam(
                                        _model.newListOfDishes?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  setState(() {});
                                },
                                text: '',
                                icon: Icon(
                                  FFIcons.kplus,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      9.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF57F44),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ).addWalkthrough(
                                buttonZvxw3hp5,
                                _model.plannerController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 498.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9EEE6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(36.0),
                            topRight: Radius.circular(36.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fqvk97u3' /* Виходить термін */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              StreamBuilder<List<UpcomingDataRecord>>(
                                stream: queryUpcomingDataRecord(
                                  queryBuilder: (upcomingDataRecord) =>
                                      upcomingDataRecord
                                          .where(
                                            'date',
                                            isGreaterThanOrEqualTo:
                                                functions.increaseDate(
                                                    getCurrentTimestamp, -2),
                                          )
                                          .where(
                                            'userID',
                                            isEqualTo: FFAppState().userID,
                                          )
                                          .orderBy('date'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFF57F44),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UpcomingDataRecord>
                                      upcomingDataUpcomingDataRecordList =
                                      snapshot.data!;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        upcomingDataUpcomingDataRecordList
                                            .length, (upcomingDataIndex) {
                                      final upcomingDataUpcomingDataRecord =
                                          upcomingDataUpcomingDataRecordList[
                                              upcomingDataIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                  'd MMMM',
                                                  upcomingDataUpcomingDataRecord
                                                      .date!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFB7B7B7),
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 8.0, 24.0, 16.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<
                                                          UpcomingNamesRecord>>(
                                                    stream:
                                                        queryUpcomingNamesRecord(
                                                      parent:
                                                          upcomingDataUpcomingDataRecord
                                                              .reference,
                                                    ),
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
                                                      List<UpcomingNamesRecord>
                                                          columnUpcomingNamesRecordList =
                                                          snapshot.data!;

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnUpcomingNamesRecordList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnUpcomingNamesRecord =
                                                              columnUpcomingNamesRecordList[
                                                                  columnIndex];
                                                          return ListTile(
                                                            title: Text(
                                                              columnUpcomingNamesRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            dense: false,
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
          safeSetState(() => _model.plannerController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
