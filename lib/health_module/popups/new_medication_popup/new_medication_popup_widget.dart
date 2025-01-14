import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_medication_popup_model.dart';
export 'new_medication_popup_model.dart';

class NewMedicationPopupWidget extends StatefulWidget {
  const NewMedicationPopupWidget({
    super.key,
    this.medication,
  });

  final MedicationRecord? medication;

  @override
  State<NewMedicationPopupWidget> createState() =>
      _NewMedicationPopupWidgetState();
}

class _NewMedicationPopupWidgetState extends State<NewMedicationPopupWidget> {
  late NewMedicationPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewMedicationPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.medication != null) {
        _model.medicationFrequency = widget!.medication?.frequency;
        _model.currentFrequencyIndex = () {
          if (widget!.medication?.frequency?.scheme ==
              FrequencySchemeEnum.EveryDay) {
            return 1;
          } else if (widget!.medication?.frequency?.scheme ==
              FrequencySchemeEnum.EveryXDay) {
            return 2;
          } else if (widget!.medication?.frequency?.scheme ==
              FrequencySchemeEnum.SpecificDayOfWeek) {
            return 3;
          } else if (widget!.medication?.frequency?.scheme ==
              FrequencySchemeEnum.OnceAtSpecificDate) {
            return 4;
          } else {
            return 1;
          }
        }();
        safeSetState(() {});
        safeSetState(() {
          _model.nameTextFieldTextController?.text = widget!.medication!.name;
        });
        safeSetState(() {
          _model.durationTextFieldTextController?.text =
              widget!.medication!.duration.toString();
        });
        safeSetState(() {
          _model.notificationsEnambleSwitchValue =
              widget!.medication!.notificationEnable;
        });
        safeSetState(() {
          _model.doseTextFieldTextController?.text =
              widget!.medication!.dose.toString();
        });
        safeSetState(() {
          _model.doseDropDownValueController?.value = () {
            if (widget!.medication?.doseType == MedicationDoseEnum.pill) {
              return '0';
            } else if (widget!.medication?.doseType == MedicationDoseEnum.ml) {
              return '1';
            } else if (widget!.medication?.doseType == MedicationDoseEnum.mg) {
              return '2';
            } else {
              return '0';
            }
          }();
        });
        safeSetState(() {
          _model.dropDownValueController?.value = () {
            if (widget!.medication?.frequency?.scheme ==
                FrequencySchemeEnum.EveryDay) {
              return 1;
            } else if (widget!.medication?.frequency?.scheme ==
                FrequencySchemeEnum.EveryXDay) {
              return 2;
            } else if (widget!.medication?.frequency?.scheme ==
                FrequencySchemeEnum.SpecificDayOfWeek) {
              return 3;
            } else if (widget!.medication?.frequency?.scheme ==
                FrequencySchemeEnum.OnceAtSpecificDate) {
              return 4;
            } else {
              return 1;
            }
          }();
        });
        if (widget!.medication?.frequency?.scheme ==
            FrequencySchemeEnum.EveryXDay) {
          safeSetState(() {
            _model.daysTextFieldTextController?.text = valueOrDefault<String>(
              widget!.medication?.frequency?.everyXDays.toString(),
              '1',
            );
          });
        }
        if (widget!.medication?.frequency?.scheme ==
            FrequencySchemeEnum.OnceAtSpecificDate) {
          safeSetState(() {
            _model.specificDateTextFieldTextController?.text = dateTimeFormat(
              "d/M/y",
              widget!.medication!.frequency.specificDay!,
              locale: FFLocalizations.of(context).languageCode,
            );
          });
        }
      } else {
        _model.medicationFrequency = MedicationFrequencyStruct(
          scheme: FrequencySchemeEnum.EveryDay,
          lastDate: functions.getDateOnly(getCurrentTimestamp),
        );
        safeSetState(() {});
        _model.updateMedicationFrequencyStruct(
          (e) => e
            ..updateTimeOfUsage(
              (e) => e.add(MedicationUsageTimeStruct()),
            ),
        );
        safeSetState(() {});
      }
    });

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.daysTextFieldTextController ??= TextEditingController();
    _model.daysTextFieldFocusNode ??= FocusNode();

    _model.specificDateTextFieldTextController ??= TextEditingController();
    _model.specificDateTextFieldFocusNode ??= FocusNode();

    _model.durationTextFieldTextController ??= TextEditingController();
    _model.durationTextFieldFocusNode ??= FocusNode();

    _model.doseTextFieldTextController ??= TextEditingController();
    _model.doseTextFieldFocusNode ??= FocusNode();

    _model.notificationsEnambleSwitchValue = true;
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
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: SafeArea(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(32.0),
                                topRight: Radius.circular(32.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 100.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: widget!.medication != null,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Ви дійно бажаєте видалити запис?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Скасувати'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Видалити'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await widget!
                                                      .medication!.reference
                                                      .update(
                                                          createMedicationRecordData(
                                                    state:
                                                        RecordStateEnum.deleted,
                                                  ));
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Icon(
                                                Icons.delete_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .health,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          widget!.medication != null
                                              ? 'Редагувати ліки'
                                              : 'Додати ліки',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .nameTextFieldTextController,
                                              focusNode:
                                                  _model.nameTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'frz2hbly' /* Назва */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .nameTextFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 300.0,
                                            child: Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FlutterFlowDropDown<int>(
                                                  controller: _model
                                                          .dropDownValueController ??=
                                                      FormFieldController<int>(
                                                    _model.dropDownValue ??= 1,
                                                  ),
                                                  options: List<int>.from(
                                                      [1, 2, 3, 4]),
                                                  optionLabels: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hk6otuq5' /* Щодня */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      's0aao7un' /* Повторювати через */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'dbm0ebc1' /* Конкретні дні тижня */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q4vqwsvn' /* Одноразово */,
                                                    )
                                                  ],
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                        .dropDownValue = val);
                                                    _model
                                                        .updateMedicationFrequencyStruct(
                                                      (e) => e
                                                        ..scheme = () {
                                                          if (_model
                                                                  .dropDownValue ==
                                                              1) {
                                                            return FrequencySchemeEnum
                                                                .EveryDay;
                                                          } else if (_model
                                                                  .dropDownValue ==
                                                              2) {
                                                            return FrequencySchemeEnum
                                                                .EveryXDay;
                                                          } else if (_model
                                                                  .dropDownValue ==
                                                              3) {
                                                            return FrequencySchemeEnum
                                                                .SpecificDayOfWeek;
                                                          } else if (_model
                                                                  .dropDownValue ==
                                                              4) {
                                                            return FrequencySchemeEnum
                                                                .OnceAtSpecificDate;
                                                          } else {
                                                            return FrequencySchemeEnum
                                                                .EveryDay;
                                                          }
                                                        }(),
                                                    );
                                                    _model.currentFrequencyIndex =
                                                        _model.dropDownValue!;
                                                    safeSetState(() {});
                                                  },
                                                  height: 60.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'xad312wv' /* Please select... */,
                                                  ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 1.0,
                                                  borderRadius: 16.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'cc44969w' /* Частота споживання */,
                                                  ),
                                                  labelTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                                if (_model
                                                        .currentFrequencyIndex ==
                                                    2)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .daysTextFieldTextController,
                                                      focusNode: _model
                                                          .daysTextFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.daysTextFieldTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          _model
                                                              .updateMedicationFrequencyStruct(
                                                            (e) => e
                                                              ..everyXDays = int
                                                                  .tryParse(_model
                                                                      .daysTextFieldTextController
                                                                      .text),
                                                          );
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'pxal9fef' /* Кількість днів */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .daysTextFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                if (_model
                                                        .currentFrequencyIndex ==
                                                    4)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .specificDateTextFieldTextController,
                                                          focusNode: _model
                                                              .specificDateTextFieldFocusNode,
                                                          autofocus: false,
                                                          readOnly: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'mv3c1hp6' /* Дата одноразового прийому */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .access_time_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
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
                                                          validator: _model
                                                              .specificDateTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final _datePicked1Date =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate: (widget!
                                                                      .medication
                                                                      ?.frequency
                                                                      ?.specificDay ??
                                                                  DateTime
                                                                      .now()),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                              builder: (context,
                                                                  child) {
                                                                return wrapInMaterialDatePickerTheme(
                                                                  context,
                                                                  child!,
                                                                  headerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  headerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  headerTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                  pickerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  pickerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  selectedDateTimeBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  selectedDateTimeForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  actionButtonForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  iconSize:
                                                                      24.0,
                                                                );
                                                              },
                                                            );

                                                            if (_datePicked1Date !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked1 =
                                                                    DateTime(
                                                                  _datePicked1Date
                                                                      .year,
                                                                  _datePicked1Date
                                                                      .month,
                                                                  _datePicked1Date
                                                                      .day,
                                                                );
                                                              });
                                                            }
                                                            if (_model
                                                                    .datePicked1 !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.specificDateTextFieldTextController
                                                                        ?.text =
                                                                    dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .datePicked1,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                              });
                                                              _model
                                                                  .updateMedicationFrequencyStruct(
                                                                (e) => e
                                                                  ..specificDay =
                                                                      _model
                                                                          .datePicked1,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (_model
                                                        .currentFrequencyIndex ==
                                                    3)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'kiqnhe2q' /* Оберіть необхідні дні */,
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
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        15.0,
                                                                        5.0,
                                                                        20.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('1'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(1),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(1),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'uyvpm4qx' /* Пн */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '1'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('1'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('2'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(2),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(2),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yxpg6uft' /* Вт */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '2'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('2'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('3'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(3),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(3),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'u0bmxn7r' /* Ср */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '3'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('3'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('4'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(4),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(4),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'uwmk399g' /* Чт */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '4'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('4'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('5'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(5),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(5),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ybaopjkg' /* Пт */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '5'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('5'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('6'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(6),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(6),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'uy9e7xd0' /* Сб */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '6'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('6'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                        .medicationFrequency!
                                                                        .daysOfWeek
                                                                        .contains(
                                                                            functions.toInt('7'))) {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.remove(7),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model
                                                                          .updateMedicationFrequencyStruct(
                                                                        (e) => e
                                                                          ..updateDaysOfWeek(
                                                                            (e) =>
                                                                                e.add(7),
                                                                          ),
                                                                      );
                                                                      _model.weekSelectorError =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yt0akl57' /* Нд */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model
                                                                            .medicationFrequency!
                                                                            .daysOfWeek
                                                                            .contains(functions.toInt(
                                                                                '7'))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: _model.medicationFrequency!.daysOfWeek.contains(functions.toInt('7'))
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: _model.weekSelectorError
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .error
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (_model
                                                              .weekSelectorError)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'qc0itxy8' /* Вами не обрано жодного дня */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          1.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'u6hchaam' /* Час прийому */,
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
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final times = _model
                                                                        .medicationFrequency
                                                                        ?.timeOfUsage
                                                                        ?.toList() ??
                                                                    [];

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          times
                                                                              .length,
                                                                          (timesIndex) {
                                                                    final timesItem =
                                                                        times[
                                                                            timesIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              final _datePicked2Time = await showTimePicker(
                                                                                context: context,
                                                                                initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                builder: (context, child) {
                                                                                  return wrapInMaterialTimePickerTheme(
                                                                                    context,
                                                                                    child!,
                                                                                    headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                    headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                    headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 32.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                    pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                    selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                    actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    iconSize: 24.0,
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_datePicked2Time != null) {
                                                                                safeSetState(() {
                                                                                  _model.datePicked2 = DateTime(
                                                                                    getCurrentTimestamp.year,
                                                                                    getCurrentTimestamp.month,
                                                                                    getCurrentTimestamp.day,
                                                                                    _datePicked2Time.hour,
                                                                                    _datePicked2Time.minute,
                                                                                  );
                                                                                });
                                                                              }
                                                                              if (_model.datePicked2 != null) {
                                                                                _model.updateMedicationFrequencyStruct(
                                                                                  (e) => e
                                                                                    ..updateTimeOfUsage(
                                                                                      (e) => e[timesIndex]..time = _model.datePicked2,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 54.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                border: Border.all(
                                                                                  color: _model.timeError ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).alternate,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 7.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        "Hm",
                                                                                        timesItem.time,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.access_time_sharp,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (_model.medicationFrequency!.timeOfUsage.length >
                                                                            1)
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                Color(0xFFFF848B),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.delete_outline,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              _model.updateMedicationFrequencyStruct(
                                                                                (e) => e
                                                                                  ..updateTimeOfUsage(
                                                                                    (e) => e.removeAt(timesIndex),
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    );
                                                                  }).divide(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          if (_model.timeError)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'qxq83hhv' /* Обрані вами години не повинні ... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          if ((_model.currentFrequencyIndex ==
                                                                  1) &&
                                                              (_model
                                                                      .medicationFrequency!
                                                                      .timeOfUsage
                                                                      .length <
                                                                  10))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    45.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .alarm_add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .updateMedicationFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateTimeOfUsage(
                                                                        (e) => e
                                                                            .add(MedicationUsageTimeStruct(
                                                                          time:
                                                                              getCurrentTimestamp,
                                                                          isUseg:
                                                                              false,
                                                                        )),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 300.0,
                                            child: Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .durationTextFieldTextController,
                                                        focusNode: _model
                                                            .durationTextFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'rscb7vkz' /* Кількість днів лікування */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
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
                                                                  .primary,
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
                                                          suffixIcon: Icon(
                                                            Icons
                                                                .access_time_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .durationTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius: 18.0,
                                                      buttonSize: 50.0,
                                                      icon: Icon(
                                                        Icons.question_mark,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Кількість днів лікування це період в який ви приймаєту ліки, після завершення введеної кількості днів, надходження сповіщеннь буде припинено'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _model
                                                        .doseTextFieldTextController,
                                                    focusNode: _model
                                                        .doseTextFieldFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'y21f8h9x' /* Доза */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: _model
                                                        .doseTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .doseDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.doseDropDownValue ??=
                                                        '0',
                                                  ),
                                                  options: List<String>.from(
                                                      ['0', '1', '2']),
                                                  optionLabels: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm3qx2gxa' /* Табл */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'uv5bpehx' /* Мл */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2jzcr2t8' /* Мг */,
                                                    )
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .doseDropDownValue =
                                                          val),
                                                  width: 80.0,
                                                  height: 50.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'stk219br' /* Select... */,
                                                  ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 1.0,
                                                  borderRadius: 16.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 7.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'har16712' /* Надходження сповіщень */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Switch.adaptive(
                                                      value: _model
                                                          .notificationsEnambleSwitchValue!,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .notificationsEnambleSwitchValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      activeTrackColor:
                                                          Color(0x644B39EF),
                                                      inactiveTrackColor:
                                                          Color(0x44C1121F),
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .health,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 22.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.weekSelectorError = false;
                                        _model.timeError = false;
                                        safeSetState(() {});
                                        if ((_model.dropDownValue == 3) &&
                                            (_model.medicationFrequency
                                                    ?.daysOfWeek?.length ==
                                                0)) {
                                          _model.weekSelectorError = true;
                                          safeSetState(() {});
                                          return;
                                        }
                                        if (functions.hasDoubleMedicationTime(
                                            _model.medicationFrequency!
                                                .timeOfUsage
                                                .toList())) {
                                          _model.timeError = true;
                                          safeSetState(() {});
                                          return;
                                        }
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (widget!.medication != null) {
                                          await widget!.medication!.reference
                                              .update(
                                                  createMedicationRecordData(
                                            name: _model
                                                .nameTextFieldTextController
                                                .text,
                                            duration: int.tryParse(_model
                                                .durationTextFieldTextController
                                                .text),
                                            notificationEnable: _model
                                                .notificationsEnambleSwitchValue,
                                            frequency:
                                                updateMedicationFrequencyStruct(
                                              _model.medicationFrequency,
                                              clearUnsetFields: false,
                                            ),
                                            dose: int.tryParse(_model
                                                .doseTextFieldTextController
                                                .text),
                                            doseType: () {
                                              if (_model.doseDropDownValue ==
                                                  '0') {
                                                return MedicationDoseEnum.pill;
                                              } else if (_model
                                                      .doseDropDownValue ==
                                                  '1') {
                                                return MedicationDoseEnum.ml;
                                              } else if (_model
                                                      .doseDropDownValue ==
                                                  '2') {
                                                return MedicationDoseEnum.mg;
                                              } else {
                                                return MedicationDoseEnum.pill;
                                              }
                                            }(),
                                          ));
                                        } else {
                                          await MedicationRecord.createDoc(
                                                  FFAppState().currentUserRef!)
                                              .set(createMedicationRecordData(
                                            name: _model
                                                .nameTextFieldTextController
                                                .text,
                                            duration: int.tryParse(_model
                                                .durationTextFieldTextController
                                                .text),
                                            notificationEnable: _model
                                                .notificationsEnambleSwitchValue,
                                            frequency:
                                                updateMedicationFrequencyStruct(
                                              _model.medicationFrequency,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            dose: int.tryParse(_model
                                                .doseTextFieldTextController
                                                .text),
                                            doseType: () {
                                              if (_model.doseDropDownValue ==
                                                  '0') {
                                                return MedicationDoseEnum.pill;
                                              } else if (_model
                                                      .doseDropDownValue ==
                                                  '1') {
                                                return MedicationDoseEnum.ml;
                                              } else if (_model
                                                      .doseDropDownValue ==
                                                  '2') {
                                                return MedicationDoseEnum.mg;
                                              } else {
                                                return MedicationDoseEnum.pill;
                                              }
                                            }(),
                                            state: RecordStateEnum.visible,
                                          ));
                                        }

                                        Navigator.pop(context);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ubxauo3x' /* Зберегти */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 54.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 25.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ku4ieipa' /* Скасувати */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
