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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'watering_frequency_popup_model.dart';
export 'watering_frequency_popup_model.dart';

class WateringFrequencyPopupWidget extends StatefulWidget {
  const WateringFrequencyPopupWidget({
    super.key,
    this.waterFrequency,
  });

  final WateringFrequencyStruct? waterFrequency;

  @override
  State<WateringFrequencyPopupWidget> createState() =>
      _WateringFrequencyPopupWidgetState();
}

class _WateringFrequencyPopupWidgetState
    extends State<WateringFrequencyPopupWidget> {
  late WateringFrequencyPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WateringFrequencyPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.frequency = widget!.waterFrequency;
      safeSetState(() {});
      safeSetState(() {
        _model.wateringShemeDropdownValueController?.value = () {
          if (widget!.waterFrequency?.scheme == FrequencySchemeEnum.EveryDay) {
            return 0;
          } else if (widget!.waterFrequency?.scheme ==
              FrequencySchemeEnum.EveryXDay) {
            return 1;
          } else if (widget!.waterFrequency?.scheme ==
              FrequencySchemeEnum.SpecificDayOfWeek) {
            return 2;
          } else {
            return 2;
          }
        }();
      });
    });

    _model.textController ??= TextEditingController(
        text: widget!.waterFrequency?.everyXDay?.toString());
    _model.textFieldFocusNode ??= FocusNode();
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
        height: 350.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                    ),
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'zp7w1b58' /* Частота поливу */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: FlutterFlowDropDown<int>(
                  controller: _model.wateringShemeDropdownValueController ??=
                      FormFieldController<int>(
                    _model.wateringShemeDropdownValue ??= 0,
                  ),
                  options: List<int>.from([0, 1, 2]),
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'd7k3ocwl' /* Кожного дня */,
                    ),
                    FFLocalizations.of(context).getText(
                      'sqa9k30b' /* Кожні Х днів */,
                    ),
                    FFLocalizations.of(context).getText(
                      'kr4hdvsc' /* Конкретний день тижня */,
                    )
                  ],
                  onChanged: (val) async {
                    safeSetState(() => _model.wateringShemeDropdownValue = val);
                    _model.updateFrequencyStruct(
                      (e) => e
                        ..scheme = () {
                          if (_model.wateringShemeDropdownValue == 0) {
                            return FrequencySchemeEnum.EveryDay;
                          } else if (_model.wateringShemeDropdownValue == 1) {
                            return FrequencySchemeEnum.EveryXDay;
                          } else {
                            return FrequencySchemeEnum.SpecificDayOfWeek;
                          }
                        }(),
                    );
                    safeSetState(() {});
                  },
                  width: 300.0,
                  height: 52.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'wkeqkgj1' /* Please select... */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 1.0,
                  borderRadius: 16.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Stack(
                children: [
                  if (_model.frequency?.scheme == FrequencySchemeEnum.EveryXDay)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.updateFrequencyStruct(
                                  (e) => e
                                    ..everyXDay = int.tryParse(
                                        _model.textController.text),
                                );
                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'pjagmstp' /* Введіть кількість днів */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.number,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  if (_model.frequency?.scheme ==
                      FrequencySchemeEnum.SpecificDayOfWeek)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'bnzce9nl' /* Оберіть необхідний день неділі */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('1'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(1),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(1),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '0738rh8j' /* Пн */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('1'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('1'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('2'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(2),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(2),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'aq3f815q' /* Вт */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('2'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('2'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('3'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(3),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(3),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '2qikkmdt' /* Ср */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('3'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('3'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('4'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(4),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(4),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '8o5f1hln' /* Чт */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('4'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('4'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('5'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(5),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(5),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'yjmd4lkl' /* Пт */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('5'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('5'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('6'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(6),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(6),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'z0j09h0p' /* Сб */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('6'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('6'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.frequency!.dayOfWeek
                                      .contains(functions.toInt('0'))) {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.remove(0),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else {
                                    _model.updateFrequencyStruct(
                                      (e) => e
                                        ..updateDayOfWeek(
                                          (e) => e.add(0),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'rgwtj8yg' /* Нд */,
                                ),
                                options: FFButtonOptions(
                                  width: 35.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.frequency!.dayOfWeek
                                          .contains(functions.toInt('0'))
                                      ? FlutterFlowTheme.of(context).plants
                                      : Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.frequency!.dayOfWeek
                                                .contains(functions.toInt('0'))
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.updateFrequencyStruct(
                      (e) => e
                        ..everyXDay = int.tryParse(_model.textController.text),
                    );
                    safeSetState(() {});
                    Navigator.pop(context, _model.frequency);
                  },
                  text: FFLocalizations.of(context).getText(
                    '7k7u0wbh' /* Обрати */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).plants,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
