import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/plants_module/plant_info_popup/plant_info_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plant_tasks_upcoming_component_model.dart';
export 'plant_tasks_upcoming_component_model.dart';

class PlantTasksUpcomingComponentWidget extends StatefulWidget {
  const PlantTasksUpcomingComponentWidget({super.key});

  @override
  State<PlantTasksUpcomingComponentWidget> createState() =>
      _PlantTasksUpcomingComponentWidgetState();
}

class _PlantTasksUpcomingComponentWidgetState
    extends State<PlantTasksUpcomingComponentWidget> {
  late PlantTasksUpcomingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantTasksUpcomingComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allPlantsOutput = await queryPlantsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.plantsList = _model.allPlantsOutput!.toList().cast<PlantsRecord>();
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
                  FFAppState().moduleStates.toList(), ModulesEnum.Plants) ==
              true) &&
          (_model.plantsList.isNotEmpty),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '4m95w7xc' /* Рослини */,
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
                        final date = functions
                            .generateDatesList(
                                functions.dateAddDays(
                                    functions.getDateOnly(getCurrentTimestamp),
                                    1),
                                7,
                                1)
                            .toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(date.length, (dateIndex) {
                            final dateItem = date[dateIndex];
                            return Builder(
                              builder: (context) {
                                final plant = functions
                                    .filterPlantsForADay(
                                        _model.plantsList.toList(), dateItem)
                                    .toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(plant.length, (plantIndex) {
                                    final plantItem = plant[plantIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((dateIndex > 0) || (plantIndex > 0))
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: PlantInfoPopupWidget(
                                                    plant: plantItem,
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
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        plantItem.photo,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v3Q92mpanUFl9yqWqBvt/assets/4m25uzr3vp9t/image_1.png',
                                                      ),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
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
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            plantItem.name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            dateItem,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (functions
                                                        .toWateringPlantForADay(
                                                            plantItem,
                                                            dateItem))
                                                      Icon(
                                                        Icons
                                                            .water_drop_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    if (functions
                                                        .toSolidChangePlantForADay(
                                                            plantItem,
                                                            dateItem))
                                                      Icon(
                                                        FFIcons.kplants,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    if (functions
                                                        .toFertilizationPlantForADay(
                                                            plantItem,
                                                            dateItem))
                                                      Icon(
                                                        FFIcons
                                                            .kseedingBlackOutline19388,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
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
