import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_module/popups/new_medication_popup/new_medication_popup_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'today_medication_page_model.dart';
export 'today_medication_page_model.dart';

class TodayMedicationPageWidget extends StatefulWidget {
  const TodayMedicationPageWidget({super.key});

  @override
  State<TodayMedicationPageWidget> createState() =>
      _TodayMedicationPageWidgetState();
}

class _TodayMedicationPageWidgetState extends State<TodayMedicationPageWidget> {
  late TodayMedicationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodayMedicationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allMedication = await queryMedicationRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (medicationRecord) => medicationRecord.where(
          'state',
          isNotEqualTo: RecordStateEnum.deleted.serialize(),
        ),
      );
      _model.filteredMedication = await actions.filterMedicationForDay(
        _model.allMedication!.toList(),
        getCurrentTimestamp,
      );
      _model.todayMedication =
          _model.filteredMedication!.toList().cast<MedicationRecord>();
      _model.selectedDay = getCurrentTimestamp;
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
                    child: NewMedicationPopupWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            _model.allMedication4 = await queryMedicationRecordOnce(
              parent: FFAppState().currentUserRef,
              queryBuilder: (medicationRecord) => medicationRecord.where(
                'state',
                isNotEqualTo: RecordStateEnum.deleted.serialize(),
              ),
            );
            _model.filteredMedication4 = await actions.filterMedicationForDay(
              _model.allMedication4!.toList(),
              _model.medicationCalendarSelectedDay!.start,
            );
            _model.todayMedication =
                _model.filteredMedication4!.toList().cast<MedicationRecord>();
            _model.selectedDay = getCurrentTimestamp;
            safeSetState(() {});

            safeSetState(() {});
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
                '68633igz' /* Здоров'я */,
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
            preferredSize: Size.fromHeight(134.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('HealthHistoryPageEvents');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'b87x90if' /* History */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed('HealthPlannerPage');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'zfq2ui0v' /* Planner */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'cjrwigpl' /* Medication */,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  '03oz1zjj' /* Сьогодні */,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed('AllMedicationPage');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'kjnofc5f' /* Всі ліки */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).health,
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    weekFormat: true,
                    weekStartsMonday: true,
                    initialDate: getCurrentTimestamp,
                    rowHeight: 64.0,
                    onChange: (DateTimeRange? newSelectedDate) async {
                      if (_model.medicationCalendarSelectedDay ==
                          newSelectedDate) {
                        return;
                      }
                      _model.medicationCalendarSelectedDay = newSelectedDate;
                      _model.allMedication2 = await queryMedicationRecordOnce(
                        parent: FFAppState().currentUserRef,
                        queryBuilder: (medicationRecord) =>
                            medicationRecord.where(
                          'state',
                          isNotEqualTo: RecordStateEnum.deleted.serialize(),
                        ),
                      );
                      _model.filteredMedication2 =
                          await actions.filterMedicationForDay(
                        _model.allMedication2!.toList(),
                        _model.medicationCalendarSelectedDay!.start,
                      );
                      _model.todayMedication = _model.filteredMedication2!
                          .toList()
                          .cast<MedicationRecord>();
                      _model.selectedDay =
                          _model.medicationCalendarSelectedDay?.end;
                      safeSetState(() {});
                      safeSetState(() {});
                    },
                    titleStyle:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    dayOfWeekStyle:
                        FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    selectedDateStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    inactiveDateStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  if (((_model.todayMedication.isNotEmpty) == true) &&
                      (_model.selectedDay != null))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final medicationList =
                              _model.todayMedication.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(medicationList.length,
                                (medicationListIndex) {
                              final medicationListItem =
                                  medicationList[medicationListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: StreamBuilder<
                                    List<MedicationsArchiveRecord>>(
                                  stream: queryMedicationsArchiveRecord(
                                    parent: FFAppState().currentUserRef,
                                    queryBuilder: (medicationsArchiveRecord) =>
                                        medicationsArchiveRecord
                                            .where(
                                              'medicationId',
                                              isEqualTo:
                                                  medicationListItem.reference,
                                            )
                                            .where(
                                              'date',
                                              isEqualTo: functions.getDateOnly(
                                                  _model
                                                      .medicationCalendarSelectedDay!
                                                      .start),
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFFF57F44),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MedicationsArchiveRecord>
                                        containerMedicationsArchiveRecordList =
                                        snapshot.data!;
                                    final containerMedicationsArchiveRecord =
                                        containerMedicationsArchiveRecordList
                                                .isNotEmpty
                                            ? containerMedicationsArchiveRecordList
                                                .first
                                            : null;

                                    return InkWell(
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
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: NewMedicationPopupWidget(
                                                  medication:
                                                      medicationListItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        _model.allMedication3 =
                                            await queryMedicationRecordOnce(
                                          parent: FFAppState().currentUserRef,
                                          queryBuilder: (medicationRecord) =>
                                              medicationRecord.where(
                                            'state',
                                            isNotEqualTo: RecordStateEnum
                                                .deleted
                                                .serialize(),
                                          ),
                                        );
                                        _model.filteredMedication3 =
                                            await actions
                                                .filterMedicationForDay(
                                          _model.allMedication3!.toList(),
                                          _model.medicationCalendarSelectedDay!
                                              .start,
                                        );
                                        _model.todayMedication = _model
                                            .filteredMedication3!
                                            .toList()
                                            .cast<MedicationRecord>();
                                        _model.selectedDay =
                                            getCurrentTimestamp;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    FFIcons.kheartPulse,
                                                    color: FlutterFlowTheme.of(
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
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              medicationListItem
                                                                  .name,
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
                                                          ),
                                                          Text(
                                                            '${medicationListItem.dose.toString()} ${() {
                                                              if (medicationListItem
                                                                      .doseType ==
                                                                  MedicationDoseEnum
                                                                      .pill) {
                                                                return 'pill';
                                                              } else if (medicationListItem
                                                                      .doseType ==
                                                                  MedicationDoseEnum
                                                                      .ml) {
                                                                return 'ml';
                                                              } else if (medicationListItem
                                                                      .doseType ==
                                                                  MedicationDoseEnum
                                                                      .mg) {
                                                                return 'mg';
                                                              } else {
                                                                return 'pill';
                                                              }
                                                            }()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final timelist =
                                                      medicationListItem
                                                          .frequency.timeOfUsage
                                                          .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        timelist.length,
                                                        (timelistIndex) {
                                                      final timelistItem =
                                                          timelist[
                                                              timelistIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    34.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                "Hm",
                                                                timelistItem
                                                                    .time,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (containerMedicationsArchiveRecord !=
                                                                        null
                                                                    ? functions.isMedicationUsedAtTime(
                                                                        containerMedicationsArchiveRecord!
                                                                            .timeOfUsage
                                                                            .toList(),
                                                                        timelistItem
                                                                            .time)
                                                                    : false)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.medicationCountCopy =
                                                                          await queryMedicationsArchiveRecordOnce(
                                                                        parent:
                                                                            FFAppState().currentUserRef,
                                                                        queryBuilder: (medicationsArchiveRecord) => medicationsArchiveRecord
                                                                            .where(
                                                                              'medicationId',
                                                                              isEqualTo: medicationListItem.reference,
                                                                            )
                                                                            .where(
                                                                              'date',
                                                                              isEqualTo: functions.getDateOnly(_model.medicationCalendarSelectedDay!.start),
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      if ((_model.medicationCountCopy !=
                                                                              null) ==
                                                                          false) {
                                                                        await MedicationsArchiveRecord.createDoc(FFAppState().currentUserRef!)
                                                                            .set({
                                                                          ...createMedicationsArchiveRecordData(
                                                                            date:
                                                                                functions.getDateOnly(_model.medicationCalendarSelectedDay!.start),
                                                                            medicationId:
                                                                                medicationListItem.reference,
                                                                            isDone:
                                                                                false,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeOfUsage': getMedicationUsageTimeListFirestoreData(
                                                                                functions.toggleUseageFlagonTimeList(medicationListItem.frequency.timeOfUsage.toList(), timelistItem),
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                      } else {
                                                                        await _model
                                                                            .medicationCountCopy!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeOfUsage': getMedicationUsageTimeListFirestoreData(
                                                                                functions.toggleUseageFlagonTimeList(containerMedicationsArchiveRecord!.timeOfUsage.toList(), timelistItem),
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .health,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                if (containerMedicationsArchiveRecord !=
                                                                        null
                                                                    ? (functions.isMedicationUsedAtTime(
                                                                            containerMedicationsArchiveRecord!.timeOfUsage.toList(),
                                                                            timelistItem.time) ==
                                                                        false)
                                                                    : true)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.medicationCount =
                                                                          await queryMedicationsArchiveRecordOnce(
                                                                        parent:
                                                                            FFAppState().currentUserRef,
                                                                        queryBuilder: (medicationsArchiveRecord) => medicationsArchiveRecord
                                                                            .where(
                                                                              'medicationId',
                                                                              isEqualTo: medicationListItem.reference,
                                                                            )
                                                                            .where(
                                                                              'date',
                                                                              isEqualTo: functions.getDateOnly(_model.medicationCalendarSelectedDay!.start),
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      if ((_model.medicationCount !=
                                                                              null) !=
                                                                          true) {
                                                                        var medicationsArchiveRecordReference =
                                                                            MedicationsArchiveRecord.createDoc(FFAppState().currentUserRef!);
                                                                        await medicationsArchiveRecordReference
                                                                            .set({
                                                                          ...createMedicationsArchiveRecordData(
                                                                            date:
                                                                                functions.getDateOnly(_model.medicationCalendarSelectedDay!.start),
                                                                            medicationId:
                                                                                medicationListItem.reference,
                                                                            isDone:
                                                                                false,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeOfUsage': getMedicationUsageTimeListFirestoreData(
                                                                                functions.toggleUseageFlagonTimeList(medicationListItem.frequency.timeOfUsage.toList(), timelistItem),
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.createdIte =
                                                                            MedicationsArchiveRecord.getDocumentFromData({
                                                                          ...createMedicationsArchiveRecordData(
                                                                            date:
                                                                                functions.getDateOnly(_model.medicationCalendarSelectedDay!.start),
                                                                            medicationId:
                                                                                medicationListItem.reference,
                                                                            isDone:
                                                                                false,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeOfUsage': getMedicationUsageTimeListFirestoreData(
                                                                                functions.toggleUseageFlagonTimeList(medicationListItem.frequency.timeOfUsage.toList(), timelistItem),
                                                                              ),
                                                                            },
                                                                          ),
                                                                        }, medicationsArchiveRecordReference);
                                                                        if (functions.medicationIsUsed(_model
                                                                            .createdIte!
                                                                            .timeOfUsage
                                                                            .toList())) {
                                                                          await _model
                                                                              .createdIte!
                                                                              .reference
                                                                              .update(createMedicationsArchiveRecordData(
                                                                            isDone:
                                                                                true,
                                                                          ));
                                                                        }
                                                                      } else {
                                                                        await _model
                                                                            .medicationCount!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeOfUsage': getMedicationUsageTimeListFirestoreData(
                                                                                functions.toggleUseageFlagonTimeList(containerMedicationsArchiveRecord!.timeOfUsage.toList(), timelistItem),
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (functions.medicationIsUsed(functions
                                                                            .toggleUseageFlagonTimeList(containerMedicationsArchiveRecord!.timeOfUsage.toList(),
                                                                                timelistItem)
                                                                            .toList())) {
                                                                          await _model
                                                                              .medicationCount!
                                                                              .reference
                                                                              .update(createMedicationsArchiveRecordData(
                                                                            isDone:
                                                                                true,
                                                                          ));
                                                                        }
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .radio_button_off,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .health,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                              ],
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
                                    );
                                  },
                                ),
                              );
                            }).addToEnd(SizedBox(height: 30.0)),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
