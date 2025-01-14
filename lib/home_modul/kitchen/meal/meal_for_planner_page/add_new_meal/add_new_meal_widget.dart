import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/addingridientspopup/addingridientspopup_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_new_meal_model.dart';
export 'add_new_meal_model.dart';

class AddNewMealWidget extends StatefulWidget {
  const AddNewMealWidget({
    super.key,
    this.tag,
  });

  final int? tag;

  @override
  State<AddNewMealWidget> createState() => _AddNewMealWidgetState();
}

class _AddNewMealWidgetState extends State<AddNewMealWidget> {
  late AddNewMealModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewMealModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.tag != null) {
        _model.tag = widget!.tag;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 56.0),
                child: wrapWithModel(
                  model: _model.appBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBarWidget(
                    title: FFLocalizations.of(context).getText(
                      'pobgksgg' /* Додати нову страву */,
                    ),
                    colorButton: FlutterFlowTheme.of(context).home,
                    isSettingButton: false,
                    isAddButton: false,
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'jkmu9njs' /* Назва страви */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 8.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.tag = 1;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'btwrnmgf' /* Сніданок */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 155.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              _model.tag == 1
                                                  ? Colors.black
                                                  : Colors.white,
                                              Colors.white,
                                            ),
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color: valueOrDefault<Color>(
                                                _model.tag == 1
                                                    ? Colors.white
                                                    : Colors.black,
                                                Colors.black,
                                              ),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFF9EEE6),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.tag = 2;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'u7ny6ffc' /* Обід */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 155.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              _model.tag == 2
                                                  ? Colors.black
                                                  : Colors.white,
                                              Colors.white,
                                            ),
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color: valueOrDefault<Color>(
                                                _model.tag == 2
                                                    ? Colors.white
                                                    : Colors.black,
                                                Colors.black,
                                              ),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFF9EEE6),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.tag = 3;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'qxqditcj' /* Вечеря */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 155.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              _model.tag == 3
                                                  ? Colors.black
                                                  : Colors.white,
                                              Colors.white,
                                            ),
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color: valueOrDefault<Color>(
                                                _model.tag == 3
                                                    ? Colors.white
                                                    : Colors.black,
                                                Colors.black,
                                              ),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFF9EEE6),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.tag = 4;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'eqq8jzvz' /* Інше */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 155.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              _model.tag == 4
                                                  ? Colors.black
                                                  : Colors.white,
                                              Colors.white,
                                            ),
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color: valueOrDefault<Color>(
                                                _model.tag == 4
                                                    ? Colors.white
                                                    : Colors.black,
                                                Colors.black,
                                              ),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFF9EEE6),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                _model.dish != null,
                                false,
                              ))
                                Expanded(
                                  child: StreamBuilder<
                                      List<IngredientsOfDishesRecord>>(
                                    stream: queryIngredientsOfDishesRecord(
                                      parent: _model.dish?.reference,
                                      queryBuilder:
                                          (ingredientsOfDishesRecord) =>
                                              ingredientsOfDishesRecord.where(
                                        'quantity',
                                        isGreaterThan: 0.0,
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
                                      List<IngredientsOfDishesRecord>
                                          columnIngredientsOfDishesRecordList =
                                          snapshot.data!;

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnIngredientsOfDishesRecordList
                                                  .length, (columnIndex) {
                                            final columnIngredientsOfDishesRecord =
                                                columnIngredientsOfDishesRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap:
                                                                  () async {},
                                                              child: Text(
                                                                columnIngredientsOfDishesRecord
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap:
                                                                  () async {},
                                                              child: Text(
                                                                '${formatNumber(
                                                                  columnIngredientsOfDishesRecord
                                                                      .quantity,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '####.##',
                                                                  locale: '',
                                                                )} ${columnIngredientsOfDishesRecord.unit?.name}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (!columnIngredientsOfDishesRecord
                                                                  .inStock) {
                                                                if (columnIngredientsOfDishesRecord
                                                                        .removeToShopList !=
                                                                    'Added') {
                                                                  unawaited(
                                                                    () async {
                                                                      await columnIngredientsOfDishesRecord
                                                                          .reference
                                                                          .update(
                                                                              createIngredientsOfDishesRecordData(
                                                                        removeToShopList:
                                                                            'Added',
                                                                      ));
                                                                    }(),
                                                                  );
                                                                  unawaited(
                                                                    () async {
                                                                      await ShoppingListRecord.createDoc(FFAppState()
                                                                              .currentUserRef!)
                                                                          .set(
                                                                              createShoppingListRecordData(
                                                                        name: columnIngredientsOfDishesRecord
                                                                            .name,
                                                                        unit: columnIngredientsOfDishesRecord
                                                                            .unit,
                                                                        quantity:
                                                                            columnIngredientsOfDishesRecord.quantity,
                                                                        shopName:
                                                                            ' ',
                                                                        isBought:
                                                                            false,
                                                                      ));
                                                                    }(),
                                                                  );
                                                                }
                                                              }
                                                            },
                                                            child: Text(
                                                              columnIngredientsOfDishesRecord
                                                                      .inStock
                                                                  ? 'Home'
                                                                  : columnIngredientsOfDishesRecord
                                                                      .removeToShopList,
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: functions
                                                                        .setColorForItemInStock(
                                                                            columnIngredientsOfDishesRecord.inStock),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ]
                                .addToStart(SizedBox(height: 50.0))
                                .addToEnd(SizedBox(height: 50.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (!(_model.dish != null)) {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }

                                    var listOfDishesRecordReference =
                                        ListOfDishesRecord.collection.doc();
                                    await listOfDishesRecordReference
                                        .set(createListOfDishesRecordData(
                                      name: _model.textController.text,
                                      userID: FFAppState().currentUserRef?.id,
                                      tag: () {
                                        if (_model.tag == 1) {
                                          return 'Breakfast';
                                        } else if (_model.tag == 2) {
                                          return 'Lunch';
                                        } else if (_model.tag == 3) {
                                          return 'Dinner';
                                        } else {
                                          return 'Other';
                                        }
                                      }(),
                                    ));
                                    _model.dishOutput =
                                        ListOfDishesRecord.getDocumentFromData(
                                            createListOfDishesRecordData(
                                              name: _model.textController.text,
                                              userID: FFAppState()
                                                  .currentUserRef
                                                  ?.id,
                                              tag: () {
                                                if (_model.tag == 1) {
                                                  return 'Breakfast';
                                                } else if (_model.tag == 2) {
                                                  return 'Lunch';
                                                } else if (_model.tag == 3) {
                                                  return 'Dinner';
                                                } else {
                                                  return 'Other';
                                                }
                                              }(),
                                            ),
                                            listOfDishesRecordReference);
                                    _model.dish = _model.dishOutput;
                                    safeSetState(() {});
                                  }
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x85919191),
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
                                          child: AddingridientspopupWidget(
                                            dashRef: _model.dish!.reference,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4w8lqeow' /* Інгредієнт */,
                                ),
                                icon: Icon(
                                  Icons.add,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 54.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: GoogleFonts.getFont(
                                    'Inter',
                                    color: Color(0xFFF57F44),
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
                            FFButtonWidget(
                              onPressed: () async {
                                if (_model.dish == null) {
                                  await ListOfDishesRecord.collection
                                      .doc()
                                      .set(createListOfDishesRecordData(
                                        tag: () {
                                          if (_model.tag == 1) {
                                            return 'Breakfast';
                                          } else if (_model.tag == 2) {
                                            return 'Lunch';
                                          } else if (_model.tag == 3) {
                                            return 'Dinner';
                                          } else {
                                            return 'Other';
                                          }
                                        }(),
                                        name: _model.textController.text,
                                        userID: FFAppState().currentUserRef?.id,
                                      ));
                                } else {
                                  await _model.dish!.reference
                                      .update(createListOfDishesRecordData(
                                    name: _model.textController.text,
                                    tag: () {
                                      if (_model.tag == 1) {
                                        return 'Breakfast';
                                      } else if (_model.tag == 2) {
                                        return 'Lunch';
                                      } else if (_model.tag == 3) {
                                        return 'Dinner';
                                      } else {
                                        return 'Other';
                                      }
                                    }(),
                                  ));
                                }

                                Navigator.pop(context);
                              },
                              text: FFLocalizations.of(context).getText(
                                'woub5a5p' /* Додати */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).home,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).home,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ],
                        ),
                      ],
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
