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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addingridientspopup_shopping_model.dart';
export 'addingridientspopup_shopping_model.dart';

class AddingridientspopupShoppingWidget extends StatefulWidget {
  const AddingridientspopupShoppingWidget({
    super.key,
    this.ingridient,
  });

  final ShoppingListRecord? ingridient;

  @override
  State<AddingridientspopupShoppingWidget> createState() =>
      _AddingridientspopupShoppingWidgetState();
}

class _AddingridientspopupShoppingWidgetState
    extends State<AddingridientspopupShoppingWidget> {
  late AddingridientspopupShoppingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddingridientspopupShoppingModel());

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

      if (widget!.ingridient != null) {
        safeSetState(() {
          _model.itemTypeDropDownValueController?.value =
              widget!.ingridient!.staffCategory!;
        });
        _model.itemType = widget!.ingridient?.staffCategory;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 100));
        safeSetState(() {
          _model.nameTextFieldTextController?.text = widget!.ingridient!.name;
        });
        safeSetState(() {
          _model.countTextFieldTextController?.text =
              widget!.ingridient!.quantity.toString();
        });
        safeSetState(() {
          _model.unitDropDownValueController
              ?.value = ((FFAppState().unitSystem == UnitSystemsEnum.imperial
                  ? _model.imperialUnitsList.contains(widget!.ingridient?.unit)
                  : _model.metricUnitsList.contains(widget!.ingridient?.unit))
              ? widget!.ingridient!.unit!
              : UnitsEnum.piece);
        });
        if (widget!.ingridient?.categoryFoodOrHousehold != null &&
            widget!.ingridient?.categoryFoodOrHousehold != '') {
          safeSetState(() {
            _model.categoryTextFieldTextController?.text =
                widget!.ingridient!.categoryFoodOrHousehold;
          });
        }
        if (widget!.ingridient?.shopName != null &&
            widget!.ingridient?.shopName != '') {
          safeSetState(() {
            _model.shopTextFieldTextController?.text =
                widget!.ingridient!.shopName;
          });
        }
      }
    });

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.countTextFieldTextController ??= TextEditingController();
    _model.countTextFieldFocusNode ??= FocusNode();

    _model.categoryTextFieldTextController ??= TextEditingController();

    _model.shopTextFieldTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.countTextFieldTextController?.text =
              FFLocalizations.of(context).getText(
            '56yvuxku' /* 1 */,
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
                                                await widget!
                                                    .ingridient!.reference
                                                    .delete();
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
                                        'swdtyqvc' /* Їжа */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'pfpk7aaa' /* Побутове */,
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
                                        '10adsm53' /* Назва * */,
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
                                                'tclmk8d6' /* Кількість * */,
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
                                          'pv8i95rp' /* Оберіть */,
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
                                  Container(
                                    child: StreamBuilder<
                                        List<HomeStuffCategoriesRecord>>(
                                      stream: queryHomeStuffCategoriesRecord(
                                        parent: FFAppState().currentUserRef,
                                        queryBuilder:
                                            (homeStuffCategoriesRecord) =>
                                                homeStuffCategoriesRecord.where(
                                          'stuffType',
                                          isEqualTo:
                                              _model.itemType?.serialize(),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
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
                                                  'wqxutxm0' /* Категорія */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return FFAppState()
                                            .namesOfShops
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
                                          textFieldKey: _model.shopTextFieldKey,
                                          textController: _model
                                              .shopTextFieldTextController!,
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
                                          elevation: 0.0,
                                          optionBackgroundColor:
                                              Color(0xFFF1F4F8),
                                          optionHighlightColor:
                                              Color(0xFFF1F4F8),
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        safeSetState(() =>
                                            _model.shopTextFieldSelectedOption =
                                                selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.shopTextFieldFocusNode =
                                            focusNode;

                                        _model.shopTextFieldTextController =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.shopTextFieldKey,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'jrlmymk2' /* Назва магазину */,
                                            ),
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
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
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              .shopTextFieldTextControllerValidator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'cht4nwwu' /* * Обов'язкові поля */,
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
                                                _model.createdCategoryOuput =
                                                    await action_blocks
                                                        .tryToAddHomeStuffCategory(
                                                  context,
                                                  stuffType: _model.itemType,
                                                  name: _model
                                                      .categoryTextFieldTextController
                                                      .text,
                                                );
                                                if (widget!.ingridient !=
                                                    null) {
                                                  await widget!
                                                      .ingridient!.reference
                                                      .update(
                                                          createShoppingListRecordData(
                                                    name: _model
                                                        .nameTextFieldTextController
                                                        .text,
                                                    shopName: _model
                                                        .shopTextFieldTextController
                                                        .text,
                                                    quantity: double.tryParse(_model
                                                        .countTextFieldTextController
                                                        .text),
                                                    categoryFoodOrHousehold:
                                                        _model
                                                            .createdCategoryOuput,
                                                    unit: _model
                                                        .unitDropDownValue,
                                                    staffCategory:
                                                        _model.itemType,
                                                  ));
                                                } else {
                                                  var shoppingListRecordReference =
                                                      ShoppingListRecord
                                                          .createDoc(FFAppState()
                                                              .currentUserRef!);
                                                  await shoppingListRecordReference
                                                      .set(
                                                          createShoppingListRecordData(
                                                    name: _model
                                                        .nameTextFieldTextController
                                                        .text,
                                                    quantity: double.tryParse(_model
                                                        .countTextFieldTextController
                                                        .text),
                                                    shopName: _model
                                                        .shopTextFieldTextController
                                                        .text,
                                                    categoryFoodOrHousehold:
                                                        _model
                                                            .createdCategoryOuput,
                                                    isBought: false,
                                                    unit: _model
                                                        .unitDropDownValue,
                                                    staffCategory:
                                                        _model.itemType,
                                                    dateOfBuy:
                                                        dateTimeFromSecondsSinceEpoch(
                                                            functions
                                                                .toInt('0')),
                                                  ));
                                                  _model.newItemInShoppingList =
                                                      ShoppingListRecord
                                                          .getDocumentFromData(
                                                              createShoppingListRecordData(
                                                                name: _model
                                                                    .nameTextFieldTextController
                                                                    .text,
                                                                quantity: double
                                                                    .tryParse(_model
                                                                        .countTextFieldTextController
                                                                        .text),
                                                                shopName: _model
                                                                    .shopTextFieldTextController
                                                                    .text,
                                                                categoryFoodOrHousehold:
                                                                    _model
                                                                        .createdCategoryOuput,
                                                                isBought: false,
                                                                unit: _model
                                                                    .unitDropDownValue,
                                                                staffCategory:
                                                                    _model
                                                                        .itemType,
                                                                dateOfBuy: dateTimeFromSecondsSinceEpoch(
                                                                    functions
                                                                        .toInt(
                                                                            '0')),
                                                              ),
                                                              shoppingListRecordReference);
                                                }

                                                Navigator.pop(context);

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'zhycvxat' /* Зберегти */,
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
                                          'wktplc8v' /* Скасувати */,
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
