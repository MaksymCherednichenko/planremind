import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_pets_event_popup_model.dart';
export 'add_pets_event_popup_model.dart';

class AddPetsEventPopupWidget extends StatefulWidget {
  const AddPetsEventPopupWidget({
    super.key,
    this.petEvent,
  });

  final PetsEventRecord? petEvent;

  @override
  State<AddPetsEventPopupWidget> createState() =>
      _AddPetsEventPopupWidgetState();
}

class _AddPetsEventPopupWidgetState extends State<AddPetsEventPopupWidget> {
  late AddPetsEventPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPetsEventPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.petEvent != null) {
        safeSetState(() {
          _model.eventTypeDropDownValueController?.value = () {
            if (widget!.petEvent?.frequencyType == EventTypeEnum.regular) {
              return 0;
            } else if (widget!.petEvent?.frequencyType ==
                EventTypeEnum.onetime) {
              return 1;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.eventSelectDropDownValueController?.value = () {
            if (widget!.petEvent?.eventType == PetsEventsEnum.vetvisit) {
              return 0;
            } else if (widget!.petEvent?.eventType == PetsEventsEnum.grooming) {
              return 1;
            } else if (widget!.petEvent?.eventType == PetsEventsEnum.shoping) {
              return 2;
            } else if (widget!.petEvent?.eventType ==
                PetsEventsEnum.vaccination) {
              return 3;
            } else if (widget!.petEvent?.eventType ==
                PetsEventsEnum.antiparaciticmedication) {
              return 4;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.frequencyTextFieldTextController?.text =
              widget!.petEvent!.repeat.toString();
        });
        safeSetState(() {
          _model.dateTypeDropDownValueController?.value = () {
            if (widget!.petEvent?.dateType == DateTypesEnum.day) {
              return 0;
            } else if (widget!.petEvent?.dateType == DateTypesEnum.week) {
              return 1;
            } else if (widget!.petEvent?.dateType == DateTypesEnum.month) {
              return 2;
            } else if (widget!.petEvent?.dateType == DateTypesEnum.year) {
              return 3;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.timeTextFieldTextController?.text = dateTimeFormat(
            "d/M/y H:mm",
            widget!.petEvent!.date!,
            locale: FFLocalizations.of(context).languageCode,
          );
        });
        safeSetState(() {
          _model.doseDropDownValueController?.value = () {
            if (widget!.petEvent?.doseType == MedicationDoseEnum.pill) {
              return '0';
            } else if (widget!.petEvent?.doseType == MedicationDoseEnum.ml) {
              return '1';
            } else if (widget!.petEvent?.doseType == MedicationDoseEnum.mg) {
              return '2';
            } else {
              return '0';
            }
          }();
        });
        safeSetState(() {
          _model.doseTextFieldTextController?.text =
              widget!.petEvent!.dose.toString();
        });
        _model.selectedPet = widget!.petEvent?.pet;
        safeSetState(() {});
        safeSetState(() {
          _model.vetAddressTextFieldTextController?.text =
              widget!.petEvent!.address;
        });
        safeSetState(() {
          _model.vetDoctorTextFieldTextController?.text =
              widget!.petEvent!.person;
        });
        safeSetState(() {
          _model.groomingAddressTextFieldTextController?.text =
              widget!.petEvent!.address;
        });
        safeSetState(() {
          _model.groomingMasterTextFieldTextController?.text =
              widget!.petEvent!.person;
        });
        safeSetState(() {
          _model.shopNameTextFieldTextController?.text =
              widget!.petEvent!.address;
        });
        safeSetState(() {
          _model.productTextFieldTextController?.text = widget!.petEvent!.name;
        });
        safeSetState(() {
          _model.vaccinationClinicAddressTextFieldTextController?.text =
              widget!.petEvent!.address;
        });
        safeSetState(() {
          _model.vaccinationDoctorTextFieldTextController?.text =
              widget!.petEvent!.person;
        });
      }
    });

    _model.vetAddressTextFieldTextController ??= TextEditingController();
    _model.vetAddressTextFieldFocusNode ??= FocusNode();

    _model.vetDoctorTextFieldTextController ??= TextEditingController();
    _model.vetDoctorTextFieldFocusNode ??= FocusNode();

    _model.groomingAddressTextFieldTextController ??= TextEditingController();
    _model.groomingAddressTextFieldFocusNode ??= FocusNode();

    _model.groomingMasterTextFieldTextController ??= TextEditingController();
    _model.groomingMasterTextFieldFocusNode ??= FocusNode();

    _model.shopNameTextFieldTextController ??= TextEditingController();
    _model.shopNameTextFieldFocusNode ??= FocusNode();

    _model.productTextFieldTextController ??= TextEditingController();
    _model.productTextFieldFocusNode ??= FocusNode();

    _model.vaccinationClinicAddressTextFieldTextController ??=
        TextEditingController();
    _model.vaccinationClinicAddressTextFieldFocusNode ??= FocusNode();

    _model.vaccinationDoctorTextFieldTextController ??= TextEditingController();
    _model.vaccinationDoctorTextFieldFocusNode ??= FocusNode();

    _model.medicationTextFieldTextController ??= TextEditingController();
    _model.medicationTextFieldFocusNode ??= FocusNode();

    _model.doseTextFieldTextController ??= TextEditingController();
    _model.doseTextFieldFocusNode ??= FocusNode();

    _model.timeTextFieldTextController ??= TextEditingController();
    _model.timeTextFieldFocusNode ??= FocusNode();

    _model.frequencyTextFieldTextController ??= TextEditingController();
    _model.frequencyTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                                  0.0, 0.0, 0.0, 24.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: widget!.petEvent != null,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
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
                                            await widget!.petEvent!.reference
                                                .delete();
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget!.petEvent != null
                                        ? 'Редагувати запис'
                                        : 'Новий запис',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
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
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FlutterFlowDropDown<int>(
                                    controller: _model
                                            .eventTypeDropDownValueController ??=
                                        FormFieldController<int>(
                                      _model.eventTypeDropDownValue ??= 0,
                                    ),
                                    options: List<int>.from([0, 1]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'y9rdt4od' /* Регулярна подія */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'art4ondh' /* Одноразова подія */,
                                      )
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.eventTypeDropDownValue = val),
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '5re7wy2b' /* Оберіть тип події */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 16.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  FlutterFlowDropDown<int>(
                                    controller: _model
                                            .eventSelectDropDownValueController ??=
                                        FormFieldController<int>(
                                      _model.eventSelectDropDownValue ??= 0,
                                    ),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'n14piiz5' /* Похід до ветеринара */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vker2l1d' /* Грумінг */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'lxz7q9bx' /* Шопінг */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'qqqe82k9' /* Вакцинація */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'tcaoh5ha' /* Прийом таблеток */,
                                      )
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.eventSelectDropDownValue = val),
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'l9dqi0ho' /* Оберіть подію */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 16.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  Stack(
                                    children: [
                                      if (_model.eventSelectDropDownValue == 0)
                                        Form(
                                          key: _model.formKey7,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .vetAddressTextFieldTextController,
                                                  focusNode: _model
                                                      .vetAddressTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'ew1luopd' /* Адреса */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .vetAddressTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .vetDoctorTextFieldTextController,
                                                  focusNode: _model
                                                      .vetDoctorTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'gsp0knm7' /* Лікар */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .vetDoctorTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.eventSelectDropDownValue == 1)
                                        Form(
                                          key: _model.formKey8,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .groomingAddressTextFieldTextController,
                                                  focusNode: _model
                                                      .groomingAddressTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '61912dxp' /* Адреса */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .groomingAddressTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .groomingMasterTextFieldTextController,
                                                  focusNode: _model
                                                      .groomingMasterTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '46h6p9me' /* Майстер */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .groomingMasterTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.eventSelectDropDownValue == 2)
                                        Form(
                                          key: _model.formKey3,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .shopNameTextFieldTextController,
                                                  focusNode: _model
                                                      .shopNameTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '8dgg7i94' /* Магазин */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .shopNameTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .productTextFieldTextController,
                                                  focusNode: _model
                                                      .productTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'ugink8ql' /* Товар */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .productTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.eventSelectDropDownValue == 3)
                                        Form(
                                          key: _model.formKey4,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .vaccinationClinicAddressTextFieldTextController,
                                                  focusNode: _model
                                                      .vaccinationClinicAddressTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'w8dynh89' /* Адреса лікарні */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .vaccinationClinicAddressTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .vaccinationDoctorTextFieldTextController,
                                                  focusNode: _model
                                                      .vaccinationDoctorTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'ivy2nshj' /* Лікар */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .vaccinationDoctorTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.eventSelectDropDownValue == 4)
                                        Form(
                                          key: _model.formKey2,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .medicationTextFieldTextController,
                                                  focusNode: _model
                                                      .medicationTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xkorc210' /* Препарат */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .medicationTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .doseTextFieldTextController,
                                                      focusNode: _model
                                                          .doseTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '96wgrxba' /* Доза */,
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
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'u4i5vnfh' /* Pill */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'sqonf09f' /* Ml */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'h30kgu5y' /* Mg */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .doseDropDownValue =
                                                            val),
                                                    width: 80.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'nwhf1q7b' /* Select... */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  Form(
                                    key: _model.formKey6,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        TextFormField(
                                          controller: _model
                                              .timeTextFieldTextController,
                                          focusNode:
                                              _model.timeTextFieldFocusNode,
                                          autofocus: false,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'r12ogxrs' /* Час і дата прийому */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            suffixIcon: Icon(
                                              Icons.access_time_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .timeTextFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
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
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
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
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            TimeOfDay? _datePickedTime;
                                            if (_datePickedDate != null) {
                                              _datePickedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(
                                                        getCurrentTimestamp),
                                                builder: (context, child) {
                                                  return wrapInMaterialTimePickerTheme(
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
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );
                                            }

                                            if (_datePickedDate != null &&
                                                _datePickedTime != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                  _datePickedTime!.hour,
                                                  _datePickedTime.minute,
                                                );
                                              });
                                            }
                                            safeSetState(() {
                                              _model.timeTextFieldTextController
                                                  ?.text = dateTimeFormat(
                                                "d/M/y H:mm",
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_model.eventTypeDropDownValue == 0)
                                    Form(
                                      key: _model.formKey5,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model
                                                  .frequencyTextFieldTextController,
                                              focusNode: _model
                                                  .frequencyTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'jlnjvt53' /* Повторювати через */,
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
                                                          fontSize: 15.0,
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
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .frequencyTextFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .dateTypeDropDownValueController ??=
                                                FormFieldController<int>(
                                              _model.dateTypeDropDownValue ??=
                                                  0,
                                            ),
                                            options:
                                                List<int>.from([0, 1, 2, 3, 4]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wpknaugj' /* день */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5es4xvnp' /* тиждень */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3aw7zo22' /* місяць */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f6nd8n8e' /* рік */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'oe5ii45v' /*  */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .dateTypeDropDownValue =
                                                    val),
                                            width: 130.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '4jz48n7i' /* Оберіть улюбленця */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 1.0,
                                            borderRadius: 16.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: StreamBuilder<List<PetsRecord>>(
                                      stream: queryPetsRecord(
                                        parent: FFAppState().currentUserRef,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF57F44),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<PetsRecord>
                                            petDropDownPetsRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .petDropDownValueController ??=
                                              FormFieldController<String>(
                                            _model.petDropDownValue ??=
                                                widget!.petEvent != null
                                                    ? petDropDownPetsRecordList
                                                        .where((e) =>
                                                            e.reference ==
                                                            widget!
                                                                .petEvent?.pet)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.name
                                                    : null,
                                          ),
                                          options: petDropDownPetsRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.petDropDownValue = val);
                                            _model.selectedPet =
                                                petDropDownPetsRecordList
                                                    .where((e) =>
                                                        e.name ==
                                                        _model.petDropDownValue)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.reference;
                                            safeSetState(() {});
                                          },
                                          height: 56.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'lro5k15d' /* Оберіть улюбленця */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 1.0,
                                          borderRadius: 16.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 15.0)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey1.currentState == null ||
                                        !_model.formKey1.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.petDropDownValue == null) {
                                      return;
                                    }
                                    if (_model.eventSelectDropDownValue == 0) {
                                      if (_model.formKey7.currentState ==
                                              null ||
                                          !_model.formKey7.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                    if (_model.eventSelectDropDownValue == 1) {
                                      if (_model.formKey8.currentState ==
                                              null ||
                                          !_model.formKey8.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                    if (_model.eventSelectDropDownValue == 2) {
                                      if (_model.formKey3.currentState ==
                                              null ||
                                          !_model.formKey3.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                    if (_model.eventSelectDropDownValue == 3) {
                                      if (_model.formKey4.currentState ==
                                              null ||
                                          !_model.formKey4.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                    if (_model.eventSelectDropDownValue == 4) {
                                      if (_model.formKey2.currentState ==
                                              null ||
                                          !_model.formKey2.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.doseDropDownValue == null) {
                                        return;
                                      }
                                    }
                                    if (_model.formKey6.currentState == null ||
                                        !_model.formKey6.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.eventTypeDropDownValue == 0) {
                                      if (_model.formKey5.currentState ==
                                              null ||
                                          !_model.formKey5.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    }
                                    if (widget!.petEvent != null) {
                                      await widget!.petEvent!.reference
                                          .update(createPetsEventRecordData(
                                        frequencyType:
                                            _model.eventTypeDropDownValue == 0
                                                ? EventTypeEnum.regular
                                                : EventTypeEnum.onetime,
                                        pet: _model.selectedPet,
                                        eventType: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return PetsEventsEnum.vetvisit;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return PetsEventsEnum.grooming;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return PetsEventsEnum.shoping;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return PetsEventsEnum.vaccination;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return PetsEventsEnum
                                                .antiparaciticmedication;
                                          } else {
                                            return PetsEventsEnum.vetvisit;
                                          }
                                        }(),
                                        address: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return _model
                                                .vetAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return _model
                                                .groomingAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return _model
                                                .shopNameTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return _model
                                                .vaccinationClinicAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return ' ';
                                          } else {
                                            return 'none';
                                          }
                                        }(),
                                        person: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return _model
                                                .vetDoctorTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return _model
                                                .groomingMasterTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return ' ';
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return _model
                                                .vaccinationDoctorTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return ' ';
                                          } else {
                                            return ' ';
                                          }
                                        }(),
                                        name: () {
                                          if (_model.eventSelectDropDownValue ==
                                              4) {
                                            return _model
                                                .medicationTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return _model
                                                .productTextFieldTextController
                                                .text;
                                          } else {
                                            return ' ';
                                          }
                                        }(),
                                        dose:
                                            _model.eventSelectDropDownValue == 4
                                                ? int.tryParse(_model
                                                    .doseTextFieldTextController
                                                    .text)
                                                : 0,
                                        doseType: () {
                                          if (_model.doseDropDownValue == '0') {
                                            return MedicationDoseEnum.pill;
                                          } else if (_model.doseDropDownValue ==
                                              '1') {
                                            return MedicationDoseEnum.ml;
                                          } else if (_model.doseDropDownValue ==
                                              '2') {
                                            return MedicationDoseEnum.mg;
                                          } else {
                                            return MedicationDoseEnum.pill;
                                          }
                                        }(),
                                        date: _model.datePicked != null
                                            ? _model.datePicked
                                            : widget!.petEvent?.date,
                                        repeat: _model.eventTypeDropDownValue ==
                                                0
                                            ? int.tryParse(_model
                                                .frequencyTextFieldTextController
                                                .text)
                                            : 0,
                                        dateType: () {
                                          if (_model.dateTypeDropDownValue ==
                                              0) {
                                            return DateTypesEnum.day;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              1) {
                                            return DateTypesEnum.week;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              2) {
                                            return DateTypesEnum.month;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              3) {
                                            return DateTypesEnum.year;
                                          } else {
                                            return DateTypesEnum.day;
                                          }
                                        }(),
                                      ));
                                    } else {
                                      await PetsEventRecord.createDoc(
                                              FFAppState().currentUserRef!)
                                          .set(createPetsEventRecordData(
                                        frequencyType:
                                            _model.eventTypeDropDownValue == 0
                                                ? EventTypeEnum.regular
                                                : EventTypeEnum.onetime,
                                        pet: _model.selectedPet,
                                        eventType: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return PetsEventsEnum.vetvisit;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return PetsEventsEnum.grooming;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return PetsEventsEnum.shoping;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return PetsEventsEnum.vaccination;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return PetsEventsEnum
                                                .antiparaciticmedication;
                                          } else {
                                            return PetsEventsEnum.vetvisit;
                                          }
                                        }(),
                                        address: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return _model
                                                .vetAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return _model
                                                .groomingAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return _model
                                                .shopNameTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return _model
                                                .vaccinationClinicAddressTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return ' ';
                                          } else {
                                            return 'none';
                                          }
                                        }(),
                                        person: () {
                                          if (_model.eventSelectDropDownValue ==
                                              0) {
                                            return _model
                                                .vetDoctorTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              1) {
                                            return _model
                                                .groomingMasterTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return ' ';
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              3) {
                                            return _model
                                                .vaccinationDoctorTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              4) {
                                            return ' ';
                                          } else {
                                            return ' ';
                                          }
                                        }(),
                                        dose:
                                            _model.eventSelectDropDownValue == 4
                                                ? int.tryParse(_model
                                                    .doseTextFieldTextController
                                                    .text)
                                                : 0,
                                        doseType: () {
                                          if (_model.doseDropDownValue == '0') {
                                            return MedicationDoseEnum.pill;
                                          } else if (_model.doseDropDownValue ==
                                              '1') {
                                            return MedicationDoseEnum.ml;
                                          } else if (_model.doseDropDownValue ==
                                              '2') {
                                            return MedicationDoseEnum.mg;
                                          } else {
                                            return MedicationDoseEnum.pill;
                                          }
                                        }(),
                                        date: _model.datePicked,
                                        repeat: _model.eventTypeDropDownValue ==
                                                0
                                            ? int.tryParse(_model
                                                .frequencyTextFieldTextController
                                                .text)
                                            : 0,
                                        dateType: () {
                                          if (_model.dateTypeDropDownValue ==
                                              0) {
                                            return DateTypesEnum.day;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              1) {
                                            return DateTypesEnum.week;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              2) {
                                            return DateTypesEnum.month;
                                          } else if (_model
                                                  .dateTypeDropDownValue ==
                                              3) {
                                            return DateTypesEnum.year;
                                          } else {
                                            return DateTypesEnum.day;
                                          }
                                        }(),
                                        name: () {
                                          if (_model.eventSelectDropDownValue ==
                                              4) {
                                            return _model
                                                .medicationTextFieldTextController
                                                .text;
                                          } else if (_model
                                                  .eventSelectDropDownValue ==
                                              2) {
                                            return _model
                                                .productTextFieldTextController
                                                .text;
                                          } else {
                                            return ' ';
                                          }
                                        }(),
                                      ));
                                    }

                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'm3rh6fx2' /* Зберегти */,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 54.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).success,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
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
                                    'i1l3qbhk' /* Скасувати */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
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
            ],
          ),
        ),
      ),
    );
  }
}
