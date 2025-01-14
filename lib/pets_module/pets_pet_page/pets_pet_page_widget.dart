import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pets_module/popups/add_pets_popup/add_pets_popup_widget.dart';
import '/pets_module/popups/pets_page_expanded_float_menu/pets_page_expanded_float_menu_widget.dart';
import '/walkthroughs/pets_add_pet.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_pet_page_model.dart';
export 'pets_pet_page_model.dart';

class PetsPetPageWidget extends StatefulWidget {
  const PetsPetPageWidget({super.key});

  @override
  State<PetsPetPageWidget> createState() => _PetsPetPageWidgetState();
}

class _PetsPetPageWidgetState extends State<PetsPetPageWidget>
    with TickerProviderStateMixin {
  late PetsPetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsPetPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.petModulePetPageOpened ==
          false) {
        safeSetState(
            () => _model.petsAddPetController = createPageWalkthrough(context));
        _model.petsAddPetController?.show(context: context);

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              userLoginHistory: createUserLoginHistoryStruct(
                petModulePetPageOpened: true,
                clearUnsetFields: false,
              ),
            ));
      }
      _model.allPetsOutput = await queryPetsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.allPets = _model.allPetsOutput!.toList().cast<PetsRecord>();
      safeSetState(() {});
      _model.eatingPlanOutput = await queryPetsEatingPlanTimeRecordOnce(
        queryBuilder: (petsEatingPlanTimeRecord) =>
            petsEatingPlanTimeRecord.where(
          'pet',
          isEqualTo:
              _model.allPets.elementAtOrNull(_model.currentIndex)?.reference,
        ),
      );
      _model.eatingPlan =
          _model.eatingPlanOutput!.toList().cast<PetsEatingPlanTimeRecord>();
      safeSetState(() {});
    });

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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_model.allPets.isNotEmpty) {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: PetsPageExpandedFloatMenuWidget(
                        pet: _model.allPets
                            .elementAtOrNull(_model.currentIndex)!
                            .reference,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            } else {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: AddPetsPopupWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }

            _model.allPetsOutput3 = await queryPetsRecordOnce(
              parent: FFAppState().currentUserRef,
            );
            _model.allPets = _model.allPetsOutput3!.toList().cast<PetsRecord>();
            _model.currentIndex = () {
              if (_model.currentIndex >= _model.allPetsOutput3!.length) {
                return functions.minus(_model.allPetsOutput3!.length, 1);
              } else if (((_model.allPetsOutput3 != null &&
                          (_model.allPetsOutput3)!.isNotEmpty) ==
                      true) &&
                  (_model.currentIndex < 0)) {
                return 0;
              } else {
                return _model.currentIndex;
              }
            }();
            safeSetState(() {});
            _model.eatingPlanOutput3 = await queryPetsEatingPlanTimeRecordOnce(
              queryBuilder: (petsEatingPlanTimeRecord) =>
                  petsEatingPlanTimeRecord.where(
                'pet',
                isEqualTo: _model.allPets
                    .elementAtOrNull(_model.currentIndex)
                    ?.reference,
              ),
            );
            _model.eatingPlan = _model.eatingPlanOutput3!
                .toList()
                .cast<PetsEatingPlanTimeRecord>();
            safeSetState(() {});

            safeSetState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).pets,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ).addWalkthrough(
            iconSb2jsiku,
            _model.petsAddPetController,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('HubPage');
                },
                text: '',
                icon: Icon(
                  FFIcons.kaltArrowLeft,
                  color: FlutterFlowTheme.of(context).pets,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  height: 24.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFF5F5F5),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF3765C0),
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
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'pe72nt66' /* Улюбленці */,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Settings');
                      },
                      text: '',
                      icon: Icon(
                        FFIcons.ksettingsGrey,
                        color: FlutterFlowTheme.of(context).pets,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                              context.goNamed('PetsHistoryPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'fhwf7j73' /* History */,
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                              context.goNamed('PetsPlannerPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'iepikk51' /* Planner */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                              'qfvj64uu' /* Pets */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).pets,
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
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: (_model.allPets.isNotEmpty) == true,
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 100.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Visibility(
                            visible: _model.allPets.isNotEmpty,
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AddPetsPopupWidget(
                                          pet: _model.allPets.elementAtOrNull(
                                              _model.currentIndex),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.allPetsOutput2 =
                                    await queryPetsRecordOnce(
                                  parent: FFAppState().currentUserRef,
                                );
                                _model.allPets = _model.allPetsOutput2!
                                    .toList()
                                    .cast<PetsRecord>();
                                _model.currentIndex = _model.currentIndex >=
                                        _model.allPetsOutput2!.length
                                    ? functions.minus(
                                        _model.allPetsOutput2!.length, 1)
                                    : _model.currentIndex;
                                safeSetState(() {});
                                _model.eatingPlanOutput2 =
                                    await queryPetsEatingPlanTimeRecordOnce(
                                  queryBuilder: (petsEatingPlanTimeRecord) =>
                                      petsEatingPlanTimeRecord.where(
                                    'pet',
                                    isEqualTo: _model.allPets
                                        .elementAtOrNull(_model.currentIndex)
                                        ?.reference,
                                  ),
                                );
                                _model.eatingPlan = _model.eatingPlanOutput2!
                                    .toList()
                                    .cast<PetsEatingPlanTimeRecord>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: _model.allPets.length > 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pets,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Visibility(
                                                  visible: (_model.allPets
                                                          .isNotEmpty) ==
                                                      true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 5.0,
                                                                8.0, 5.0),
                                                    child: Text(
                                                      '${functions.sum(_model.currentIndex, 1).toString()}/${_model.allPets.length.toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_model.allPets.isNotEmpty)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.allPets.length > 1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (_model.currentIndex >
                                                        0) {
                                                      _model.currentIndex =
                                                          _model.currentIndex +
                                                              -1;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.currentIndex =
                                                          functions.minus(
                                                              _model.allPets
                                                                  .length,
                                                              1);
                                                      safeSetState(() {});
                                                    }

                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .reverse();
                                                    }
                                                    _model.eatingPlanOutput6 =
                                                        await queryPetsEatingPlanTimeRecordOnce(
                                                      queryBuilder:
                                                          (petsEatingPlanTimeRecord) =>
                                                              petsEatingPlanTimeRecord
                                                                  .where(
                                                        'pet',
                                                        isEqualTo: _model
                                                            .allPets
                                                            .elementAtOrNull(
                                                                _model
                                                                    .currentIndex)
                                                            ?.reference,
                                                      ),
                                                    );
                                                    _model.eatingPlan = _model
                                                        .eatingPlanOutput6!
                                                        .toList()
                                                        .cast<
                                                            PetsEatingPlanTimeRecord>();
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                  text: '',
                                                  icon: Icon(
                                                    Icons.chevron_left,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pets,
                                                    size: 36.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 60.0,
                                                    height: 80.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        if ((_model.allPets.isNotEmpty) == true)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                _model.allPets
                                                    .elementAtOrNull(
                                                        _model.currentIndex)
                                                    ?.photo,
                                                'https://i.insider.com/5f18a9a1f0f4194db865a0a6?width=700',
                                              ),
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.allPets.length > 1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (_model.currentIndex <
                                                        functions.minus(
                                                            _model
                                                                .allPets.length,
                                                            1)) {
                                                      _model.currentIndex =
                                                          _model.currentIndex +
                                                              1;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.currentIndex = 0;
                                                      safeSetState(() {});
                                                    }

                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .reverse();
                                                    }
                                                    _model.eatingPlanOutput5 =
                                                        await queryPetsEatingPlanTimeRecordOnce(
                                                      queryBuilder:
                                                          (petsEatingPlanTimeRecord) =>
                                                              petsEatingPlanTimeRecord
                                                                  .where(
                                                        'pet',
                                                        isEqualTo: _model
                                                            .allPets
                                                            .elementAtOrNull(
                                                                _model
                                                                    .currentIndex)
                                                            ?.reference,
                                                      ),
                                                    );
                                                    _model.eatingPlan = _model
                                                        .eatingPlanOutput5!
                                                        .toList()
                                                        .cast<
                                                            PetsEatingPlanTimeRecord>();
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                  text: '',
                                                  icon: Icon(
                                                    Icons.navigate_next,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pets,
                                                    size: 36.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 60.0,
                                                    height: 80.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if ((_model.allPets.isNotEmpty) == true)
                                          Text(
                                            _model.allPets
                                                .elementAtOrNull(
                                                    _model.currentIndex)!
                                                .name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        if ((_model.allPets.isNotEmpty) == true)
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.red) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .error;
                                                } else if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.orange) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary;
                                                } else if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.yellow) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .warning;
                                                } else if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.green) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondary;
                                                } else if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.sky) {
                                                  return Color(0xFF39B3EF);
                                                } else if (_model.allPets
                                                        .elementAtOrNull(
                                                            _model.currentIndex)
                                                        ?.color ==
                                                    MyColorsEnum.blue) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .error;
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((_model.allPets.isNotEmpty) == true)
                                        Text(
                                          _model.allPets
                                              .elementAtOrNull(
                                                  _model.currentIndex)!
                                              .breed,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      if ((_model.allPets.isNotEmpty) == true)
                                        Text(
                                          dateTimeFormat(
                                            "relative",
                                            _model.allPets
                                                .elementAtOrNull(
                                                    _model.currentIndex)!
                                                .birthday!,
                                            locale: FFLocalizations.of(context)
                                                    .languageShortCode ??
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      if ((_model.allPets.isNotEmpty) == true)
                                        Text(
                                          '${_model.allPets.elementAtOrNull(_model.currentIndex)?.weight?.toString()} kg',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                    ],
                                  ),
                                ].addToEnd(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                  if ((_model.allPets.isNotEmpty) == false)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    child: AddPetsPopupWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            _model.allPetsOutput4 = await queryPetsRecordOnce(
                              parent: FFAppState().currentUserRef,
                            );
                            _model.allPets = _model.allPetsOutput4!
                                .toList()
                                .cast<PetsRecord>();
                            _model.currentIndex = () {
                              if (_model.currentIndex >=
                                  _model.allPetsOutput4!.length) {
                                return functions.minus(
                                    _model.allPetsOutput4!.length, 1);
                              } else if (((_model.allPetsOutput4 != null &&
                                          (_model.allPetsOutput4)!
                                              .isNotEmpty) ==
                                      true) &&
                                  (_model.currentIndex < 0)) {
                                return 0;
                              } else {
                                return _model.currentIndex;
                              }
                            }();
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 58.0,
                          ),
                        ),
                      ),
                    ),
                  if (((_model.allPets.isNotEmpty) == true) &&
                      (_model.eatingPlan.isNotEmpty))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 20.0, 24.0, 20.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32.0),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gezjj0j8' /* Годування */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            if (_model.allPets.isNotEmpty)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 20.0),
                                child: Builder(
                                  builder: (context) {
                                    final list = _model.eatingPlan
                                        .sortedList(
                                            keyOf: (e) => e.time!, desc: false)
                                        .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(list.length,
                                          (listIndex) {
                                        final listItem = list[listIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                    "Hm",
                                                    listItem.time!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
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
                                                    await listItem.reference
                                                        .delete();
                                                    _model.eatingPlanOutput4 =
                                                        await queryPetsEatingPlanTimeRecordOnce(
                                                      queryBuilder:
                                                          (petsEatingPlanTimeRecord) =>
                                                              petsEatingPlanTimeRecord
                                                                  .where(
                                                        'pet',
                                                        isEqualTo: _model
                                                            .allPets
                                                            .elementAtOrNull(
                                                                _model
                                                                    .currentIndex)
                                                            ?.reference,
                                                      ),
                                                    );
                                                    _model.eatingPlan = _model
                                                        .eatingPlanOutput4!
                                                        .toList()
                                                        .cast<
                                                            PetsEatingPlanTimeRecord>();
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
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
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.petsAddPetController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
