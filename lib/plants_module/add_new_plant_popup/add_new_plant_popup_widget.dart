import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_new_plant_popup_model.dart';
export 'add_new_plant_popup_model.dart';

class AddNewPlantPopupWidget extends StatefulWidget {
  const AddNewPlantPopupWidget({
    super.key,
    this.plant,
  });

  final PlantsRecord? plant;

  @override
  State<AddNewPlantPopupWidget> createState() => _AddNewPlantPopupWidgetState();
}

class _AddNewPlantPopupWidgetState extends State<AddNewPlantPopupWidget> {
  late AddNewPlantPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewPlantPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.plant != null) {
        _model.img = widget!.plant?.photo;
        _model.wateringFrequency = widget!.plant?.wateringFrequency;
        _model.fertilizationFrequency = widget!.plant?.fertilizationFrequency;
        safeSetState(() {});
        safeSetState(() {
          _model.nameTextFieldTextController?.text = widget!.plant!.name;
        });
        safeSetState(() {
          _model.amountOfWaterTextFieldTextController?.text =
              widget!.plant!.amountOfWater.toString();
        });
        safeSetState(() {
          _model.lightingDropDownValueController?.value = () {
            if (widget!.plant?.lighting == PlantLightingEnum.shadow) {
              return 0;
            } else if (widget!.plant?.lighting ==
                PlantLightingEnum.diffusedLight) {
              return 1;
            } else if (widget!.plant?.lighting ==
                PlantLightingEnum.brightDiffusedLight) {
              return 2;
            } else if (widget!.plant?.lighting ==
                PlantLightingEnum.directDiffusedLight) {
              return 3;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.temperatureDropDownValueController?.value = () {
            if (widget!.plant?.temperature == PlantTemperatureEnum.from5to10) {
              return 0;
            } else if (widget!.plant?.temperature ==
                PlantTemperatureEnum.from10to15) {
              return 1;
            } else if (widget!.plant?.temperature ==
                PlantTemperatureEnum.from15to18) {
              return 2;
            } else if (widget!.plant?.temperature ==
                PlantTemperatureEnum.from18to20) {
              return 3;
            } else if (widget!.plant?.temperature ==
                PlantTemperatureEnum.from20to25) {
              return 4;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.solidChangeDropDownValueController?.value = () {
            if (widget!.plant?.solidChangeFrequency?.frequency ==
                FrequencySolidChangeEnum.onceAYear) {
              return 0;
            } else if (widget!.plant?.solidChangeFrequency?.frequency ==
                FrequencySolidChangeEnum.onceEveryTwoYears) {
              return 1;
            } else if (widget!.plant?.solidChangeFrequency?.frequency ==
                FrequencySolidChangeEnum.onceEveryThreeYears) {
              return 2;
            } else {
              return 0;
            }
          }();
        });
        safeSetState(() {
          _model.wateringShemeDropdownValueController?.value = () {
            if (widget!.plant?.wateringFrequency?.scheme ==
                FrequencySchemeEnum.EveryDay) {
              return 0;
            } else if (widget!.plant?.wateringFrequency?.scheme ==
                FrequencySchemeEnum.EveryXDay) {
              return 1;
            } else if (widget!.plant?.wateringFrequency?.scheme ==
                FrequencySchemeEnum.SpecificDayOfWeek) {
              return 2;
            } else {
              return 0;
            }
          }();
        });
        if (widget!.plant?.wateringFrequency?.scheme ==
            FrequencySchemeEnum.EveryXDay) {
          safeSetState(() {
            _model.wateringEveryDaysTextFieldTextController?.text =
                widget!.plant!.wateringFrequency.everyXDay.toString();
          });
        }
        safeSetState(() {
          _model.fertilizationDaysTextFieldTextController?.text =
              widget!.plant!.fertilizationFrequency.everyXDay.toString();
        });
      } else {
        _model.fertilizationFrequency = FertilizationFrequencyStruct(
          lastFertilization: functions.getDateOnly(getCurrentTimestamp),
        );
        _model.wateringFrequency = WateringFrequencyStruct(
          scheme: FrequencySchemeEnum.EveryDay,
          lastDate: functions.getDateOnly(getCurrentTimestamp),
        );
        safeSetState(() {});
      }
    });

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.amountOfWaterTextFieldTextController ??= TextEditingController();
    _model.amountOfWaterTextFieldFocusNode ??= FocusNode();

    _model.wateringEveryDaysTextFieldTextController ??= TextEditingController();
    _model.wateringEveryDaysTextFieldFocusNode ??= FocusNode();

    _model.fertilizationDaysTextFieldTextController ??= TextEditingController();
    _model.fertilizationDaysTextFieldFocusNode ??= FocusNode();
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
      child: InkWell(
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
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
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 60.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        decoration: BoxDecoration(),
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
                                              await widget!.plant!.reference
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
                                      Expanded(
                                        child: Text(
                                          widget!.plant != null
                                              ? 'Відредагуйте рослину'
                                              : 'Додайте нову рослину',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
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
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 12.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_model.uploadedFileUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl !=
                                                        '') {
                                                  _model.img =
                                                      _model.uploadedFileUrl;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: 120.0,
                                                height: 100.0,
                                                child: Stack(
                                                  children: [
                                                    if (_model.img == null ||
                                                        _model.img == '')
                                                      Container(
                                                        width: 120.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: Image.asset(
                                                              'assets/images/pngaaa.com-791768.png',
                                                            ).image,
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.img != null &&
                                                        _model.img != '')
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          _model.img!,
                                                          width: 120.0,
                                                          height: 100.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
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
                                                'gvzk7tdu' /* Назва */,
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .nameTextFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .amountOfWaterTextFieldTextController,
                                            focusNode: _model
                                                .amountOfWaterTextFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'pm9zoeyp' /* Кількість води */,
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .amountOfWaterTextFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 30.0,
                                            endIndent: 30.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .wateringShemeDropdownValueController ??=
                                                FormFieldController<int>(
                                              _model.wateringShemeDropdownValue ??=
                                                  0,
                                            ),
                                            options: List<int>.from([0, 1, 2]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ncmftx1c' /* Кожного дня */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ocb9ir7l' /* Повторювати через */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pr2agijx' /* Конкретні дні неділі */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .wateringShemeDropdownValue =
                                                  val);
                                              _model
                                                  .updateWateringFrequencyStruct(
                                                (e) => e
                                                  ..scheme = () {
                                                    if (_model
                                                            .wateringShemeDropdownValue ==
                                                        0) {
                                                      return FrequencySchemeEnum
                                                          .EveryDay;
                                                    } else if (_model
                                                            .wateringShemeDropdownValue ==
                                                        1) {
                                                      return FrequencySchemeEnum
                                                          .EveryXDay;
                                                    } else if (_model
                                                            .wateringShemeDropdownValue ==
                                                        2) {
                                                      return FrequencySchemeEnum
                                                          .SpecificDayOfWeek;
                                                    } else {
                                                      return FrequencySchemeEnum
                                                          .EveryDay;
                                                    }
                                                  }(),
                                              );
                                              safeSetState(() {});
                                            },
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
                                              'ddcdhnif' /* Please select... */,
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
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'nsv0ne01' /* Частота поливу */,
                                            ),
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                          if (_model
                                                  .wateringFrequency?.scheme ==
                                              FrequencySchemeEnum.EveryXDay)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .wateringEveryDaysTextFieldTextController,
                                                focusNode: _model
                                                    .wateringEveryDaysTextFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.wateringEveryDaysTextFieldTextController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    _model
                                                        .updateWateringFrequencyStruct(
                                                      (e) => e
                                                        ..everyXDay =
                                                            int.tryParse(_model
                                                                .wateringEveryDaysTextFieldTextController
                                                                .text),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'sot48n9r' /* Введіть кількість днів */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .wateringEveryDaysTextFieldTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          if (_model
                                                  .wateringFrequency?.scheme ==
                                              FrequencySchemeEnum
                                                  .SpecificDayOfWeek)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: _model
                                                        .wateringFrequency
                                                        ?.scheme ==
                                                    FrequencySchemeEnum
                                                        .SpecificDayOfWeek,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
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
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6zrf53h4' /* Оберіть необхідні дні */,
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
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '1'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(1),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(1),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'bkz6e2u6' /* Пн */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '1'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('1'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '2'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(2),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(2),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'th35yak3' /* Вт */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '2'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('2'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '3'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(3),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(3),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'rbj1h0a1' /* Ср */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '3'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('3'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '4'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(4),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(4),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'p553lgar' /* Чт */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '4'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('4'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '5'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(5),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(5),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'r3xld6ld' /* Пт */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '5'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('5'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '6'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(6),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(6),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'xyrti9s4' /* Сб */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '6'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('6'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .wateringFrequency!
                                                                    .dayOfWeek
                                                                    .contains(functions
                                                                        .toInt(
                                                                            '0'))) {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .remove(0),
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateWateringFrequencyStruct(
                                                                    (e) => e
                                                                      ..updateDayOfWeek(
                                                                        (e) => e
                                                                            .add(0),
                                                                      ),
                                                                  );
                                                                  _model.wateringWeekDaySelectorError =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'sod1kkz2' /* Нд */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                color: _model
                                                                        .wateringFrequency!
                                                                        .dayOfWeek
                                                                        .contains(functions.toInt(
                                                                            '0'))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0x00000000),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model
                                                                              .wateringFrequency!
                                                                              .dayOfWeek
                                                                              .contains(functions.toInt('0'))
                                                                          ? FlutterFlowTheme.of(context).secondaryBackground
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                          .wateringWeekDaySelectorError
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (_model
                                                          .wateringWeekDaySelectorError)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
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
                                                                'fm5ifrd3' /* Вами не обрано жодного дня */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 30.0,
                                            endIndent: 30.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .fertilizationDaysTextFieldTextController,
                                                  focusNode: _model
                                                      .fertilizationDaysTextFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.fertilizationDaysTextFieldTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      _model
                                                          .updateFertilizationFrequencyStruct(
                                                        (e) => e
                                                          ..everyXDay = int
                                                              .tryParse(_model
                                                                  .fertilizationDaysTextFieldTextController
                                                                  .text),
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'uq6li9q0' /* Підживлювати через (дні) */,
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
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .fertilizationDaysTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: 18.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                icon: Icon(
                                                  Icons.question_mark_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'В даному полі ви вказуєте кількість днів, через яку будете повторно підживлювати рослину'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 30.0,
                                            endIndent: 30.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .lightingDropDownValueController ??=
                                                FormFieldController<int>(
                                              _model.lightingDropDownValue ??=
                                                  0,
                                            ),
                                            options:
                                                List<int>.from([0, 1, 2, 3, 4]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0nzhrsed' /* Тінь */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'p4cjune3' /* Розсіяне світло */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                's9j8ygut' /* Яскраве розсіяне світло */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ax884523' /* Пряме яскраве світло */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zsee6ps3' /*  */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .lightingDropDownValue =
                                                    val),
                                            height: 52.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '4oms8e44' /* Освітлення */,
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
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'zx8ezj22' /* Освітлення */,
                                            ),
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .temperatureDropDownValueController ??=
                                                FormFieldController<int>(
                                              _model.temperatureDropDownValue ??=
                                                  0,
                                            ),
                                            options: List<int>.from(
                                                [0, 1, 2, 3, 4, 5]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '39dropzj' /* 5-10°C */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w0cnzdff' /* 10-15°C */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'enxyvohv' /* 15-18°C */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '31pqivcj' /* 18-20°C */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6xxmyc9c' /* 20-25°C */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'p28llj5c' /*  */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(() =>
                                                _model.temperatureDropDownValue =
                                                    val),
                                            height: 52.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ara75qvv' /* Температура */,
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
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'anbe8a18' /* Тепература */,
                                            ),
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .solidChangeDropDownValueController ??=
                                                FormFieldController<int>(
                                              _model.solidChangeDropDownValue ??=
                                                  0,
                                            ),
                                            options: List<int>.from([0, 1, 2]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'il2pnskm' /* Раз на рік */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uxwdikb6' /* Раз на два роки */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'y524vboz' /* Раз на три роки */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(() =>
                                                _model.solidChangeDropDownValue =
                                                    val),
                                            height: 52.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'e6s8lby7' /* Заміна грунту */,
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
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'y08lxz97' /* Заміна ґрунту */,
                                            ),
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        _model.wateringWeekDaySelectorError =
                                            false;
                                        safeSetState(() {});
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.wateringFrequency?.dayOfWeek
                                                ?.length ==
                                            0) {
                                          _model.wateringWeekDaySelectorError =
                                              true;
                                          safeSetState(() {});
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (widget!.plant != null) {
                                          await widget!.plant!.reference
                                              .update(createPlantsRecordData(
                                            photo: _model.img,
                                            name: _model
                                                .nameTextFieldTextController
                                                .text,
                                            amountOfWater: int.tryParse(_model
                                                .amountOfWaterTextFieldTextController
                                                .text),
                                            wateringFrequency:
                                                updateWateringFrequencyStruct(
                                              _model.wateringFrequency,
                                              clearUnsetFields: false,
                                            ),
                                            solidChangeFrequency:
                                                updateSolidChangeFrequencyStruct(
                                              SolidChangeFrequencyStruct(
                                                frequency: () {
                                                  if (_model
                                                          .solidChangeDropDownValue ==
                                                      0) {
                                                    return FrequencySolidChangeEnum
                                                        .onceAYear;
                                                  } else if (_model
                                                          .solidChangeDropDownValue ==
                                                      1) {
                                                    return FrequencySolidChangeEnum
                                                        .onceEveryTwoYears;
                                                  } else {
                                                    return FrequencySolidChangeEnum
                                                        .onceEveryThreeYears;
                                                  }
                                                }(),
                                                lastChange: widget!
                                                    .plant
                                                    ?.solidChangeFrequency
                                                    ?.lastChange,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            fertilizationFrequency:
                                                updateFertilizationFrequencyStruct(
                                              _model.fertilizationFrequency,
                                              clearUnsetFields: false,
                                            ),
                                            lighting: () {
                                              if (_model
                                                      .lightingDropDownValue ==
                                                  0) {
                                                return PlantLightingEnum.shadow;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  1) {
                                                return PlantLightingEnum
                                                    .diffusedLight;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  2) {
                                                return PlantLightingEnum
                                                    .brightDiffusedLight;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  3) {
                                                return PlantLightingEnum
                                                    .directDiffusedLight;
                                              } else {
                                                return PlantLightingEnum.shadow;
                                              }
                                            }(),
                                            temperature: () {
                                              if (_model
                                                      .temperatureDropDownValue ==
                                                  0) {
                                                return PlantTemperatureEnum
                                                    .from5to10;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  1) {
                                                return PlantTemperatureEnum
                                                    .from10to15;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  2) {
                                                return PlantTemperatureEnum
                                                    .from15to18;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  3) {
                                                return PlantTemperatureEnum
                                                    .from18to20;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  4) {
                                                return PlantTemperatureEnum
                                                    .from20to25;
                                              } else {
                                                return PlantTemperatureEnum
                                                    .from5to10;
                                              }
                                            }(),
                                          ));
                                        } else {
                                          var plantsRecordReference =
                                              PlantsRecord.createDoc(
                                                  FFAppState().currentUserRef!);
                                          await plantsRecordReference
                                              .set(createPlantsRecordData(
                                            photo: _model.img,
                                            name: _model
                                                .nameTextFieldTextController
                                                .text,
                                            amountOfWater: int.tryParse(_model
                                                .amountOfWaterTextFieldTextController
                                                .text),
                                            lighting: () {
                                              if (_model
                                                      .lightingDropDownValue ==
                                                  0) {
                                                return PlantLightingEnum.shadow;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  1) {
                                                return PlantLightingEnum
                                                    .diffusedLight;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  2) {
                                                return PlantLightingEnum
                                                    .brightDiffusedLight;
                                              } else if (_model
                                                      .lightingDropDownValue ==
                                                  3) {
                                                return PlantLightingEnum
                                                    .directDiffusedLight;
                                              } else {
                                                return PlantLightingEnum.shadow;
                                              }
                                            }(),
                                            temperature: () {
                                              if (_model
                                                      .temperatureDropDownValue ==
                                                  0) {
                                                return PlantTemperatureEnum
                                                    .from5to10;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  1) {
                                                return PlantTemperatureEnum
                                                    .from10to15;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  2) {
                                                return PlantTemperatureEnum
                                                    .from15to18;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  3) {
                                                return PlantTemperatureEnum
                                                    .from18to20;
                                              } else if (_model
                                                      .temperatureDropDownValue ==
                                                  4) {
                                                return PlantTemperatureEnum
                                                    .from20to25;
                                              } else {
                                                return PlantTemperatureEnum
                                                    .from5to10;
                                              }
                                            }(),
                                            wateringFrequency:
                                                updateWateringFrequencyStruct(
                                              _model.wateringFrequency,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            solidChangeFrequency:
                                                createSolidChangeFrequencyStruct(
                                              frequency: () {
                                                if (_model
                                                        .solidChangeDropDownValue ==
                                                    0) {
                                                  return FrequencySolidChangeEnum
                                                      .onceAYear;
                                                } else if (_model
                                                        .solidChangeDropDownValue ==
                                                    1) {
                                                  return FrequencySolidChangeEnum
                                                      .onceEveryTwoYears;
                                                } else {
                                                  return FrequencySolidChangeEnum
                                                      .onceEveryThreeYears;
                                                }
                                              }(),
                                              lastChange: functions.getDateOnly(
                                                  getCurrentTimestamp),
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            fertilizationFrequency:
                                                updateFertilizationFrequencyStruct(
                                              _model.fertilizationFrequency,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                          ));
                                          _model.newPlant =
                                              PlantsRecord.getDocumentFromData(
                                                  createPlantsRecordData(
                                                    photo: _model.img,
                                                    name: _model
                                                        .nameTextFieldTextController
                                                        .text,
                                                    amountOfWater: int.tryParse(
                                                        _model
                                                            .amountOfWaterTextFieldTextController
                                                            .text),
                                                    lighting: () {
                                                      if (_model
                                                              .lightingDropDownValue ==
                                                          0) {
                                                        return PlantLightingEnum
                                                            .shadow;
                                                      } else if (_model
                                                              .lightingDropDownValue ==
                                                          1) {
                                                        return PlantLightingEnum
                                                            .diffusedLight;
                                                      } else if (_model
                                                              .lightingDropDownValue ==
                                                          2) {
                                                        return PlantLightingEnum
                                                            .brightDiffusedLight;
                                                      } else if (_model
                                                              .lightingDropDownValue ==
                                                          3) {
                                                        return PlantLightingEnum
                                                            .directDiffusedLight;
                                                      } else {
                                                        return PlantLightingEnum
                                                            .shadow;
                                                      }
                                                    }(),
                                                    temperature: () {
                                                      if (_model
                                                              .temperatureDropDownValue ==
                                                          0) {
                                                        return PlantTemperatureEnum
                                                            .from5to10;
                                                      } else if (_model
                                                              .temperatureDropDownValue ==
                                                          1) {
                                                        return PlantTemperatureEnum
                                                            .from10to15;
                                                      } else if (_model
                                                              .temperatureDropDownValue ==
                                                          2) {
                                                        return PlantTemperatureEnum
                                                            .from15to18;
                                                      } else if (_model
                                                              .temperatureDropDownValue ==
                                                          3) {
                                                        return PlantTemperatureEnum
                                                            .from18to20;
                                                      } else if (_model
                                                              .temperatureDropDownValue ==
                                                          4) {
                                                        return PlantTemperatureEnum
                                                            .from20to25;
                                                      } else {
                                                        return PlantTemperatureEnum
                                                            .from5to10;
                                                      }
                                                    }(),
                                                    wateringFrequency:
                                                        updateWateringFrequencyStruct(
                                                      _model.wateringFrequency,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    solidChangeFrequency:
                                                        createSolidChangeFrequencyStruct(
                                                      frequency: () {
                                                        if (_model
                                                                .solidChangeDropDownValue ==
                                                            0) {
                                                          return FrequencySolidChangeEnum
                                                              .onceAYear;
                                                        } else if (_model
                                                                .solidChangeDropDownValue ==
                                                            1) {
                                                          return FrequencySolidChangeEnum
                                                              .onceEveryTwoYears;
                                                        } else {
                                                          return FrequencySolidChangeEnum
                                                              .onceEveryThreeYears;
                                                        }
                                                      }(),
                                                      lastChange:
                                                          functions.getDateOnly(
                                                              getCurrentTimestamp),
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    fertilizationFrequency:
                                                        updateFertilizationFrequencyStruct(
                                                      _model
                                                          .fertilizationFrequency,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                  ),
                                                  plantsRecordReference);
                                          _shouldSetState = true;
                                        }

                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'tqruerss' /* Зберегти */,
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
                                          '8flu07m0' /* Скасувати */,
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
