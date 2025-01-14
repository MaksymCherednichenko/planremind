import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_task_upcoming_component_model.dart';
export 'car_task_upcoming_component_model.dart';

class CarTaskUpcomingComponentWidget extends StatefulWidget {
  const CarTaskUpcomingComponentWidget({super.key});

  @override
  State<CarTaskUpcomingComponentWidget> createState() =>
      _CarTaskUpcomingComponentWidgetState();
}

class _CarTaskUpcomingComponentWidgetState
    extends State<CarTaskUpcomingComponentWidget> {
  late CarTaskUpcomingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarTaskUpcomingComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allTaskOutput = await queryCarServiceTaskRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (carServiceTaskRecord) => carServiceTaskRecord.where(
          'date',
          isGreaterThanOrEqualTo: functions.getTomorrowDate(),
        ),
      );
      _model.eventList = _model.allTaskOutput!
          .where((e) =>
              e.date! < functions.dateAddDays(functions.getTomorrowDate(), 7))
          .toList()
          .toList()
          .cast<CarServiceTaskRecord>();
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
                  FFAppState().moduleStates.toList(), ModulesEnum.Car) ==
              true) &&
          (_model.eventList.isNotEmpty),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'rvkur1o8' /* Гараж */,
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
                        final task = _model.eventList.toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(task.length, (taskIndex) {
                            final taskItem = task[taskIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (taskIndex != 0)
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                InkWell(
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
                                              MediaQuery.viewInsetsOf(context),
                                          child: AddServiceTaskPopupWidget(
                                            taskDoc: taskItem,
                                            publicForm: true,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 7.0),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Text(
                                                    taskItem.title,
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
                                                Container(
                                                  decoration: BoxDecoration(),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                "d/M/y",
                                                taskItem.date!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<
                                            List<CarServiceTaskHistoryRecord>>(
                                          future:
                                              queryCarServiceTaskHistoryRecordOnce(
                                            parent: FFAppState().currentUserRef,
                                            queryBuilder:
                                                (carServiceTaskHistoryRecord) =>
                                                    carServiceTaskHistoryRecord
                                                        .where(
                                                          'date',
                                                          isEqualTo:
                                                              taskItem.date,
                                                        )
                                                        .where(
                                                          'serviceTastReference',
                                                          isEqualTo: taskItem
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
                                            List<CarServiceTaskHistoryRecord>
                                                iconCarServiceTaskHistoryRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final iconCarServiceTaskHistoryRecord =
                                                iconCarServiceTaskHistoryRecordList
                                                        .isNotEmpty
                                                    ? iconCarServiceTaskHistoryRecordList
                                                        .first
                                                    : null;

                                            return Icon(
                                              Icons.done,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
