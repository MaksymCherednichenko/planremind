import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_select_popup_model.dart';
export 'menu_select_popup_model.dart';

class MenuSelectPopupWidget extends StatefulWidget {
  const MenuSelectPopupWidget({
    super.key,
    required this.date,
  });

  final DateTime? date;

  @override
  State<MenuSelectPopupWidget> createState() => _MenuSelectPopupWidgetState();
}

class _MenuSelectPopupWidgetState extends State<MenuSelectPopupWidget> {
  late MenuSelectPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuSelectPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
          child: StreamBuilder<List<DateListOfDishesRecord>>(
            stream: queryDateListOfDishesRecord(
              parent: FFAppState().currentUserRef,
              queryBuilder: (dateListOfDishesRecord) =>
                  dateListOfDishesRecord.where(
                'date',
                isEqualTo: widget!.date,
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
              List<DateListOfDishesRecord> containerDateListOfDishesRecordList =
                  snapshot.data!;
              final containerDateListOfDishesRecord =
                  containerDateListOfDishesRecordList.isNotEmpty
                      ? containerDateListOfDishesRecordList.first
                      : null;

              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.0,
                              decoration: BoxDecoration(),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '5ig8w7y6' /* menu */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
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
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kwpsscj6' /* Сніданок */,
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<
                                                    List<ListOfDishesRecord>>(
                                                  stream:
                                                      queryListOfDishesRecord(
                                                    queryBuilder:
                                                        (listOfDishesRecord) =>
                                                            listOfDishesRecord
                                                                .where(
                                                                  'tag',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'Breakfast',
                                                                    'Breakfast',
                                                                  ),
                                                                )
                                                                .where(
                                                                  'userID',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .currentUserRef
                                                                          ?.id,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnListOfDishesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnListOfDishesRecord =
                                                            columnListOfDishesRecordList[
                                                                columnIndex];
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
                                                                  columnListOfDishesRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          false) ||
                                                                      (containerDateListOfDishesRecord
                                                                              ?.breakfasts
                                                                              ?.contains(columnListOfDishesRecord.reference) ==
                                                                          false))
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
                                                                        if (containerDateListOfDishesRecord !=
                                                                            null) {
                                                                          await containerDateListOfDishesRecord!
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'breakfasts': FieldValue.arrayUnion([
                                                                                  columnListOfDishesRecord.reference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        } else {
                                                                          await DateListOfDishesRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set({
                                                                            ...createDateListOfDishesRecordData(
                                                                              date: widget!.date,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'breakfasts': [
                                                                                  columnListOfDishesRecord.reference
                                                                                ],
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .radio_button_off,
                                                                        color: Color(
                                                                            0xFFC7C5C5),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          true) &&
                                                                      containerDateListOfDishesRecord!
                                                                          .breakfasts
                                                                          .contains(
                                                                              columnListOfDishesRecord.reference))
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
                                                                        await containerDateListOfDishesRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'breakfasts': FieldValue.arrayRemove([
                                                                                columnListOfDishesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .home,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                columnListOfDishesRecord
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
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            15.0)),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'addNewMeal',
                                                          queryParameters: {
                                                            'tag':
                                                                serializeParam(
                                                              1,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'oceynuyp' /* Додати страву */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 10.0, 0.0, 10.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6fm78cam' /* Обід */,
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<
                                                    List<ListOfDishesRecord>>(
                                                  stream:
                                                      queryListOfDishesRecord(
                                                    queryBuilder:
                                                        (listOfDishesRecord) =>
                                                            listOfDishesRecord
                                                                .where(
                                                                  'tag',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'Lunch',
                                                                    'Lunch',
                                                                  ),
                                                                )
                                                                .where(
                                                                  'userID',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .currentUserRef
                                                                          ?.id,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnListOfDishesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnListOfDishesRecord =
                                                            columnListOfDishesRecordList[
                                                                columnIndex];
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
                                                            Navigator.pop(
                                                                context);

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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          false) ||
                                                                      (containerDateListOfDishesRecord
                                                                              ?.lunches
                                                                              ?.contains(columnListOfDishesRecord.reference) ==
                                                                          false))
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
                                                                        if (containerDateListOfDishesRecord !=
                                                                            null) {
                                                                          await containerDateListOfDishesRecord!
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'lunches': FieldValue.arrayUnion([
                                                                                  columnListOfDishesRecord.reference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        } else {
                                                                          await DateListOfDishesRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set({
                                                                            ...createDateListOfDishesRecordData(
                                                                              date: widget!.date,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'lunches': [
                                                                                  columnListOfDishesRecord.reference
                                                                                ],
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .radio_button_off,
                                                                        color: Color(
                                                                            0xFFC7C5C5),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          true) &&
                                                                      containerDateListOfDishesRecord!
                                                                          .lunches
                                                                          .contains(
                                                                              columnListOfDishesRecord.reference))
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
                                                                        await containerDateListOfDishesRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'lunches': FieldValue.arrayRemove([
                                                                                columnListOfDishesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .home,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                columnListOfDishesRecord
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
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            15.0)),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'addNewMeal',
                                                          queryParameters: {
                                                            'tag':
                                                                serializeParam(
                                                              2,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'clm31nno' /* Додати страву */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  FFIcons
                                                      .kchristmasDinner3778437,
                                                  color: Color(0xFF0B0B0B),
                                                  size: 25.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 10.0, 0.0, 10.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'du5ulhd3' /* Вечеря */,
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<
                                                    List<ListOfDishesRecord>>(
                                                  stream:
                                                      queryListOfDishesRecord(
                                                    queryBuilder:
                                                        (listOfDishesRecord) =>
                                                            listOfDishesRecord
                                                                .where(
                                                                  'tag',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'Dinner',
                                                                    'Dinner',
                                                                  ),
                                                                )
                                                                .where(
                                                                  'userID',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .currentUserRef
                                                                          ?.id,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnListOfDishesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnListOfDishesRecord =
                                                            columnListOfDishesRecordList[
                                                                columnIndex];
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
                                                            Navigator.pop(
                                                                context);

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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          false) ||
                                                                      (containerDateListOfDishesRecord
                                                                              ?.dinners
                                                                              ?.contains(columnListOfDishesRecord.reference) ==
                                                                          false))
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
                                                                        if (containerDateListOfDishesRecord !=
                                                                            null) {
                                                                          await containerDateListOfDishesRecord!
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'dinners': FieldValue.arrayUnion([
                                                                                  columnListOfDishesRecord.reference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        } else {
                                                                          await DateListOfDishesRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set({
                                                                            ...createDateListOfDishesRecordData(
                                                                              date: widget!.date,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'dinners': [
                                                                                  columnListOfDishesRecord.reference
                                                                                ],
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .radio_button_off,
                                                                        color: Color(
                                                                            0xFFC7C5C5),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          true) &&
                                                                      containerDateListOfDishesRecord!
                                                                          .dinners
                                                                          .contains(
                                                                              columnListOfDishesRecord.reference))
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
                                                                        await containerDateListOfDishesRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'dinners': FieldValue.arrayRemove([
                                                                                columnListOfDishesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .home,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                columnListOfDishesRecord
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
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            15.0)),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'addNewMeal',
                                                          queryParameters: {
                                                            'tag':
                                                                serializeParam(
                                                              3,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nd91mcnq' /* Додати страву */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 10.0, 0.0, 10.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'y3zbz1tc' /* Інше */,
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<
                                                    List<ListOfDishesRecord>>(
                                                  stream:
                                                      queryListOfDishesRecord(
                                                    queryBuilder:
                                                        (listOfDishesRecord) =>
                                                            listOfDishesRecord
                                                                .where(
                                                                  'tag',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'Other',
                                                                    'Other',
                                                                  ),
                                                                )
                                                                .where(
                                                                  'userID',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .currentUserRef
                                                                          ?.id,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnListOfDishesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnListOfDishesRecord =
                                                            columnListOfDishesRecordList[
                                                                columnIndex];
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
                                                            Navigator.pop(
                                                                context);

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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          false) ||
                                                                      (containerDateListOfDishesRecord
                                                                              ?.others
                                                                              ?.contains(columnListOfDishesRecord.reference) ==
                                                                          false))
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
                                                                        if (containerDateListOfDishesRecord !=
                                                                            null) {
                                                                          await containerDateListOfDishesRecord!
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'others': FieldValue.arrayUnion([
                                                                                  columnListOfDishesRecord.reference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        } else {
                                                                          await DateListOfDishesRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set({
                                                                            ...createDateListOfDishesRecordData(
                                                                              date: widget!.date,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'others': [
                                                                                  columnListOfDishesRecord.reference
                                                                                ],
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .radio_button_off,
                                                                        color: Color(
                                                                            0xFFC7C5C5),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  if (((containerDateListOfDishesRecord !=
                                                                              null) ==
                                                                          true) &&
                                                                      containerDateListOfDishesRecord!
                                                                          .others
                                                                          .contains(
                                                                              columnListOfDishesRecord.reference))
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
                                                                        await containerDateListOfDishesRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'others': FieldValue.arrayRemove([
                                                                                columnListOfDishesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .home,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                columnListOfDishesRecord
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
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            15.0)),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'addNewMeal',
                                                          queryParameters: {
                                                            'tag':
                                                                serializeParam(
                                                              4,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0n6nmciy' /* Додати страву */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
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
                                ].addToEnd(SizedBox(height: 50.0)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 40.0,
                                buttonSize: 50.0,
                                fillColor: FlutterFlowTheme.of(context).home,
                                icon: Icon(
                                  Icons.done,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
