import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/car_service_modul/dialogs/add_service_task_popup/add_service_task_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/car_service_planner.dart';
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
import 'car_service_planner_page_model.dart';
export 'car_service_planner_page_model.dart';

class CarServicePlannerPageWidget extends StatefulWidget {
  const CarServicePlannerPageWidget({super.key});

  @override
  State<CarServicePlannerPageWidget> createState() =>
      _CarServicePlannerPageWidgetState();
}

class _CarServicePlannerPageWidgetState
    extends State<CarServicePlannerPageWidget> with TickerProviderStateMixin {
  late CarServicePlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarServicePlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoOutput =
          await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
      if (_model.userInfoOutput?.userLoginHistory?.carModuleOpened == false) {
        safeSetState(() => _model.carServicePlannerController =
            createPageWalkthrough(context));
        _model.carServicePlannerController?.show(context: context);

        await FFAppState().currentUserRef!.update(createUsersRecordData(
              userLoginHistory: createUserLoginHistoryStruct(
                carModuleOpened: true,
                clearUnsetFields: false,
              ),
            ));
      }
      _model.todayTaskOutput = await queryCarServiceTaskRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (carServiceTaskRecord) => carServiceTaskRecord.where(
          'date',
          isEqualTo: functions.getDateOnly(getCurrentTimestamp),
        ),
      );
      _model.tomorrowTaskOutput = await queryCarServiceTaskRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (carServiceTaskRecord) => carServiceTaskRecord.where(
          'date',
          isEqualTo: functions.getTomorrowDate(),
        ),
      );
      _model.upcomingTaskOutput = await queryCarServiceTaskRecordOnce(
        parent: FFAppState().currentUserRef,
        queryBuilder: (carServiceTaskRecord) => carServiceTaskRecord
            .where(
              'date',
              isGreaterThan: functions.getTomorrowDate(),
            )
            .where(
              'date',
              isLessThanOrEqualTo:
                  functions.dateAddDays(functions.getTomorrowDate(), 7),
            ),
      );
      _model.allCars = await queryCarsRecordOnce(
        parent: FFAppState().currentUserRef,
      );
      _model.todaylist =
          _model.todayTaskOutput!.toList().cast<CarServiceTaskRecord>();
      _model.currentCardIndex = 0;
      _model.isEmpty = _model.todayTaskOutput
                  ?.where((e) =>
                      e.date == functions.getDateOnly(getCurrentTimestamp))
                  .toList()
                  ?.length ==
              0
          ? true
          : false;
      _model.tomorrowList =
          _model.tomorrowTaskOutput!.toList().cast<CarServiceTaskRecord>();
      _model.upcomingList =
          _model.upcomingTaskOutput!.toList().cast<CarServiceTaskRecord>();
      _model.myCars = _model.allCars!.toList().cast<CarsRecord>();
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
            _model.carCount = await queryCarsRecordCount(
              parent: FFAppState().currentUserRef,
            );
            if (_model.carCount! > 0) {
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
                      child: AddServiceTaskPopupWidget(
                        date: functions.getDateOnly(getCurrentTimestamp),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Попередження'),
                    content: Text('Додайте автомобіль, щоб створити подію!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }

            _model.todayTaskOutput2 = await queryCarServiceTaskRecordOnce(
              parent: FFAppState().currentUserRef,
              queryBuilder: (carServiceTaskRecord) =>
                  carServiceTaskRecord.where(
                'date',
                isEqualTo: functions.getDateOnly(getCurrentTimestamp),
              ),
            );
            _model.tomorrowTaskOutput2 = await queryCarServiceTaskRecordOnce(
              parent: FFAppState().currentUserRef,
              queryBuilder: (carServiceTaskRecord) =>
                  carServiceTaskRecord.where(
                'date',
                isEqualTo: functions.getTomorrowDate(),
              ),
            );
            _model.upcomingTaskOutput2 = await queryCarServiceTaskRecordOnce(
              parent: FFAppState().currentUserRef,
              queryBuilder: (carServiceTaskRecord) => carServiceTaskRecord
                  .where(
                    'date',
                    isGreaterThan: functions.getTomorrowDate(),
                  )
                  .where(
                    'date',
                    isLessThanOrEqualTo:
                        functions.dateAddDays(functions.getTomorrowDate(), 7),
                  ),
            );
            _model.allCars2 = await queryCarsRecordOnce(
              parent: FFAppState().currentUserRef,
            );
            _model.todaylist =
                _model.todayTaskOutput2!.toList().cast<CarServiceTaskRecord>();
            _model.currentCardIndex = 0;
            _model.tomorrowList = _model.tomorrowTaskOutput2!
                .toList()
                .cast<CarServiceTaskRecord>();
            _model.upcomingList = _model.upcomingTaskOutput2!
                .toList()
                .cast<CarServiceTaskRecord>();
            _model.myCars = _model.allCars2!.toList().cast<CarsRecord>();
            safeSetState(() {});

            safeSetState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).carService,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
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
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'uh8fq1zt' /* Автосервіс */,
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
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
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
                              '60ilb9ez' /* History */,
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
                          ).addWalkthrough(
                            buttonOaxe4n2f,
                            _model.carServicePlannerController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'igksda1e' /* Planner */,
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
                                    color: Colors.white,
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
                          ).addWalkthrough(
                            buttonGpcv8pvz,
                            _model.carServicePlannerController,
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('CarServiceInformationPage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'dbxvnea0' /* Cars */,
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
                          ).addWalkthrough(
                            button3z2wl8y0,
                            _model.carServicePlannerController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).addWalkthrough(
                  containerV52724pg,
                  _model.carServicePlannerController,
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: (_model.todaylist.isNotEmpty) == true,
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
                            visible: (_model.todaylist.isNotEmpty) == true,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.todaylist.length > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                        if (_model.currentCardIndex > 0) {
                                          _model.currentCardIndex =
                                              _model.currentCardIndex + -1;
                                          safeSetState(() {});
                                        } else {
                                          _model.currentCardIndex =
                                              functions.minus(
                                                  _model.todaylist.length, 1);
                                          safeSetState(() {});
                                        }

                                        await Future.delayed(
                                            const Duration(milliseconds: 100));
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
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .carService,
                                        size: 36.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 60.0,
                                        height: 80.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(0.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                Container(
                                  decoration: BoxDecoration(),
                                ),
                                if ((_model.todaylist.isNotEmpty) == true)
                                  StreamBuilder<CarsRecord>(
                                    stream: CarsRecord.getDocument(_model
                                        .todaylist
                                        .elementAtOrNull(
                                            _model.currentCardIndex)!
                                        .car!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final columnCarsRecord = snapshot.data!;

                                      return InkWell(
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
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      AddServiceTaskPopupWidget(
                                                    taskDoc: _model.todaylist
                                                        .elementAtOrNull(_model
                                                            .currentCardIndex),
                                                    publicForm: true,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          _model.todayTasks3 =
                                              await queryCarServiceTaskRecordOnce(
                                            parent: FFAppState().currentUserRef,
                                            queryBuilder:
                                                (carServiceTaskRecord) =>
                                                    carServiceTaskRecord.where(
                                              'date',
                                              isEqualTo: functions.getDateOnly(
                                                  getCurrentTimestamp),
                                            ),
                                          );
                                          _model.tomorrowTaskOutput5 =
                                              await queryCarServiceTaskRecordOnce(
                                            parent: FFAppState().currentUserRef,
                                            queryBuilder:
                                                (carServiceTaskRecord) =>
                                                    carServiceTaskRecord.where(
                                              'date',
                                              isEqualTo:
                                                  functions.getTomorrowDate(),
                                            ),
                                          );
                                          _model.upcomingTaskOutput5 =
                                              await queryCarServiceTaskRecordOnce(
                                            parent: FFAppState().currentUserRef,
                                            queryBuilder:
                                                (carServiceTaskRecord) =>
                                                    carServiceTaskRecord
                                                        .where(
                                                          'date',
                                                          isGreaterThan: functions
                                                              .getTomorrowDate(),
                                                        )
                                                        .where(
                                                          'date',
                                                          isLessThanOrEqualTo:
                                                              functions.dateAddDays(
                                                                  functions
                                                                      .getTomorrowDate(),
                                                                  7),
                                                        ),
                                          );
                                          _model.allCars5 =
                                              await queryCarsRecordOnce(
                                            parent: FFAppState().currentUserRef,
                                          );
                                          _model.todaylist = _model.todayTasks3!
                                              .toList()
                                              .cast<CarServiceTaskRecord>();
                                          _model.currentCardIndex =
                                              _model.currentCardIndex >=
                                                      _model.todayTasks3!.length
                                                  ? 0
                                                  : _model.currentCardIndex;
                                          _model.isEmpty =
                                              _model.todayTasks3?.length == 0
                                                  ? true
                                                  : false;
                                          safeSetState(() {});
                                          _model.tomorrowList = _model
                                              .tomorrowTaskOutput5!
                                              .toList()
                                              .cast<CarServiceTaskRecord>();
                                          _model.upcomingList = _model
                                              .upcomingTaskOutput5!
                                              .toList()
                                              .cast<CarServiceTaskRecord>();
                                          _model.myCars = _model.allCars5!
                                              .toList()
                                              .cast<CarsRecord>();
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'imsyeq13' /* Сьогодні */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  _model.myCars
                                                      .where((e) =>
                                                          e.reference ==
                                                          _model.todaylist
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .currentCardIndex)
                                                              ?.car)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.photo,
                                                  'https://zotzelectrical.com/pcimages/1911BakerElectric.jpg',
                                                ),
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${_model.myCars.where((e) => e.reference == _model.todaylist.elementAtOrNull(_model.currentCardIndex)?.car).toList().firstOrNull?.brand} ${_model.myCars.where((e) => e.reference == _model.todaylist.elementAtOrNull(_model.currentCardIndex)?.car).toList().firstOrNull?.model}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 24.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    Text(
                                                      _model.todaylist
                                                          .elementAtOrNull(_model
                                                              .currentCardIndex)!
                                                          .title,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible:
                                                            true /* Warning: Trying to access variable not yet defined. */,
                                                        child: StreamBuilder<
                                                            List<
                                                                CarServiceTaskHistoryRecord>>(
                                                          stream:
                                                              queryCarServiceTaskHistoryRecord(
                                                            parent: FFAppState()
                                                                .currentUserRef,
                                                            queryBuilder:
                                                                (carServiceTaskHistoryRecord) =>
                                                                    carServiceTaskHistoryRecord
                                                                        .where(
                                                              'serviceTastReference',
                                                              isEqualTo: _model
                                                                  .todaylist
                                                                  .elementAtOrNull(
                                                                      _model
                                                                          .currentCardIndex)
                                                                  ?.reference,
                                                            ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            if (snapshot.data!
                                                                .isEmpty) {
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 24.0))
                                              .addToStart(
                                                  SizedBox(height: 24.0))
                                              .addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      );
                                    },
                                  ),
                                Container(
                                  decoration: BoxDecoration(),
                                ),
                                if (_model.todaylist.length > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                        if (_model.currentCardIndex <
                                            functions.minus(
                                                _model.todaylist.length, 1)) {
                                          _model.currentCardIndex =
                                              _model.currentCardIndex + 1;
                                          safeSetState(() {});
                                        } else {
                                          _model.currentCardIndex = 0;
                                          safeSetState(() {});
                                        }

                                        await Future.delayed(
                                            const Duration(milliseconds: 100));
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
                                        Icons.navigate_next,
                                        color: FlutterFlowTheme.of(context)
                                            .carService,
                                        size: 36.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 60.0,
                                        height: 80.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(0.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                              ],
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
                  if (_model.tomorrowList.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'fqjhe8t1' /* Завтра */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Builder(
                              builder: (context) {
                                final list = _model.tomorrowList.toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(list.length, (listIndex) {
                                      final listItem = list[listIndex];
                                      return Visibility(
                                        visible: (_model.myCars
                                                .where((e) =>
                                                    e.reference == listItem.car)
                                                .toList()
                                                .isNotEmpty) ==
                                            true,
                                        child: Container(
                                          height: 100.0,
                                          constraints: BoxConstraints(
                                            minWidth: 200.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: InkWell(
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
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          AddServiceTaskPopupWidget(
                                                        taskDoc: listItem,
                                                        publicForm: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              _model.todayTaskOutput4 =
                                                  await queryCarServiceTaskRecordOnce(
                                                parent:
                                                    FFAppState().currentUserRef,
                                                queryBuilder:
                                                    (carServiceTaskRecord) =>
                                                        carServiceTaskRecord
                                                            .where(
                                                  'date',
                                                  isEqualTo:
                                                      functions.getDateOnly(
                                                          getCurrentTimestamp),
                                                ),
                                              );
                                              _model.tomorrowTaskOutput4 =
                                                  await queryCarServiceTaskRecordOnce(
                                                parent:
                                                    FFAppState().currentUserRef,
                                                queryBuilder:
                                                    (carServiceTaskRecord) =>
                                                        carServiceTaskRecord
                                                            .where(
                                                  'date',
                                                  isEqualTo: functions
                                                      .getTomorrowDate(),
                                                ),
                                              );
                                              _model.upcomingTaskOutput4 =
                                                  await queryCarServiceTaskRecordOnce(
                                                parent:
                                                    FFAppState().currentUserRef,
                                                queryBuilder:
                                                    (carServiceTaskRecord) =>
                                                        carServiceTaskRecord
                                                            .where(
                                                              'date',
                                                              isGreaterThan:
                                                                  functions
                                                                      .getTomorrowDate(),
                                                            )
                                                            .where(
                                                              'date',
                                                              isLessThanOrEqualTo:
                                                                  functions.dateAddDays(
                                                                      functions
                                                                          .getTomorrowDate(),
                                                                      7),
                                                            ),
                                              );
                                              _model.allCars4 =
                                                  await queryCarsRecordOnce(
                                                parent:
                                                    FFAppState().currentUserRef,
                                              );
                                              _model.todaylist = _model
                                                  .todayTaskOutput4!
                                                  .toList()
                                                  .cast<CarServiceTaskRecord>();
                                              _model.currentCardIndex = 0;
                                              _model.tomorrowList = _model
                                                  .tomorrowTaskOutput4!
                                                  .toList()
                                                  .cast<CarServiceTaskRecord>();
                                              _model.upcomingList = _model
                                                  .upcomingTaskOutput4!
                                                  .toList()
                                                  .cast<CarServiceTaskRecord>();
                                              _model.myCars = _model.allCars4!
                                                  .toList()
                                                  .cast<CarsRecord>();
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  '${_model.myCars.where((e) => e.reference == listItem.car).toList().firstOrNull?.brand} ${_model.myCars.where((e) => e.reference == listItem.car).toList().firstOrNull?.model}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 24.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    Text(
                                                      listItem.title,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 24.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Visibility(
                                                        visible:
                                                            true /* Warning: Trying to access variable not yet defined. */,
                                                        child: StreamBuilder<
                                                            List<
                                                                CarServiceTaskHistoryRecord>>(
                                                          stream:
                                                              queryCarServiceTaskHistoryRecord(
                                                            parent: FFAppState()
                                                                .currentUserRef,
                                                            queryBuilder:
                                                                (carServiceTaskHistoryRecord) =>
                                                                    carServiceTaskHistoryRecord
                                                                        .where(
                                                              'serviceTastReference',
                                                              isEqualTo: listItem
                                                                  .reference,
                                                            ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            if (snapshot.data!
                                                                .isEmpty) {
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 5.0))
                                                  .addToEnd(
                                                      SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(
                                      SizedBox(width: 8.0),
                                      filterFn: (listIndex) {
                                        final listItem = list[listIndex];
                                        return (_model.myCars
                                                .where((e) =>
                                                    e.reference == listItem.car)
                                                .toList()
                                                .isNotEmpty) ==
                                            true;
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  if (_model.upcomingList.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7ifivmvv' /* Найближчими днями */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 10.0),
                                child: Builder(
                                  builder: (context) {
                                    final upcominglist = _model.upcomingList
                                        .sortedList(
                                            keyOf: (e) => e.date!, desc: false)
                                        .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: upcominglist.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder:
                                          (context, upcominglistIndex) {
                                        final upcominglistItem =
                                            upcominglist[upcominglistIndex];
                                        return InkWell(
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
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        AddServiceTaskPopupWidget(
                                                      taskDoc: upcominglistItem,
                                                      publicForm: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.todayTaskOutput3 =
                                                await queryCarServiceTaskRecordOnce(
                                              parent:
                                                  FFAppState().currentUserRef,
                                              queryBuilder:
                                                  (carServiceTaskRecord) =>
                                                      carServiceTaskRecord
                                                          .where(
                                                'date',
                                                isEqualTo:
                                                    functions.getDateOnly(
                                                        getCurrentTimestamp),
                                              ),
                                            );
                                            _model.tomorrowTaskOutput3 =
                                                await queryCarServiceTaskRecordOnce(
                                              parent:
                                                  FFAppState().currentUserRef,
                                              queryBuilder:
                                                  (carServiceTaskRecord) =>
                                                      carServiceTaskRecord
                                                          .where(
                                                'date',
                                                isEqualTo:
                                                    functions.getTomorrowDate(),
                                              ),
                                            );
                                            _model.upcomingTaskOutput3 =
                                                await queryCarServiceTaskRecordOnce(
                                              parent:
                                                  FFAppState().currentUserRef,
                                              queryBuilder:
                                                  (carServiceTaskRecord) =>
                                                      carServiceTaskRecord
                                                          .where(
                                                            'date',
                                                            isGreaterThan: functions
                                                                .getTomorrowDate(),
                                                          )
                                                          .where(
                                                            'date',
                                                            isLessThanOrEqualTo:
                                                                functions.dateAddDays(
                                                                    functions
                                                                        .getTomorrowDate(),
                                                                    7),
                                                          ),
                                            );
                                            _model.allCars3 =
                                                await queryCarsRecordOnce(
                                              parent:
                                                  FFAppState().currentUserRef,
                                            );
                                            _model.todaylist = _model
                                                .todayTaskOutput3!
                                                .toList()
                                                .cast<CarServiceTaskRecord>();
                                            _model.currentCardIndex = 0;
                                            _model.tomorrowList = _model
                                                .tomorrowTaskOutput3!
                                                .toList()
                                                .cast<CarServiceTaskRecord>();
                                            _model.upcomingList = _model
                                                .upcomingTaskOutput3!
                                                .toList()
                                                .cast<CarServiceTaskRecord>();
                                            _model.myCars = _model.allCars3!
                                                .toList()
                                                .cast<CarsRecord>();
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      upcominglistItem.title,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          dateTimeFormat(
                                                            "dd.MMM",
                                                            upcominglistItem
                                                                .date!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        if (true /* Warning: Trying to access variable not yet defined. */)
                                                          StreamBuilder<
                                                              List<
                                                                  CarServiceTaskHistoryRecord>>(
                                                            stream:
                                                                queryCarServiceTaskHistoryRecord(
                                                              parent: FFAppState()
                                                                  .currentUserRef,
                                                              queryBuilder:
                                                                  (carServiceTaskHistoryRecord) =>
                                                                      carServiceTaskHistoryRecord
                                                                          .where(
                                                                'serviceTastReference',
                                                                isEqualTo:
                                                                    upcominglistItem
                                                                        .reference,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<CarServiceTaskHistoryRecord>
                                                                  iconCarServiceTaskHistoryRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              );
                                                            },
                                                          ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (upcominglistIndex <
                                                  functions.minus(
                                                      _model
                                                          .upcomingList.length,
                                                      1))
                                                Divider(
                                                  thickness: 0.2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: FutureBuilder<int>(
                      future: queryCarServiceTaskRecordCount(
                        parent: FFAppState().currentUserRef,
                        queryBuilder: (carServiceTaskRecord) =>
                            carServiceTaskRecord
                                .where(
                                  'date',
                                  isGreaterThanOrEqualTo: functions
                                      .getDateOnly(getCurrentTimestamp),
                                )
                                .orderBy('date'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        int containerCount = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: containerCount > 0,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.allEventsShow =
                                          !_model.allEventsShow;
                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '71b605ay' /* Усі події */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        if (_model.allEventsShow)
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        if (_model.allEventsShow == false)
                                          Icon(
                                            Icons.arrow_right,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (_model.allEventsShow)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 20.0),
                                        child: StreamBuilder<
                                            List<CarServiceTaskRecord>>(
                                          stream: queryCarServiceTaskRecord(
                                            parent: FFAppState().currentUserRef,
                                            queryBuilder:
                                                (carServiceTaskRecord) =>
                                                    carServiceTaskRecord
                                                        .where(
                                                          'date',
                                                          isGreaterThanOrEqualTo:
                                                              functions.getDateOnly(
                                                                  getCurrentTimestamp),
                                                        )
                                                        .orderBy('date'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xFFF57F44),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CarServiceTaskRecord>
                                                listViewCarServiceTaskRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCarServiceTaskRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 10.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCarServiceTaskRecord =
                                                    listViewCarServiceTaskRecordList[
                                                        listViewIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                                AddServiceTaskPopupWidget(
                                                              taskDoc:
                                                                  listViewCarServiceTaskRecord,
                                                              publicForm: true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.todayTaskOutput6 =
                                                        await queryCarServiceTaskRecordOnce(
                                                      parent: FFAppState()
                                                          .currentUserRef,
                                                      queryBuilder:
                                                          (carServiceTaskRecord) =>
                                                              carServiceTaskRecord
                                                                  .where(
                                                        'date',
                                                        isEqualTo: functions
                                                            .getDateOnly(
                                                                getCurrentTimestamp),
                                                      ),
                                                    );
                                                    _model.tomorrowTaskOutput6 =
                                                        await queryCarServiceTaskRecordOnce(
                                                      parent: FFAppState()
                                                          .currentUserRef,
                                                      queryBuilder:
                                                          (carServiceTaskRecord) =>
                                                              carServiceTaskRecord
                                                                  .where(
                                                        'date',
                                                        isEqualTo: functions
                                                            .getTomorrowDate(),
                                                      ),
                                                    );
                                                    _model.upcomingTaskOutput6 =
                                                        await queryCarServiceTaskRecordOnce(
                                                      parent: FFAppState()
                                                          .currentUserRef,
                                                      queryBuilder:
                                                          (carServiceTaskRecord) =>
                                                              carServiceTaskRecord
                                                                  .where(
                                                                    'date',
                                                                    isGreaterThan:
                                                                        functions
                                                                            .getTomorrowDate(),
                                                                  )
                                                                  .where(
                                                                    'date',
                                                                    isLessThanOrEqualTo:
                                                                        functions.dateAddDays(
                                                                            functions.getTomorrowDate(),
                                                                            7),
                                                                  ),
                                                    );
                                                    _model.allCars6 =
                                                        await queryCarsRecordOnce(
                                                      parent: FFAppState()
                                                          .currentUserRef,
                                                    );
                                                    _model.todaylist = _model
                                                        .todayTaskOutput6!
                                                        .toList()
                                                        .cast<
                                                            CarServiceTaskRecord>();
                                                    _model.currentCardIndex = 0;
                                                    _model.tomorrowList = _model
                                                        .tomorrowTaskOutput6!
                                                        .toList()
                                                        .cast<
                                                            CarServiceTaskRecord>();
                                                    _model.upcomingList = _model
                                                        .upcomingTaskOutput6!
                                                        .toList()
                                                        .cast<
                                                            CarServiceTaskRecord>();
                                                    _model.myCars = _model
                                                        .allCars6!
                                                        .toList()
                                                        .cast<CarsRecord>();
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listViewIndex != 0)
                                                        Divider(
                                                          thickness: 0.2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              listViewCarServiceTaskRecord
                                                                  .title,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                    "dd.MMM",
                                                                    listViewCarServiceTaskRecord
                                                                        .date!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                if (true /* Warning: Trying to access variable not yet defined. */)
                                                                  StreamBuilder<
                                                                      List<
                                                                          CarServiceTaskHistoryRecord>>(
                                                                    stream:
                                                                        queryCarServiceTaskHistoryRecord(
                                                                      parent: FFAppState()
                                                                          .currentUserRef,
                                                                      queryBuilder:
                                                                          (carServiceTaskHistoryRecord) =>
                                                                              carServiceTaskHistoryRecord.where(
                                                                        'serviceTastReference',
                                                                        isEqualTo:
                                                                            listViewCarServiceTaskRecord.reference,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<CarServiceTaskHistoryRecord>
                                                                          iconCarServiceTaskHistoryRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final iconCarServiceTaskHistoryRecord = iconCarServiceTaskHistoryRecordList
                                                                              .isNotEmpty
                                                                          ? iconCarServiceTaskHistoryRecordList
                                                                              .first
                                                                          : null;

                                                                      return Icon(
                                                                        Icons
                                                                            .done,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      );
                                                                    },
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(height: 15.0))
                                    .addToStart(SizedBox(height: 15.0)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (((_model.todaylist.isNotEmpty) == false) &&
                      ((_model.tomorrowList.isNotEmpty) == false) &&
                      ((_model.upcomingList.isNotEmpty) == false))
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rkaf1hz0' /* Наразі записи відсутні */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(),
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
          safeSetState(() => _model.carServicePlannerController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
