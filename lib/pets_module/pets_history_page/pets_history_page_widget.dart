import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_history_page_model.dart';
export 'pets_history_page_model.dart';

class PetsHistoryPageWidget extends StatefulWidget {
  const PetsHistoryPageWidget({super.key});

  @override
  State<PetsHistoryPageWidget> createState() => _PetsHistoryPageWidgetState();
}

class _PetsHistoryPageWidgetState extends State<PetsHistoryPageWidget> {
  late PetsHistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsHistoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allEventsOutput = await queryPetsEventRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (petsEventRecord) => petsEventRecord.where(
          'date',
          isLessThan: getCurrentTimestamp,
        ),
      );
      _model.allPetsOutput = await queryPetsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.historyEventsList = _model.allEventsOutput!
          .where((e) =>
              functions.getDateOnly(e.date!) <
              functions.getDateOnly(getCurrentTimestamp))
          .toList()
          .toList()
          .cast<PetsEventRecord>();
      _model.pets = _model.allPetsOutput!.toList().cast<PetsRecord>();
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
                '6nyt1ny1' /* Улюбленці */,
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
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'k5f4vqqs' /* History */,
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
                                    color: FlutterFlowTheme.of(context).info,
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
                              context.goNamed('PetsPlannerPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'h57516fr' /* Planner */,
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
                              context.goNamed('PetsPetPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'y6qfka56' /* Pets */,
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
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Builder(
              builder: (context) {
                final dates = functions
                    .getDatesFromPetEventsFunction(
                        _model.historyEventsList.toList())
                    .toList();

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(dates.length, (datesIndex) {
                      final datesItem = dates[datesIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateTimeFormat(
                              "d MMM y",
                              datesItem,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF919191),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
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
                                    final eventList = _model.historyEventsList
                                        .where((e) =>
                                            functions.getDateOnly(e.date!) ==
                                            datesItem)
                                        .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(eventList.length,
                                          (eventListIndex) {
                                        final eventListItem =
                                            eventList[eventListIndex];
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
                                                              PetsEventInfoPopupWidget(
                                                            petEvent:
                                                                eventListItem,
                                                            selectedDate:
                                                                datesItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    _model.pets
                                                                        .where((e) =>
                                                                            e.reference ==
                                                                            eventListItem.pet)
                                                                        .toList()
                                                                        .firstOrNull!
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: () {
                                                              if (_model.pets.where((e) => e.reference == eventListItem.pet).toList().firstOrNull?.color ==
                                                                  MyColorsEnum
                                                                      .red) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else if (_model.pets.where((e) => e.reference == eventListItem.pet).toList().firstOrNull?.color ==
                                                                  MyColorsEnum
                                                                      .orange) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else if (_model
                                                                      .pets
                                                                      .where((e) =>
                                                                          e.reference ==
                                                                          eventListItem
                                                                              .pet)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.color ==
                                                                  MyColorsEnum
                                                                      .yellow) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else if (_model
                                                                      .pets
                                                                      .where((e) =>
                                                                          e.reference ==
                                                                          eventListItem
                                                                              .pet)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.color ==
                                                                  MyColorsEnum
                                                                      .green) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary;
                                                              } else if (_model
                                                                      .pets
                                                                      .where((e) =>
                                                                          e.reference ==
                                                                          eventListItem
                                                                              .pet)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.color ==
                                                                  MyColorsEnum
                                                                      .sky) {
                                                                return Color(
                                                                    0xFF39B3EF);
                                                              } else if (_model
                                                                      .pets
                                                                      .where((e) => e.reference == eventListItem.pet)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.color ==
                                                                  MyColorsEnum.blue) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              }
                                                            }(),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (eventListIndex <
                                                        functions.minus(
                                                            _model
                                                                .historyEventsList
                                                                .where((e) =>
                                                                    functions
                                                                        .getDateOnly(
                                                                            e.date!) ==
                                                                    datesItem)
                                                                .toList()
                                                                .length,
                                                            1))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    5.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                        ],
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
