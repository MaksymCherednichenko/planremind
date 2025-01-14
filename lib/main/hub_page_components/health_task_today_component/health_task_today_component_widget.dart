import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_module/popups/event_info_popup/event_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_task_today_component_model.dart';
export 'health_task_today_component_model.dart';

class HealthTaskTodayComponentWidget extends StatefulWidget {
  const HealthTaskTodayComponentWidget({super.key});

  @override
  State<HealthTaskTodayComponentWidget> createState() =>
      _HealthTaskTodayComponentWidgetState();
}

class _HealthTaskTodayComponentWidgetState
    extends State<HealthTaskTodayComponentWidget> {
  late HealthTaskTodayComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthTaskTodayComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allEventsOutput = await queryHealthEventRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (healthEventRecord) => healthEventRecord.where(
          'dateOnly',
          isEqualTo: functions.getDateOnly(getCurrentTimestamp),
        ),
      );
      _model.healthTodayEventList =
          _model.allEventsOutput!.toList().cast<HealthEventRecord>();
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
                  FFAppState().moduleStates.toList(), ModulesEnum.Health) ==
              true) &&
          (_model.healthTodayEventList.isNotEmpty),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'r8mv1kkn' /* Здоровʼя */,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final healthEventList =
                                _model.healthTodayEventList.toList();

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(healthEventList.length,
                                  (healthEventListIndex) {
                                final healthEventListItem =
                                    healthEventList[healthEventListIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (healthEventListIndex > 0)
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
                                                child: EventInfoPopupWidget(
                                                  healthEvent:
                                                      healthEventListItem,
                                                  onlyView: true,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        healthEventListItem
                                                            .name,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        "d/M/y H:m",
                                                        healthEventListItem
                                                            .time!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<
                                                      HealthEventArchiveRecord>>(
                                                stream:
                                                    queryHealthEventArchiveRecord(
                                                  queryBuilder:
                                                      (healthEventArchiveRecord) =>
                                                          healthEventArchiveRecord
                                                              .where(
                                                    'eventReference',
                                                    isEqualTo:
                                                        healthEventListItem
                                                            .reference,
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
                                                  List<HealthEventArchiveRecord>
                                                      iconHealthEventArchiveRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final iconHealthEventArchiveRecord =
                                                      iconHealthEventArchiveRecordList
                                                              .isNotEmpty
                                                          ? iconHealthEventArchiveRecordList
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
    );
  }
}
