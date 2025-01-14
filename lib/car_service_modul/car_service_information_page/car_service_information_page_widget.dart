import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/car_service_modul/dialogs/add_car_popup/add_car_popup_widget.dart';
import '/car_service_modul/dialogs/expanded_float_menu/expanded_float_menu_widget.dart';
import '/car_service_modul/dialogs/my_car_popup/my_car_popup_widget.dart';
import '/custom_components/car_spare_part_mileage/car_spare_part_mileage_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_service_information_page_model.dart';
export 'car_service_information_page_model.dart';

class CarServiceInformationPageWidget extends StatefulWidget {
  const CarServiceInformationPageWidget({super.key});

  @override
  State<CarServiceInformationPageWidget> createState() =>
      _CarServiceInformationPageWidgetState();
}

class _CarServiceInformationPageWidgetState
    extends State<CarServiceInformationPageWidget>
    with TickerProviderStateMixin {
  late CarServiceInformationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarServiceInformationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cars = await queryCarsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.carList = _model.cars!.toList().cast<CarsRecord>();
      _model.currentIndex = 0;
      safeSetState(() {});
      if ((_model.carList.isNotEmpty) == true) {
        safeSetState(() {
          _model.vincodeTextFieldTextController?.text =
              _model.carList.elementAtOrNull(_model.currentIndex)!.vINCode;
        });
        safeSetState(() {
          _model.mileageTextFieldTextController?.text = _model.carList
              .elementAtOrNull(_model.currentIndex)!
              .mileage
              .toString();
        });
      }
    });

    _model.vincodeTextFieldTextController ??= TextEditingController();
    _model.vincodeTextFieldFocusNode ??= FocusNode();

    _model.mileageTextFieldTextController ??= TextEditingController();
    _model.mileageTextFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        floatingActionButton: Visibility(
          visible: _model.carList.isNotEmpty,
          child: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ExpandedFloatMenuWidget(
                        car: _model.carList
                            .elementAtOrNull(_model.currentIndex)!
                            .reference,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              _model.cars3 = await queryCarsRecordOnce(
                parent: FFAppState().currentUserRef,
              );
              _model.carList = _model.cars3!.toList().cast<CarsRecord>();
              _model.currentIndex = _model.currentIndex < _model.cars3!.length
                  ? _model.currentIndex
                  : 0;
              safeSetState(() {});
              if (_model.carList.isNotEmpty) {
                safeSetState(() {
                  _model.vincodeTextFieldTextController?.text = _model.carList
                      .elementAtOrNull(_model.currentIndex)!
                      .vINCode;
                });
                safeSetState(() {
                  _model.mileageTextFieldTextController?.text = _model.carList
                      .elementAtOrNull(_model.currentIndex)!
                      .mileage
                      .toString();
                });
              }

              safeSetState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).carService,
            elevation: 0.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('HubPage');
              },
              text: '',
              icon: Icon(
                FFIcons.kaltArrowLeft,
                color: FlutterFlowTheme.of(context).carService,
                size: 20.0,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Color(0xFF3765C0),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '1s04ulm1' /* Автосервіс */,
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
            FFButtonWidget(
              onPressed: () async {
                context.goNamed('Settings');
              },
              text: '',
              icon: Icon(
                FFIcons.ksettingsGrey,
                color: FlutterFlowTheme.of(context).carService,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 24.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Container(
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
                            context.goNamed('CarServiceHistoryPage');
                          },
                          text: FFLocalizations.of(context).getText(
                            '14br83qu' /* History */,
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
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.goNamed('CarServicePlannerPage');
                          },
                          text: FFLocalizations.of(context).getText(
                            'mo75osbx' /* Planner */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).info,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'rng5134w' /* Cars */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF3765C0),
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
                    ],
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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if ((_model.carList.isNotEmpty) == true)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Visibility(
                          visible: (_model.carList.isNotEmpty) == true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            child: Visibility(
                              visible: (_model.carList.isNotEmpty) == true,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((_model.carList.isNotEmpty) == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isCardExtended =
                                              !_model.isCardExtended;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${_model.carList.elementAtOrNull(_model.currentIndex)?.brand} ${_model.carList.elementAtOrNull(_model.currentIndex)?.model}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  _model.carList
                                                      .elementAtOrNull(
                                                          _model.currentIndex)!
                                                      .year
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (_model.carList.length > 1)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        if (_model
                                                                .currentIndex >
                                                            0) {
                                                          _model.currentIndex =
                                                              _model.currentIndex +
                                                                  -1;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.currentIndex =
                                                              functions.minus(
                                                                  _model.carList
                                                                      .length,
                                                                  1);
                                                          safeSetState(() {});
                                                        }

                                                        if ((_model.carList
                                                                .isNotEmpty) ==
                                                            true) {
                                                          safeSetState(() {
                                                            _model.vincodeTextFieldTextController
                                                                    ?.text =
                                                                _model.carList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .currentIndex)!
                                                                    .vINCode;
                                                          });
                                                          safeSetState(() {
                                                            _model.mileageTextFieldTextController
                                                                    ?.text =
                                                                _model.carList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .currentIndex)!
                                                                    .mileage
                                                                    .toString();
                                                          });
                                                        }
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                      },
                                                      text: '',
                                                      icon: Icon(
                                                        Icons.chevron_left,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .carService,
                                                        size: 36.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 60.0,
                                                        height: 80.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Colors.transparent,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      _model.carList
                                                          .elementAtOrNull(
                                                              _model
                                                                  .currentIndex)
                                                          ?.photo,
                                                      'https://media.licdn.com/dms/image/C4D12AQHFgtQn8UI9VQ/article-cover_image-shrink_720_1280/0/1607365386660?e=2147483647&v=beta&t=N27yDF_hxdq6ILwCmspNOK6i22dvWsRygotGV1j8_I0',
                                                    ),
                                                    width: 250.0,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                ),
                                                if (_model.carList.length > 1)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        if (_model
                                                                .currentIndex <
                                                            functions.minus(
                                                                _model.carList
                                                                    .length,
                                                                1)) {
                                                          _model.currentIndex =
                                                              _model.currentIndex +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.currentIndex =
                                                              0;
                                                          safeSetState(() {});
                                                        }

                                                        if ((_model.carList
                                                                .isNotEmpty) ==
                                                            true) {
                                                          safeSetState(() {
                                                            _model.vincodeTextFieldTextController
                                                                    ?.text =
                                                                _model.carList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .currentIndex)!
                                                                    .vINCode;
                                                          });
                                                          safeSetState(() {
                                                            _model.mileageTextFieldTextController
                                                                    ?.text =
                                                                _model.carList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .currentIndex)!
                                                                    .mileage
                                                                    .toString();
                                                          });
                                                        }
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                      },
                                                      text: '',
                                                      icon: Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .carService,
                                                        size: 36.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 60.0,
                                                        height: 80.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Colors.transparent,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            if (_model.isCardExtended)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        40.0, 0.0, 40.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .vincodeTextFieldTextController,
                                                        focusNode: _model
                                                            .vincodeTextFieldFocusNode,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'uytfmpqr' /* VIN Код */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
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
                                                        validator: _model
                                                            .vincodeTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .mileageTextFieldTextController,
                                                        focusNode: _model
                                                            .mileageTextFieldFocusNode,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'xzt8styy' /* Пробіг */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
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
                                                        validator: _model
                                                            .mileageTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      MyCarPopupWidget(
                                                                    car: _model
                                                                        .carList
                                                                        .elementAtOrNull(
                                                                            _model.currentIndex)!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          _model.cars4 =
                                                              await queryCarsRecordOnce(
                                                            parent: FFAppState()
                                                                .currentUserRef,
                                                          );
                                                          _model.carList = _model
                                                              .cars4!
                                                              .toList()
                                                              .cast<
                                                                  CarsRecord>();
                                                          _model.currentIndex =
                                                              _model.currentIndex <
                                                                      _model
                                                                          .cars4!
                                                                          .length
                                                                  ? _model
                                                                      .currentIndex
                                                                  : 0;
                                                          safeSetState(() {});
                                                          if ((_model.carList
                                                                  .isNotEmpty) ==
                                                              true) {
                                                            safeSetState(() {
                                                              _model.vincodeTextFieldTextController
                                                                      ?.text =
                                                                  _model.carList
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .currentIndex)!
                                                                      .vINCode;
                                                            });
                                                            safeSetState(() {
                                                              _model.mileageTextFieldTextController
                                                                      ?.text =
                                                                  _model.carList
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .currentIndex)!
                                                                      .mileage
                                                                      .toString();
                                                            });
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '0gk0z1bj' /* Змінити */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 54.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
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
                                                              .carService,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ]
                                              .divide(SizedBox(height: 24.0))
                                              .addToStart(
                                                  SizedBox(height: 24.0))
                                              .addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation2']!,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                      ),
                    if ((_model.carList.isNotEmpty) == false)
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
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
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AddCarPopupWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            _model.cars2 = await queryCarsRecordOnce(
                              parent: FFAppState().currentUserRef,
                            );
                            _model.carList =
                                _model.cars2!.toList().cast<CarsRecord>();
                            _model.currentIndex = 0;
                            safeSetState(() {});
                            if ((_model.carList.isNotEmpty) == true) {
                              safeSetState(() {
                                _model.vincodeTextFieldTextController?.text =
                                    _model.carList
                                        .elementAtOrNull(_model.currentIndex)!
                                        .vINCode;
                              });
                              safeSetState(() {
                                _model.mileageTextFieldTextController?.text =
                                    _model.carList
                                        .elementAtOrNull(_model.currentIndex)!
                                        .mileage
                                        .toString();
                              });
                            }

                            safeSetState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                              ),
                              Icon(
                                Icons.add,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 64.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'pp6w629r' /* Add new car */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(height: 48.0))
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.carList.isNotEmpty)
                            StreamBuilder<List<CarSparePartsRecord>>(
                              stream: queryCarSparePartsRecord(
                                parent: FFAppState().currentUserRef,
                                queryBuilder: (carSparePartsRecord) =>
                                    carSparePartsRecord.where(
                                  'car',
                                  isEqualTo: _model.carList
                                      .elementAtOrNull(_model.currentIndex)
                                      ?.reference,
                                ),
                              ),
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
                                List<CarSparePartsRecord>
                                    containerCarSparePartsRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerCarSparePartsRecordList
                                          .isNotEmpty)
                                        Builder(
                                          builder: (context) {
                                            final list =
                                                containerCarSparePartsRecordList
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  list.length, (listIndex) {
                                                final listItem =
                                                    list[listIndex];
                                                return Visibility(
                                                  visible:
                                                      containerCarSparePartsRecordList
                                                          .isNotEmpty,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 2.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              0.5,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (listItem
                                                                    .showInfo) {
                                                                  await listItem
                                                                      .reference
                                                                      .update(
                                                                          createCarSparePartsRecordData(
                                                                    showInfo:
                                                                        false,
                                                                  ));
                                                                } else {
                                                                  await listItem
                                                                      .reference
                                                                      .update(
                                                                          createCarSparePartsRecordData(
                                                                    showInfo:
                                                                        true,
                                                                  ));
                                                                }
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    listItem
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                () {
                                                                              if (listItem.installationMileage > _model.carList.elementAtOrNull(_model.currentIndex)!.mileage) {
                                                                                return Color(0x00000000);
                                                                              } else if (functions.getPercentageOfSparePart(listItem.installationMileage, listItem.replaceMentmileage, _model.carList.elementAtOrNull(_model.currentIndex)!.mileage) >= 90) {
                                                                                return FlutterFlowTheme.of(context).error;
                                                                              } else if (functions.getPercentageOfSparePart(listItem.installationMileage, listItem.replaceMentmileage, _model.carList.elementAtOrNull(_model.currentIndex)!.mileage) >= 70) {
                                                                                return FlutterFlowTheme.of(context).tertiary;
                                                                              } else {
                                                                                return Color(0x00000000);
                                                                              }
                                                                            }(),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Stack(
                                                                        children: [
                                                                          if (listItem.showInfo ==
                                                                              false)
                                                                            Icon(
                                                                              FFIcons.kaltArrowRight,
                                                                              color: FlutterFlowTheme.of(context).carService,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (listItem
                                                                              .showInfo)
                                                                            Icon(
                                                                              FFIcons.kaltArrowDown,
                                                                              color: FlutterFlowTheme.of(context).carService,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (listItem
                                                                .showInfo)
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E5E5),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          80.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0x35FFFFFF),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.2),
                                                                      child:
                                                                          Visibility(
                                                                        visible: _model
                                                                            .carList
                                                                            .isNotEmpty,
                                                                        child:
                                                                            wrapWithModel(
                                                                          model: _model
                                                                              .carSparePartMileageModels
                                                                              .getModel(
                                                                            listItem.name,
                                                                            listIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              CarSparePartMileageWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyh83_${listItem.name}',
                                                                            ),
                                                                            parameter1:
                                                                                listItem.installationMileage,
                                                                            parameter2:
                                                                                listItem.replaceMentmileage,
                                                                            sparePartRef:
                                                                                listItem.reference,
                                                                            mileage:
                                                                                _model.carList.elementAtOrNull(_model.currentIndex)!.mileage,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('Ви дійсно бажаєте видалити запис?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Скасувати'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Видалити'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await listItem
                                                                              .reference
                                                                              .delete();
                                                                        }
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'isf4xiuj' /* Видалити запис */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_outline,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            54.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconAlignment:
                                                                            IconAlignment.end,
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
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
                                              }),
                                            );
                                          },
                                        ),
                                      Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                      ),
                                      if ((containerCarSparePartsRecordList
                                              .isNotEmpty) ==
                                          false)
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'eyj5nape' /* Список деталей порожній */,
                                          ),
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
                                );
                              },
                            ),
                          if ((_model.carList.isNotEmpty) == false)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'a5cmkbb4' /* Для того, щоб добавити деталь,... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
