import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_modules_model.dart';
export 'settings_modules_model.dart';

class SettingsModulesWidget extends StatefulWidget {
  const SettingsModulesWidget({super.key});

  @override
  State<SettingsModulesWidget> createState() => _SettingsModulesWidgetState();
}

class _SettingsModulesWidgetState extends State<SettingsModulesWidget> {
  late SettingsModulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModulesModel());

    _model.switchValue1 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Home)!;
    _model.switchValue2 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Car)!;
    _model.switchValue3 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Plants)!;
    _model.switchValue4 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Health)!;
    _model.switchValue5 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Pets)!;
    _model.switchValue6 = functions.getModuleState(
        FFAppState().moduleStates.toList(), Module.Sport)!;
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: '',
              icon: Icon(
                FFIcons.kaltArrowLeft,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 24.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Color(0xFFF57F44),
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
          title: Text(
            FFLocalizations.of(context).getText(
              'rfykjd8z' /* Налаштування */,
            ),
            style: GoogleFonts.getFont(
              'Inter',
              color: Color(0xFF0B0B0B),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
            child: StreamBuilder<List<SettingsCategoryAndShopRecord>>(
              stream: querySettingsCategoryAndShopRecord(
                parent: FFAppState().currentUserRef,
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
                List<SettingsCategoryAndShopRecord>
                    columnSettingsCategoryAndShopRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnSettingsCategoryAndShopRecord =
                    columnSettingsCategoryAndShopRecordList.isNotEmpty
                        ? columnSettingsCategoryAndShopRecordList.first
                        : null;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 30.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'wgo4exuw' /* Modules */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF878787),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'wwpn6oqg' /* Home */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue1!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue1 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Home,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.homeDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Home,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.homeDisable!) {
                                    setState(() {
                                      _model.switchValue1 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'w61ibmzz' /* Car */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue2!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue2 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Car,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.carDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Car,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.carDisable!) {
                                    setState(() {
                                      _model.switchValue2 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '3sktvdg4' /* Plants */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue3!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue3 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Plants,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.plantsDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Plants,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.plantsDisable!) {
                                    setState(() {
                                      _model.switchValue3 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '2b0o1674' /* Health */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue4!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue4 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Health,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.healthDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Health,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.healthDisable!) {
                                    setState(() {
                                      _model.switchValue4 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'yhy9h8la' /* Pets */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue5!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue5 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Pets,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.petsDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Pets,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.petsDisable!) {
                                    setState(() {
                                      _model.switchValue5 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'irgzrda4' /* Sport */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue6!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue6 = newValue!);
                                if (newValue!) {
                                  await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Sport,
                                      active: true,
                                    ),
                                  );
                                } else {
                                  _model.sportDisable =
                                      await action_blocks.updateModuleState(
                                    context,
                                    module: ModuleStruct(
                                      name: Module.Sport,
                                      active: false,
                                    ),
                                  );
                                  if (!_model.sportDisable!) {
                                    setState(() {
                                      _model.switchValue6 = true;
                                    });
                                  }

                                  setState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ),
                    ],
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
