import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/new_event_popup/new_event_popup_widget.dart';
import '/walkthroughs/health_first_enter.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_planner_page_model.dart';
export 'health_planner_page_model.dart';

class HealthPlannerPageWidget extends StatefulWidget {
  const HealthPlannerPageWidget({super.key});

  @override
  State<HealthPlannerPageWidget> createState() =>
      _HealthPlannerPageWidgetState();
}

class _HealthPlannerPageWidgetState extends State<HealthPlannerPageWidget> {
  late HealthPlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthPlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.healthModuleOpened ==
          false) {
        safeSetState(() =>
            _model.healthFirstEnterController = createPageWalkthrough(context));
        _model.healthFirstEnterController?.show(context: context);

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              userLoginHistory: createUserLoginHistoryStruct(
                healthModuleOpened: true,
                clearUnsetFields: false,
              ),
            ));
      }
      FFAppState().selectedDate = getCurrentTimestamp;
      safeSetState(() {});
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
        backgroundColor: Color(0xFFF5F5F5),
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
                    child: NewEventPopupWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).health,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
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
                color: FlutterFlowTheme.of(context).health,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 24.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Color(0xFF3765C0),
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
                'ols081o9' /* Здоров'я */,
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
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('Settings');
                },
                text: '',
                icon: Icon(
                  FFIcons.ksettingsGrey,
                  color: FlutterFlowTheme.of(context).health,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 24.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                              context.pushNamed('HealthHistoryPageEvents');
                            },
                            text: FFLocalizations.of(context).getText(
                              'cz14pkeq' /* History */,
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
                            button064jt0mu,
                            _model.healthFirstEnterController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '9tzn45qn' /* Planner */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).health,
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
                            buttonYtmrjgzr,
                            _model.healthFirstEnterController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('TodayMedicationPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'fn7dv4m6' /* Medication */,
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
                            buttonOe0kxieu,
                            _model.healthFirstEnterController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).addWalkthrough(
                  containerDperatl9,
                  _model.healthFirstEnterController,
                ),
              ),
            ),
          ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).health,
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    weekFormat: false,
                    weekStartsMonday: true,
                    initialDate: getCurrentTimestamp,
                    rowHeight: 40.0,
                    onChange: (DateTimeRange? newSelectedDate) {
                      safeSetState(
                          () => _model.calendarSelectedDay = newSelectedDate);
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
                FutureBuilder<int>(
                  future: queryHealthEventRecordCount(
                    parent: FFAppState().currentUserRef,
                    queryBuilder: (healthEventRecord) =>
                        healthEventRecord.where(
                      'dateOnly',
                      isEqualTo: functions
                          .getDateOnly(_model.calendarSelectedDay!.start),
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFF57F44),
                            ),
                          ),
                        ),
                      );
                    }
                    int stackCount = snapshot.data!;

                    return Stack(
                      children: [
                        if (stackCount > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 80.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: StreamBuilder<List<HealthEventRecord>>(
                                  stream: queryHealthEventRecord(
                                    parent: FFAppState().currentUserRef,
                                    queryBuilder: (healthEventRecord) =>
                                        healthEventRecord.where(
                                      'dateOnly',
                                      isEqualTo: functions.getDateOnly(
                                          _model.calendarSelectedDay!.start),
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
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFFF57F44),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<HealthEventRecord>
                                        columnHealthEventRecordList =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnHealthEventRecordList.length,
                                          (columnIndex) {
                                        final columnHealthEventRecord =
                                            columnHealthEventRecordList[
                                                columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kheartPulse,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .health,
                                                        size: 24.0,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          NewEventPopupWidget(
                                                                        healthEvent:
                                                                            columnHealthEventRecord,
                                                                        isViewForm:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    columnHealthEventRecord
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                    "Hm",
                                                                    columnHealthEventRecord
                                                                        .time!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              HealthEventArchiveRecord>>(
                                                        stream:
                                                            queryHealthEventArchiveRecord(
                                                          parent: FFAppState()
                                                              .currentUserRef,
                                                          queryBuilder:
                                                              (healthEventArchiveRecord) =>
                                                                  healthEventArchiveRecord
                                                                      .where(
                                                            'eventReference',
                                                            isEqualTo:
                                                                columnHealthEventRecord
                                                                    .reference,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<HealthEventArchiveRecord>
                                                              checkboxHealthEventArchiveRecordList =
                                                              snapshot.data!;
                                                          final checkboxHealthEventArchiveRecord =
                                                              checkboxHealthEventArchiveRecordList
                                                                      .isNotEmpty
                                                                  ? checkboxHealthEventArchiveRecordList
                                                                      .first
                                                                  : null;

                                                          return Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    CircleBorder(),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                          .checkboxValueMap[
                                                                      columnHealthEventRecord] ??=
                                                                  checkboxHealthEventArchiveRecord !=
                                                                      null,
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxValueMap[
                                                                            columnHealthEventRecord] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  _model.historyCheck =
                                                                      await queryHealthEventArchiveRecordOnce(
                                                                    parent: FFAppState()
                                                                        .currentUserRef,
                                                                    queryBuilder:
                                                                        (healthEventArchiveRecord) =>
                                                                            healthEventArchiveRecord.where(
                                                                      'eventReference',
                                                                      isEqualTo:
                                                                          columnHealthEventRecord
                                                                              .reference,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);
                                                                  if ((checkboxHealthEventArchiveRecord !=
                                                                          null) ==
                                                                      false) {
                                                                    await HealthEventArchiveRecord.createDoc(FFAppState()
                                                                            .currentUserRef!)
                                                                        .set(
                                                                            createHealthEventArchiveRecordData(
                                                                      date: columnHealthEventRecord
                                                                          .time,
                                                                      eventReference:
                                                                          columnHealthEventRecord
                                                                              .reference,
                                                                    ));
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              side: BorderSide(
                                                                width: 2,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .health,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 5.0,
                                                                20.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (columnIndex >
                                                              functions.minus(
                                                                  stackCount,
                                                                  1))
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (stackCount == 0)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'i96u2hf6' /* На сьогоднi подiй немає */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
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
          safeSetState(() => _model.healthFirstEnterController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
