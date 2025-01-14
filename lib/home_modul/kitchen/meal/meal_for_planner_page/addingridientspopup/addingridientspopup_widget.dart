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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addingridientspopup_model.dart';
export 'addingridientspopup_model.dart';

class AddingridientspopupWidget extends StatefulWidget {
  const AddingridientspopupWidget({
    super.key,
    required this.dashRef,
    this.ingridient,
  });

  final DocumentReference? dashRef;
  final IngredientsOfDishesRecord? ingridient;

  @override
  State<AddingridientspopupWidget> createState() =>
      _AddingridientspopupWidgetState();
}

class _AddingridientspopupWidgetState extends State<AddingridientspopupWidget> {
  late AddingridientspopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddingridientspopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.unitsDropdownList = [];
      safeSetState(() {});
      if (FFAppState().unitSystem == UnitSystemsEnum.imperial) {
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('шт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('унція');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('фунт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('пінта');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('л');
        safeSetState(() {});
      } else {
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('шт');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('г');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('кг');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('мл');
        // сформування списку одиниць виміру для імперських чи метричних систем. Список для дропдауну
        //
        //
        _model.addToUnitsDropdownList('л');
        safeSetState(() {});
      }

      _model.foodCategories = await querySettingsCategoryAndShopRecordOnce(
        parent: FFAppState().currentUserRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (widget!.ingridient != null) {
        safeSetState(() {
          _model.nameTextFieldTextController?.text = widget!.ingridient!.name;
        });
        safeSetState(() {
          _model.coundTextFieldTextController?.text =
              widget!.ingridient!.quantity.toString();
        });
        safeSetState(() {
          _model.unitDropDownValueController?.value = widget!.ingridient!.unit!;
        });
        if (widget!.ingridient?.category != null &&
            widget!.ingridient?.category != '') {
          safeSetState(() {
            _model.categoryTextFieldTextController?.text =
                widget!.ingridient!.category;
          });
        }
      }
    });

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.coundTextFieldTextController ??= TextEditingController();
    _model.coundTextFieldFocusNode ??= FocusNode();

    _model.categoryTextFieldTextController ??= TextEditingController();
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
                Padding(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 21.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: widget!.ingridient != null,
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
                                            await widget!.ingridient!.reference
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
                                    widget!.ingridient != null
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
                                  FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      FFAppState().setQuantityInt = 0;
                                      FFAppState().setQuantityDouble = 0.0;
                                      FFAppState().unit = '';
                                      FFAppState().update(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.nameTextFieldTextController,
                                        focusNode:
                                            _model.nameTextFieldFocusNode,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'q56fk39m' /* Назва продукту * */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                      .alternate,
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
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .nameTextFieldTextControllerValidator
                                            .asValidator(context),
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
                                                .coundTextFieldTextController,
                                            focusNode:
                                                _model.coundTextFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'lrlk6zvk' /* Кількість * */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
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
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .coundTextFieldTextControllerValidator
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
                                        optionLabels: _model.unitsDropdownList,
                                        onChanged: (val) => safeSetState(() =>
                                            _model.unitDropDownValue = val),
                                        width: 100.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '2nzlbbln' /* Select... */,
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
                                        isEqualTo:
                                            HomeStuffEnum.food.serialize(),
                                      ),
                                    ),
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
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9xknaat5' /* * Обов'язкові поля */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 15.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.unitDropDownValue ==
                                              null) {
                                            return;
                                          }
                                          _model.createdCategoryOuput =
                                              await action_blocks
                                                  .tryToAddHomeStuffCategory(
                                            context,
                                            stuffType: HomeStuffEnum.food,
                                            name: _model
                                                .categoryTextFieldTextController
                                                .text,
                                          );
                                          if (widget!.ingridient != null) {
                                            await widget!.ingridient!.reference
                                                .update(
                                                    createIngredientsOfDishesRecordData(
                                              name: _model
                                                  .nameTextFieldTextController
                                                  .text,
                                              quantity: double.tryParse(_model
                                                  .coundTextFieldTextController
                                                  .text),
                                              category:
                                                  _model.createdCategoryOuput,
                                              unit: _model.unitDropDownValue,
                                            ));
                                          } else {
                                            var ingredientsOfDishesRecordReference =
                                                IngredientsOfDishesRecord
                                                    .createDoc(
                                                        widget!.dashRef!);
                                            await ingredientsOfDishesRecordReference
                                                .set(
                                                    createIngredientsOfDishesRecordData(
                                              name: _model
                                                  .nameTextFieldTextController
                                                  .text,
                                              quantity: double.tryParse(_model
                                                  .coundTextFieldTextController
                                                  .text),
                                              unit: _model.unitDropDownValue,
                                              category:
                                                  _model.createdCategoryOuput,
                                              removeToShopList: 'Add to list',
                                            ));
                                            _model.newIngredient =
                                                IngredientsOfDishesRecord
                                                    .getDocumentFromData(
                                                        createIngredientsOfDishesRecordData(
                                                          name: _model
                                                              .nameTextFieldTextController
                                                              .text,
                                                          quantity: double
                                                              .tryParse(_model
                                                                  .coundTextFieldTextController
                                                                  .text),
                                                          unit: _model
                                                              .unitDropDownValue,
                                                          category: _model
                                                              .createdCategoryOuput,
                                                          removeToShopList:
                                                              'Add to list',
                                                        ),
                                                        ingredientsOfDishesRecordReference);
                                          }

                                          Navigator.pop(context);

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'g488qv0n' /* Зберегти */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 260.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                                    'ruj9jqqd' /* Скасувати */,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
