import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wellcome_page_modules_model.dart';
export 'wellcome_page_modules_model.dart';

class WellcomePageModulesWidget extends StatefulWidget {
  const WellcomePageModulesWidget({
    super.key,
    this.homebtn,
    this.modules,
  });

  final Color? homebtn;
  final DocumentReference? modules;

  @override
  State<WellcomePageModulesWidget> createState() =>
      _WellcomePageModulesWidgetState();
}

class _WellcomePageModulesWidgetState extends State<WellcomePageModulesWidget> {
  late WellcomePageModulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WellcomePageModulesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.moduleStatesIsExist = await queryModuleStatesRecordOnce(
        queryBuilder: (moduleStatesRecord) => moduleStatesRecord.where(
          'user_id',
          isEqualTo: FFAppState().userID,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.moduleStatesIsExist != null) != true) {
        var moduleStatesRecordReference =
            ModuleStatesRecord.createDoc(FFAppState().currentUserRef!);
        await moduleStatesRecordReference.set(createModuleStatesRecordData(
          home: false,
          car: false,
          plants: false,
          health: false,
          pets: false,
          sport: false,
          userId: FFAppState().userID,
        ));
        _model.moduleStatesVarCreated = ModuleStatesRecord.getDocumentFromData(
            createModuleStatesRecordData(
              home: false,
              car: false,
              plants: false,
              health: false,
              pets: false,
              sport: false,
              userId: FFAppState().userID,
            ),
            moduleStatesRecordReference);
      }
      _model.moduleStatesVar = await queryModuleStatesRecordOnce(
        queryBuilder: (moduleStatesRecord) => moduleStatesRecord.where(
          'user_id',
          isEqualTo: FFAppState().userID,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.moduleList = await actions.updateModuleState(
        FFAppState().moduleStates.toList(),
        _model.moduleStatesVar!.reference,
      );
      FFAppState().visitWellcomePageCount =
          FFAppState().visitWellcomePageCount + 1;
      FFAppState().moduleStates =
          _model.moduleList!.toList().cast<ModuleStruct>();
      setState(() {});
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFA5A5C9)],
                stops: [0.5, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
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

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.pageViewCurrentIndex == 0) {
                                  context.pushNamed('WellcomePage');
                                } else {
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                }
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'eur95gho' /* < Back */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.pageViewCurrentIndex == 5) {
                                  if (functions.hasActiveModules(
                                          FFAppState().moduleStates.toList()) ==
                                      true) {
                                    context.pushNamed(
                                      'HubPage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                        ),
                                      },
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Зачекайте'),
                                          content: Text(
                                              'Додайте принаймні 1 модуль щоб продовжити'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                }
                              },
                              child: Text(
                                _model.nextbtntext,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            onPageChanged: (_) async {
                              if (_model.pageViewCurrentIndex == 5) {
                                _model.nextbtntext = 'Finish';
                                setState(() {});
                              } else {
                                _model.nextbtntext = 'Next >';
                                setState(() {});
                              }
                            },
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-3.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-7.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'gy3ct8yi' /* Модуль Home */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'jl1v32ml' /* У цьому модулі ви можете плану... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Home) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                home: false,
                                              ));
                                              _model.updatedHomeDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedHomeDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '0pes7f0u' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Home) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                home: true,
                                              ));
                                              _model.updatedHomeAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedHomeAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6ofedwro' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-2.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-8.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'j6qq5bo4' /* Модуль Car service */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '9idiw1qi' /* У цьому модулі ви можете плану... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Car) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                car: false,
                                              ));
                                              _model.updatedCarDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedCarDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'jq83re6z' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Car) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                car: true,
                                              ));
                                              _model.updatedCarAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedCarAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'cvs9617a' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-4.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-9.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'a0f9nk9d' /* Модуль Plants */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0c4hzxyd' /* Цей модуль призначений для наг... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Plants) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                plants: false,
                                              ));
                                              _model.updatedPlantsDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedPlantsDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '4qi386mx' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Plants) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                plants: true,
                                              ));
                                              _model.updatedPlantsAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedPlantsAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'vfrq4iek' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-5.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-10.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'd9u46x6b' /* Модуль Health */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '2khqup67' /* Цей модуль для нотатоĸ після в... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Health) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                health: false,
                                              ));
                                              _model.updatedHealthDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedHealthDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'gmjhg2zq' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Health) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                health: true,
                                              ));
                                              _model.updatedHealthAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedHealthAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'cos2phzs' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-6.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-11.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'an75j0kk' /* Модуль Pets */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'inz3ovzi' /* Цей модуль дозволяє ĸонтролюва... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Pets) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                pets: false,
                                              ));
                                              _model.updatedPetsDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedPetsDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              've8tylek' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Pets) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                pets: true,
                                              ));
                                              _model.updatedPetsAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedPetsAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'bgxfeuzi' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'uk')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-13.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (FFLocalizations.of(context)
                                            .getVariableText(
                                          ukText: 'uk',
                                          enText: 'eng',
                                        ) ==
                                        'eng')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/image_modul-12.svg',
                                          width: 328.0,
                                          height: 284.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'wba937k4' /* Модуль Sport */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ltmaukjg' /* Плануйте та відстежуйте занятт... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.getModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                Module.Sport) ==
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                sport: false,
                                              ));
                                              _model.updatedSportDelete =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedSportDelete!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '8vs5mwai' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 32.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00F57F44),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          functions.getModuleState(
                                                  FFAppState()
                                                      .moduleStates
                                                      .toList(),
                                                  Module.Sport) ==
                                              false,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await _model
                                                  .moduleStatesVar!.reference
                                                  .update(
                                                      createModuleStatesRecordData(
                                                sport: true,
                                              ));
                                              _model.updatedSportAdd =
                                                  await actions
                                                      .updateModuleState(
                                                FFAppState()
                                                    .moduleStates
                                                    .toList(),
                                                _model
                                                    .moduleStatesVar!.reference,
                                              );
                                              FFAppState().moduleStates = _model
                                                  .updatedSportAdd!
                                                  .toList()
                                                  .cast<ModuleStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'd2u6iumv' /* Додати + */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
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
        ),
      ),
    );
  }
}
