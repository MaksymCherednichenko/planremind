import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/plants_module/add_new_plant_popup/add_new_plant_popup_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plant_info_popup_model.dart';
export 'plant_info_popup_model.dart';

class PlantInfoPopupWidget extends StatefulWidget {
  const PlantInfoPopupWidget({
    super.key,
    required this.plant,
    bool? onlyView,
  }) : this.onlyView = onlyView ?? false;

  final PlantsRecord? plant;
  final bool onlyView;

  @override
  State<PlantInfoPopupWidget> createState() => _PlantInfoPopupWidgetState();
}

class _PlantInfoPopupWidgetState extends State<PlantInfoPopupWidget> {
  late PlantInfoPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantInfoPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 327.0,
        height: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: StreamBuilder<PlantsRecord>(
            stream: PlantsRecord.getDocument(widget!.plant!.reference),
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

              final columnPlantsRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget!.onlyView == false)
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
                                          child: AddNewPlantPopupWidget(
                                            plant: widget!.plant,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2n0moiro' /* Редагувати */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF919191),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
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
                  Text(
                    FFLocalizations.of(context).getText(
                      'jpckhfj9' /* Моя рослина */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          columnPlantsRecord.photo,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v3Q92mpanUFl9yqWqBvt/assets/4m25uzr3vp9t/image_1.png',
                        ),
                        width: 180.0,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      columnPlantsRecord.name,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          if (widget!.plant?.wateringFrequency != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Icon(
                                    FFIcons
                                        .kwateringCanAndPlantsBlackOutline19370,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                ),
                                Text(
                                  () {
                                    if (columnPlantsRecord
                                            .wateringFrequency.scheme ==
                                        FrequencySchemeEnum.EveryDay) {
                                      return 'Щодня';
                                    } else if (columnPlantsRecord
                                            .wateringFrequency.scheme ==
                                        FrequencySchemeEnum.EveryXDay) {
                                      return 'Кожні ${widget!.plant?.wateringFrequency?.everyXDay?.toString()} дні';
                                    } else if (columnPlantsRecord
                                            .wateringFrequency.scheme ==
                                        FrequencySchemeEnum.SpecificDayOfWeek) {
                                      return 'Конкретні дні неділі';
                                    } else {
                                      return ' ';
                                    }
                                  }(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          if (widget!.plant?.lighting != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Icon(
                                    Icons.water_drop_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  '${columnPlantsRecord.amountOfWater.toString()} ml',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          if (widget!.plant?.temperature != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Icon(
                                    FFIcons.kthermometer1829,
                                    color: Color(0xFF2F2F2F),
                                    size: 30.0,
                                  ),
                                ),
                                Text(
                                  columnPlantsRecord.temperature!.name,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          if (widget!.plant?.solidChangeFrequency != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Icon(
                                    FFIcons.kseedingBlackOutline19388,
                                    color: Color(0xFF2F2F2F),
                                    size: 30.0,
                                  ),
                                ),
                                Text(
                                  columnPlantsRecord
                                      .solidChangeFrequency.frequency.name,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
