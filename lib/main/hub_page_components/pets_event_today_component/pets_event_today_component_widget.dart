import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pets_module/popups/pets_event_info_popup/pets_event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_event_today_component_model.dart';
export 'pets_event_today_component_model.dart';

class PetsEventTodayComponentWidget extends StatefulWidget {
  const PetsEventTodayComponentWidget({super.key});

  @override
  State<PetsEventTodayComponentWidget> createState() =>
      _PetsEventTodayComponentWidgetState();
}

class _PetsEventTodayComponentWidgetState
    extends State<PetsEventTodayComponentWidget> {
  late PetsEventTodayComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsEventTodayComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allEventsOutput = await queryPetsEventRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.todayEvents = functions
          .filterPetsEventByDateFunction(_model.allEventsOutput!.toList(),
              functions.getDateOnly(getCurrentTimestamp))
          .toList()
          .cast<PetsEventRecord>();
      safeSetState(() {});
    });
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
      visible: (functions.getModuleState(
                  FFAppState().moduleStates.toList(), ModulesEnum.Pets) ==
              true) &&
          (_model.todayEvents.isNotEmpty),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '4rgumioj' /* Улюбленці */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Color(0xFF919191),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (context) {
                        final petsEventList = _model.todayEvents.toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(petsEventList.length,
                              (petsEventListIndex) {
                            final petsEventListItem =
                                petsEventList[petsEventListIndex];
                            return StreamBuilder<PetsRecord>(
                              stream: PetsRecord.getDocument(
                                  petsEventListItem.pet!),
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

                                final columnPetsRecord = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (petsEventListIndex > 0)
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
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
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: PetsEventInfoPopupWidget(
                                                  petEvent: petsEventListItem,
                                                  onlyView: true,
                                                  selectedDate:
                                                      functions.getDateOnly(
                                                          getCurrentTimestamp),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Text(
                                                    () {
                                                      if (petsEventListItem
                                                              .eventType ==
                                                          PetsEventsEnum
                                                              .vetvisit) {
                                                        return 'Похід до ветеринара';
                                                      } else if (petsEventListItem
                                                              .eventType ==
                                                          PetsEventsEnum
                                                              .grooming) {
                                                        return 'Грумінг';
                                                      } else if (petsEventListItem
                                                              .eventType ==
                                                          PetsEventsEnum
                                                              .shoping) {
                                                        return 'Шопінг';
                                                      } else if (petsEventListItem
                                                              .eventType ==
                                                          PetsEventsEnum
                                                              .vaccination) {
                                                        return 'Вакцинація';
                                                      } else if (petsEventListItem
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
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  columnPetsRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                    "H:m",
                                                    petsEventListItem.date!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<PetsEventHistoryRecord>>(
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
                                                                    petsEventListItem
                                                                        .reference,
                                                              )
                                                              .where(
                                                                'date',
                                                                isEqualTo: functions
                                                                    .getDateOnly(
                                                                        getCurrentTimestamp),
                                                              ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
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
                                                  if (snapshot.data!.isEmpty) {
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
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
        ],
      ),
    );
  }
}
