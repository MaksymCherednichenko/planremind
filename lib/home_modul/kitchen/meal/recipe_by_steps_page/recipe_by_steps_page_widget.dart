import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/step_description/step_description_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recipe_by_steps_page_model.dart';
export 'recipe_by_steps_page_model.dart';

class RecipeByStepsPageWidget extends StatefulWidget {
  const RecipeByStepsPageWidget({
    super.key,
    this.mealDocFromPlanner,
    this.manuDoc,
  });

  final ListOfDishesRecord? mealDocFromPlanner;
  final MenuRecord? manuDoc;

  @override
  State<RecipeByStepsPageWidget> createState() =>
      _RecipeByStepsPageWidgetState();
}

class _RecipeByStepsPageWidgetState extends State<RecipeByStepsPageWidget> {
  late RecipeByStepsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeByStepsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.mealDocFromPlanner != null) {
        FFAppState().recipeSteps =
            widget!.mealDocFromPlanner!.recipe.toList().cast<String>();
        safeSetState(() {});
        _model.siteLink = widget!.mealDocFromPlanner?.siteLink;
        _model.videoLink = widget!.mealDocFromPlanner?.videoLink;
        safeSetState(() {});
        if (!(FFAppState().recipeSteps.isNotEmpty)) {
          FFAppState().addToRecipeSteps(' ');
          safeSetState(() {});
        }
      } else if (widget!.manuDoc != null) {
        FFAppState().recipeSteps =
            widget!.manuDoc!.recipe.toList().cast<String>();
        safeSetState(() {});
        _model.siteLink = widget!.manuDoc?.siteLink;
        _model.videoLink = widget!.manuDoc?.videoLink;
        safeSetState(() {});
        if (!(FFAppState().recipeSteps.isNotEmpty)) {
          FFAppState().addToRecipeSteps(' ');
          safeSetState(() {});
        }
      }

      _model.indOpacity = 0;
      _model.stepOpacity = [];
      safeSetState(() {});
      while (_model.indOpacity! < FFAppState().recipeSteps.length) {
        _model.addToStepOpacity(_model.indOpacity!);
        safeSetState(() {});
        _model.indOpacity = _model.indOpacity! + 1;
        safeSetState(() {});
      }
      if (_model.siteLink != null && _model.siteLink != '') {
        safeSetState(() {
          _model.siteCheckboxValue = true;
        });
        safeSetState(() {
          _model.textController1?.text = _model.siteLink!;
        });
      }
      if (_model.videoLink != null && _model.videoLink != '') {
        safeSetState(() {
          _model.videoCheckboxValue = true;
        });
        safeSetState(() {
          _model.textController2?.text = _model.videoLink!;
        });
      }
    });

    _model.textController1 ??= TextEditingController(text: _model.siteLink);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: _model.videoLink);
    _model.textFieldFocusNode2 ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
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
                color: FlutterFlowTheme.of(context).primaryBackground,
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
              '38k794ag' /* Рецепт */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '${FFLocalizations.of(context).getVariableText(
                      ukText: 'Рецепт для',
                      enText: 'Recipe for',
                    )} ${() {
                      if (widget!.mealDocFromPlanner != null) {
                        return widget!.mealDocFromPlanner?.name;
                      } else if (widget!.manuDoc != null) {
                        return widget!.manuDoc?.name;
                      } else {
                        return ' ';
                      }
                    }()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget!.mealDocFromPlanner != null) {
                                context.pushNamed(
                                  'RecipeFullPage',
                                  queryParameters: {
                                    'mealDocFromPlanner': serializeParam(
                                      widget!.mealDocFromPlanner,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'mealDocFromPlanner':
                                        widget!.mealDocFromPlanner,
                                  },
                                );
                              } else if (widget!.manuDoc != null) {
                                context.pushNamed(
                                  'RecipeFullPage',
                                  queryParameters: {
                                    'manuDoc': serializeParam(
                                      widget!.manuDoc,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'manuDoc': widget!.manuDoc,
                                  },
                                );
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'ryke65f6' /* Повний */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.39,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
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
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'ytjdtpzt' /* Покроково */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.39,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14.0,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.siteCheckboxValue ??=
                                            false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .siteCheckboxValue = newValue!);
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.siteCheckboxValue!) {
                                          safeSetState(() {
                                            _model.siteCheckboxValue = false;
                                          });
                                        } else {
                                          safeSetState(() {
                                            _model.siteCheckboxValue = true;
                                          });
                                        }
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'rpm4ek59' /* Посилання на сайт з рецептом */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (_model.siteCheckboxValue ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController1',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.siteLink =
                                              _model.textController1.text;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.videoCheckboxValue ??=
                                              false,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.videoCheckboxValue =
                                                    newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.videoCheckboxValue!) {
                                            safeSetState(() {
                                              _model.videoCheckboxValue = false;
                                            });
                                          } else {
                                            safeSetState(() {
                                              _model.videoCheckboxValue = true;
                                            });
                                          }
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2mccwv6b' /* Посилання на відео з рецептом */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.videoCheckboxValue ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController2',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.videoLink =
                                              _model.textController2.text;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                if (_model.textController2.text != null &&
                                    _model.textController2.text != '')
                                  FlutterFlowVideoPlayer(
                                    path: _model.textController2.text,
                                    videoType: VideoType.network,
                                    autoPlay: false,
                                    looping: false,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final steps =
                                      FFAppState().recipeSteps.toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(steps.length,
                                        (stepsIndex) {
                                      final stepsItem = steps[stepsIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.stepOpacity
                                                            .elementAtOrNull(
                                                                stepsIndex) ==
                                                        stepsIndex) {
                                                      _model
                                                          .updateStepOpacityAtIndex(
                                                        stepsIndex,
                                                        (_) => -1,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .updateStepOpacityAtIndex(
                                                        stepsIndex,
                                                        (_) => stepsIndex,
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  onLongPress: () async {
                                                    FFAppState()
                                                        .removeAtIndexFromRecipeSteps(
                                                            stepsIndex);
                                                    safeSetState(() {});
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: ListTile(
                                                      title: Text(
                                                        '${FFLocalizations.of(context).getVariableText(
                                                          ukText: 'Крок',
                                                          enText: 'Step',
                                                        )} ${(stepsIndex + 1).toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      dense: false,
                                                    ),
                                                  ),
                                                ),
                                                if (_model.stepOpacity
                                                        .elementAtOrNull(
                                                            stepsIndex) ==
                                                    stepsIndex)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        FFIcons.kaltArrowDown,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.stepOpacity
                                                        .elementAtOrNull(
                                                            stepsIndex) !=
                                                    stepsIndex)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        FFIcons.kaltArrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.stepOpacity
                                                  .elementAtOrNull(
                                                      stepsIndex) ==
                                              stepsIndex)
                                            wrapWithModel(
                                              model: _model
                                                  .stepDescriptionModels
                                                  .getModel(
                                                stepsIndex.toString(),
                                                stepsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: StepDescriptionWidget(
                                                key: Key(
                                                  'Key57n_${stepsIndex.toString()}',
                                                ),
                                                ind: stepsIndex,
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
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().addToRecipeSteps(' ');
                                  safeSetState(() {});
                                },
                                text: '',
                                icon: Icon(
                                  FFIcons.kplus,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      9.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF57F44),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (widget!.mealDocFromPlanner != null) {
                                await widget!.mealDocFromPlanner!.reference
                                    .update({
                                  ...createListOfDishesRecordData(
                                    siteLink: _model.siteLink,
                                    videoLink: _model.videoLink,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'recipe': FFAppState().recipeSteps,
                                    },
                                  ),
                                });
                              } else {
                                await widget!.manuDoc!.reference.update({
                                  ...createMenuRecordData(
                                    siteLink: _model.siteLink,
                                    videoLink: _model.videoLink,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'recipe': FFAppState().recipeSteps,
                                    },
                                  ),
                                });
                              }

                              context.safePop();
                              FFAppState().recipeSteps = [];
                              safeSetState(() {});
                              _model.siteLink = '';
                              _model.videoLink = '';
                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'n7guhjsm' /* Зберегти */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 54.0,
                              padding: EdgeInsets.all(0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFF57F44),
                              textStyle: GoogleFonts.getFont(
                                'Inter',
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
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
  }
}
