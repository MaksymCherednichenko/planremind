import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_storage_stuff_model.dart';
export 'add_storage_stuff_model.dart';

class AddStorageStuffWidget extends StatefulWidget {
  const AddStorageStuffWidget({
    super.key,
    this.stuff,
    this.stuffType,
  });

  final StaffStorageRecord? stuff;
  final HomeStuffEnum? stuffType;

  @override
  State<AddStorageStuffWidget> createState() => _AddStorageStuffWidgetState();
}

class _AddStorageStuffWidgetState extends State<AddStorageStuffWidget> {
  late AddStorageStuffModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStorageStuffModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
      //
      //
      _model.unitDropdownLabelList = [];
      if (FFAppState().unitSystem == UnitSystemsEnum.imperial) {
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('шт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('унція');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('фунт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('пінта');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('л');
        safeSetState(() {});
      } else {
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('шт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('гр');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('кг');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('мл');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitDropdownLabelList('л');
        safeSetState(() {});
      }

      _model.settingscategoryAndShopOutput =
          await querySettingsCategoryAndShopRecordOnce(
        parent: FFAppState().currentUserRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (widget!.stuff != null) {
        safeSetState(() {
          _model.itemTypeDropDownValueController?.value =
              widget!.stuff!.staffCategoryType!;
        });
        _model.itemType = widget!.stuff?.staffCategoryType;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 100));
        safeSetState(() {
          _model.nameTextFieldTextController?.text = widget!.stuff!.name;
        });
        safeSetState(() {
          _model.countTextFieldTextController?.text =
              widget!.stuff!.count.toString();
        });
        safeSetState(() {
          _model.unitDropDownValueController?.value =
              ((FFAppState().unitSystem == UnitSystemsEnum.imperial
                      ? _model.imperialUnitsList.contains(widget!.stuff?.unit)
                      : _model.metricUnitsList.contains(widget!.stuff?.unit))
                  ? widget!.stuff!.unit!
                  : UnitsEnum.piece);
        });
        if (widget!.stuff?.category != null && widget!.stuff?.category != '') {
          safeSetState(() {
            _model.categoryTextFieldTextController?.text =
                widget!.stuff!.category;
          });
        }
      }
      if (widget!.stuffType != null) {
        _model.itemType = widget!.stuffType;
        safeSetState(() {});
        safeSetState(() {
          _model.itemTypeDropDownValueController?.value = widget!.stuffType!;
        });
      }
    });

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.countTextFieldTextController ??= TextEditingController();
    _model.countTextFieldFocusNode ??= FocusNode();

    _model.categoryTextFieldTextController ??= TextEditingController();

    _model.endDateTextFieldTextController ??= TextEditingController();
    _model.endDateTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.countTextFieldTextController?.text =
              FFLocalizations.of(context).getText(
            'cpusfghb' /* 1 */,
          );
        }));
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
                      child: Material(
                        color: Colors.transparent,
                        elevation: 100.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                        ),
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
                                  24.0, 24.0, 24.0, 100.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: widget!.stuff != null,
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
                                                await widget!.stuff!.reference
                                                    .delete();
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Icon(
                                              Icons.delete_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget!.stuff != null
                                            ? 'Редагувати'
                                            : 'Додати',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FlutterFlowIconButton(
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
                                            FFAppState().setQuantityInt = 0;
                                            FFAppState().setQuantityDouble =
                                                0.0;
                                            FFAppState().unit = '';
                                            FFAppState().update(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  FlutterFlowDropDown<HomeStuffEnum>(
                                    controller: _model
                                            .itemTypeDropDownValueController ??=
                                        FormFieldController<HomeStuffEnum>(
                                      _model.itemTypeDropDownValue ??=
                                          HomeStuffEnum.food,
                                    ),
                                    options: List<HomeStuffEnum>.from(
                                        HomeStuffEnum.values),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'rgxjkwh0' /* Їжа */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '9535uy1v' /* Побутове */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.itemTypeDropDownValue = val);
                                      _model.itemType =
                                          _model.itemTypeDropDownValue;
                                      safeSetState(() {});
                                    },
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
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
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.nameTextFieldTextController,
                                    focusNode: _model.nameTextFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'iliggb9z' /* Назва * */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .nameTextFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  if (_model.nameError)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'lqx338vm' /* У вас вже використовується так... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model
                                                .countTextFieldTextController,
                                            focusNode:
                                                _model.countTextFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'cyz95oow' /* Кількість * */,
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
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .countTextFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowDropDown<UnitsEnum>(
                                        controller: _model
                                                .unitDropDownValueController ??=
                                            FormFieldController<UnitsEnum>(
                                          _model.unitDropDownValue ??=
                                              UnitsEnum.piece,
                                        ),
                                        options: List<UnitsEnum>.from(
                                            FFAppState().unitSystem ==
                                                    UnitSystemsEnum.imperial
                                                ? _model.imperialUnitsList
                                                : _model.metricUnitsList),
                                        optionLabels:
                                            _model.unitDropdownLabelList,
                                        onChanged: (val) => safeSetState(() =>
                                            _model.unitDropDownValue = val),
                                        width: 120.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '4c13kr42' /* Оберіть */,
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
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    indent: 30.0,
                                    endIndent: 30.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  StreamBuilder<
                                      List<HomeStuffCategoriesRecord>>(
                                    stream: queryHomeStuffCategoriesRecord(
                                      parent: FFAppState().currentUserRef,
                                      queryBuilder:
                                          (homeStuffCategoriesRecord) =>
                                              homeStuffCategoriesRecord.where(
                                        'stuffType',
                                        isEqualTo: _model.itemType?.serialize(),
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
                                      List<HomeStuffCategoriesRecord>
                                          categoryTextFieldHomeStuffCategoriesRecordList =
                                          snapshot.data!;

                                      return Autocomplete<String>(
                                        initialValue: TextEditingValue(),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return categoryTextFieldHomeStuffCategoriesRecordList
                                              .map((e) => e.name)
                                              .toList()
                                              .where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey:
                                                _model.categoryTextFieldKey,
                                            textController: _model
                                                .categoryTextFieldTextController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textHighlightStyle: TextStyle(),
                                            elevation: 4.0,
                                            optionBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            maxHeight: 200.0,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          safeSetState(() => _model
                                                  .categoryTextFieldSelectedOption =
                                              selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.categoryTextFieldFocusNode =
                                              focusNode;

                                          _model.categoryTextFieldTextController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model.categoryTextFieldKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.categoryTextFieldTextController',
                                              Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'n9ofupeu' /* Категорія */,
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
                                              suffixIcon: _model
                                                      .categoryTextFieldTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .categoryTextFieldTextController
                                                            ?.clear();
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .categoryTextFieldTextControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  if (_model.itemType == HomeStuffEnum.food)
                                    Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: TextFormField(
                                            controller: _model
                                                .endDateTextFieldTextController,
                                            focusNode: _model
                                                .endDateTextFieldFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '99mtbjni' /* Спожити до */,
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 2.0,
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
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            validator: _model
                                                .endDateTextFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
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
                                              firstDate: getCurrentTimestamp,
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

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                            if (_model.datePicked != null) {
                                              _model.endDate =
                                                  functions.getDateOnly(
                                                      _model.datePicked!);
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .endDateTextFieldTextController
                                                    ?.text = dateTimeFormat(
                                                  "d/M/y",
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                );
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 46.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wfpol1ae' /* * Обов'язкові поля */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                _model.nameError = false;
                                                safeSetState(() {});
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model
                                                        .itemTypeDropDownValue ==
                                                    null) {
                                                  return;
                                                }
                                                if (_model.unitDropDownValue ==
                                                    null) {
                                                  return;
                                                }
                                                _model.savedCategoryOuput =
                                                    await action_blocks
                                                        .tryToAddHomeStuffCategory(
                                                  context,
                                                  stuffType: _model.itemType,
                                                  name: _model
                                                      .categoryTextFieldTextController
                                                      .text,
                                                );
                                                _shouldSetState = true;
                                                if (widget!.stuff != null) {
                                                  await widget!.stuff!.reference
                                                      .update(
                                                          createStaffStorageRecordData(
                                                    name: _model
                                                        .nameTextFieldTextController
                                                        .text,
                                                    unit: _model
                                                        .unitDropDownValue,
                                                    staffCategoryType:
                                                        _model.itemType,
                                                    category: _model
                                                        .savedCategoryOuput,
                                                    count: double.tryParse(_model
                                                        .countTextFieldTextController
                                                        .text),
                                                    endOfDate: _model.endDate,
                                                  ));
                                                } else {
                                                  _model.sameNameCountOutput =
                                                      await queryStaffStorageRecordCount(
                                                    parent: FFAppState()
                                                        .currentUserRef,
                                                    queryBuilder:
                                                        (staffStorageRecord) =>
                                                            staffStorageRecord
                                                                .where(
                                                      'name',
                                                      isEqualTo: _model
                                                          .nameTextFieldTextController
                                                          .text,
                                                    ),
                                                  );
                                                  _shouldSetState = true;
                                                  if (_model
                                                          .sameNameCountOutput! >
                                                      0) {
                                                    _model.nameError = true;
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  var staffStorageRecordReference =
                                                      StaffStorageRecord
                                                          .createDoc(FFAppState()
                                                              .currentUserRef!);
                                                  await staffStorageRecordReference
                                                      .set(
                                                          createStaffStorageRecordData(
                                                    name: _model
                                                        .nameTextFieldTextController
                                                        .text,
                                                    unit: _model
                                                        .unitDropDownValue,
                                                    staffCategoryType:
                                                        _model.itemType,
                                                    category: _model
                                                        .savedCategoryOuput,
                                                    count: double.tryParse(_model
                                                        .countTextFieldTextController
                                                        .text),
                                                    endOfDate: _model.endDate,
                                                  ));
                                                  _model.newItemInShoppingList =
                                                      StaffStorageRecord
                                                          .getDocumentFromData(
                                                              createStaffStorageRecordData(
                                                                name: _model
                                                                    .nameTextFieldTextController
                                                                    .text,
                                                                unit: _model
                                                                    .unitDropDownValue,
                                                                staffCategoryType:
                                                                    _model
                                                                        .itemType,
                                                                category: _model
                                                                    .savedCategoryOuput,
                                                                count: double
                                                                    .tryParse(_model
                                                                        .countTextFieldTextController
                                                                        .text),
                                                                endOfDate: _model
                                                                    .endDate,
                                                              ),
                                                              staffStorageRecordReference);
                                                  _shouldSetState = true;
                                                }

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'mfu3of61' /* Зберегти */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 260.0,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 25.0),
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
                                          'z5r1m1rv' /* Скасувати */,
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
                                ].divide(SizedBox(height: 15.0)),
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
        ),
      ),
    );
  }
}
