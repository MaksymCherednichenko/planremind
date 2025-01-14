import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/add_pets_event_popup/add_pets_event_popup_widget.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import '/walkthroughs/pets_first_enter.dart';
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
import 'pets_planner_page_model.dart';
export 'pets_planner_page_model.dart';

class PetsPlannerPageWidget extends StatefulWidget {
  const PetsPlannerPageWidget({super.key});

  @override
  State<PetsPlannerPageWidget> createState() => _PetsPlannerPageWidgetState();
}

class _PetsPlannerPageWidgetState extends State<PetsPlannerPageWidget> {
  late PetsPlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsPlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.petsModuleOpened == false) {
        safeSetState(() =>
            _model.petsFirstEnterController = createPageWalkthrough(context));
        _model.petsFirstEnterController?.show(context: context);

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              userLoginHistory: createUserLoginHistoryStruct(
                petsModuleOpened: true,
                clearUnsetFields: false,
              ),
            ));
      }
      _model.eventsOutput = await queryPetsEventRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.petsOutput = await queryPetsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.todayList = functions
          .filterPetsEventByDateFunction(
              _model.eventsOutput!.toList(), _model.calendarSelectedDay!.start)
          .toList()
          .cast<PetsEventRecord>();
      _model.pets = _model.petsOutput!.toList().cast<PetsRecord>();
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
            if (_model.pets.length > 0) {
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
                      child: AddPetsEventPopupWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              _model.eventsOutput3 = await queryPetsEventRecordOnce(
                parent: FFAppState().currentUserRef,
              );
              _model.petsOutput3 = await queryPetsRecordOnce(
                parent: FFAppState().currentUserRef,
              );
              _model.todayList = functions
                  .filterPetsEventByDateFunction(_model.eventsOutput3!.toList(),
                      _model.calendarSelectedDay!.start)
                  .toList()
                  .cast<PetsEventRecord>();
              _model.pets = _model.petsOutput3!.toList().cast<PetsRecord>();
              safeSetState(() {});
            } else {
              context.pushNamed('PetsPetPage');
            }

            safeSetState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).pets,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('HubPage');
                },
                text: '',
                icon: Icon(
                  FFIcons.kaltArrowLeft,
                  color: FlutterFlowTheme.of(context).pets,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  height: 24.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '85xeb4fi' /* Улюбленці */,
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
                  color: FlutterFlowTheme.of(context).pets,
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
                              context.goNamed('PetsHistoryPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              '6kiv45ok' /* History */,
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
                            buttonEi584ysv,
                            _model.petsFirstEnterController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '0umoppk5' /* Planner */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).pets,
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
                            button3ukkvq3z,
                            _model.petsFirstEnterController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('PetsPetPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              '9rxpnkej' /* Pets */,
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
                            buttonF9vzmkqt,
                            _model.petsFirstEnterController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).addWalkthrough(
                  containerLatpzwf6,
                  _model.petsFirstEnterController,
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
                    color: FlutterFlowTheme.of(context).pets,
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
                      _model.eventsOutput2 = await queryPetsEventRecordOnce(
                        parent: FFAppState().currentUserRef,
                      );
                      _model.petsOutput2 = await queryPetsRecordOnce(
                        parent: FFAppState().currentUserRef,
                      );
                      _model.todayList = functions
                          .filterPetsEventByDateFunction(
                              _model.eventsOutput2!.toList(),
                              _model.calendarSelectedDay!.start)
                          .toList()
                          .cast<PetsEventRecord>();
                      _model.pets =
                          _model.petsOutput2!.toList().cast<PetsRecord>();
                      safeSetState(() {});
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
                Stack(
                  children: [
                    if (_model.todayList.isNotEmpty)
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
                            child: Builder(
                              builder: (context) {
                                final eventList = _model.todayList.toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(eventList.length,
                                      (eventListIndex) {
                                    final eventListItem =
                                        eventList[eventListIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
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
                                                          PetsEventInfoPopupWidget(
                                                        petEvent: eventListItem,
                                                        selectedDate: functions
                                                            .getDateOnly(_model
                                                                .calendarSelectedDay!
                                                                .start),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
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
                                                    Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if (_model.pets
                                                                  .where((e) =>
                                                                      e.reference ==
                                                                      eventListItem
                                                                          .pet)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.color ==
                                                              MyColorsEnum
                                                                  .red) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .error;
                                                          } else if (_model.pets
                                                                  .where((e) =>
                                                                      e.reference ==
                                                                      eventListItem
                                                                          .pet)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.color ==
                                                              MyColorsEnum
                                                                  .orange) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary;
                                                          } else if (_model.pets
                                                                  .where((e) =>
                                                                      e.reference ==
                                                                      eventListItem
                                                                          .pet)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.color ==
                                                              MyColorsEnum
                                                                  .yellow) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .warning;
                                                          } else if (_model.pets
                                                                  .where((e) =>
                                                                      e.reference ==
                                                                      eventListItem
                                                                          .pet)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.color ==
                                                              MyColorsEnum
                                                                  .green) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary;
                                                          } else if (_model.pets
                                                                  .where((e) => e.reference == eventListItem.pet)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.color ==
                                                              MyColorsEnum.sky) {
                                                            return Color(
                                                                0xFF39B3EF);
                                                          } else if (_model.pets.where((e) => e.reference == eventListItem.pet).toList().firstOrNull?.color == MyColorsEnum.blue) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primary;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .error;
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
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
                                                                () {
                                                                  if (eventListItem
                                                                          .eventType ==
                                                                      PetsEventsEnum
                                                                          .vetvisit) {
                                                                    return 'Похід до ветеринара';
                                                                  } else if (eventListItem
                                                                          .eventType ==
                                                                      PetsEventsEnum
                                                                          .grooming) {
                                                                    return 'Грумінг';
                                                                  } else if (eventListItem
                                                                          .eventType ==
                                                                      PetsEventsEnum
                                                                          .shoping) {
                                                                    return 'Шопінг';
                                                                  } else if (eventListItem
                                                                          .eventType ==
                                                                      PetsEventsEnum
                                                                          .vaccination) {
                                                                    return 'Вакцинація';
                                                                  } else if (eventListItem
                                                                          .eventType ==
                                                                      PetsEventsEnum
                                                                          .antiparaciticmedication) {
                                                                    return 'Прийом медикаментів';
                                                                  } else {
                                                                    return 'Похід до ветеринара';
                                                                  }
                                                                }(),
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Text(
                                                                _model.pets
                                                                    .where((e) =>
                                                                        e.reference ==
                                                                        eventListItem
                                                                            .pet)
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<
                                                              PetsEventHistoryRecord>>(
                                                        stream:
                                                            queryPetsEventHistoryRecord(
                                                          parent: FFAppState()
                                                              .currentUserRef,
                                                          queryBuilder:
                                                              (petsEventHistoryRecord) =>
                                                                  petsEventHistoryRecord
                                                                      .where(
                                                                        'eventReference',
                                                                        isEqualTo:
                                                                            eventListItem.reference,
                                                                      )
                                                                      .where(
                                                                        'date',
                                                                        isEqualTo:
                                                                            functions.getDateOnly(getCurrentTimestamp),
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
                                                          List<PetsEventHistoryRecord>
                                                              iconPetsEventHistoryRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final iconPetsEventHistoryRecord =
                                                              iconPetsEventHistoryRecordList
                                                                      .isNotEmpty
                                                                  ? iconPetsEventHistoryRecordList
                                                                      .first
                                                                  : null;

                                                          return Icon(
                                                            Icons.done,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (eventListIndex <
                                                    functions.minus(
                                                        _model.todayList.length,
                                                        1))
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
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    if ((_model.todayList.isNotEmpty) == false)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '90lfitav' /* На сьогоднi подiй немає */,
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
          safeSetState(() => _model.petsFirstEnterController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
