import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/meal/delete_meal/delete_meal_widget.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/addingridientspopup/addingridientspopup_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meal_ingridients_model.dart';
export 'meal_ingridients_model.dart';

class MealIngridientsWidget extends StatefulWidget {
  const MealIngridientsWidget({
    super.key,
    required this.choosedMeal,
  });

  final DocumentReference? choosedMeal;

  @override
  State<MealIngridientsWidget> createState() => _MealIngridientsWidgetState();
}

class _MealIngridientsWidgetState extends State<MealIngridientsWidget> {
  late MealIngridientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealIngridientsModel());

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
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: StreamBuilder<ListOfDishesRecord>(
              stream: ListOfDishesRecord.getDocument(widget!.choosedMeal!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFF57F44),
                        ),
                      ),
                    ),
                  );
                }

                final buttonListOfDishesRecord = snapshot.data!;

                return FFButtonWidget(
                  onPressed: () async {
                    if (_model.textController.text != null &&
                        _model.textController.text != '') {
                      context.safePop();
                    } else {
                      await buttonListOfDishesRecord.reference.delete();
                      context.safePop();
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'k7mlaaul' /* Button */,
                  ),
                  icon: Icon(
                    FFIcons.kaltArrowLeft,
                    color: Color(0xFFF57F44),
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFF5F5F5),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'yr9c2g40' /* Meal Ingredients */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<ListOfDishesRecord>(
            stream: ListOfDishesRecord.getDocument(widget!.choosedMeal!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFF57F44),
                      ),
                    ),
                  ),
                );
              }

              final columnListOfDishesRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: TextFormField(
                          controller: _model.textController ??=
                              TextEditingController(
                            text: columnListOfDishesRecord.name,
                          ),
                          focusNode: _model.textFieldFocusNode,
                          onFieldSubmitted: (_) async {
                            await widget!.choosedMeal!
                                .update(createListOfDishesRecordData(
                              name: _model.textController.text,
                            ));
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF515151),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Ви дійно бажаєте видалити запис?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Скасувати'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Видалити'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
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
                                        child: DeleteMealWidget(
                                          mealRef: columnListOfDishesRecord
                                              .reference,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                            child: Icon(
                              Icons.delete,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 12.0, 15.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'RecipeFullPage',
                            queryParameters: {
                              'mealDocFromPlanner': serializeParam(
                                columnListOfDishesRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'mealDocFromPlanner': columnListOfDishesRecord,
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'zinv9nzw' /* Рецепт */,
                        ),
                        icon: Icon(
                          Icons.edit_note_outlined,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 54.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF57F44),
                          textStyle: GoogleFonts.getFont(
                            'Inter',
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Дійсно бажаєте відмінусувати наявні продукти?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Скасувати'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Відмінусувати'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                _model.allIngridientsOutput =
                                    await queryIngredientsOfDishesRecordOnce(
                                  parent: widget!.choosedMeal,
                                );
                                _model.allStufsOutput =
                                    await queryStaffStorageRecordOnce(
                                  parent: FFAppState().currentUserRef,
                                  queryBuilder: (staffStorageRecord) =>
                                      staffStorageRecord.where(
                                    'staffCategoryType',
                                    isEqualTo: HomeStuffEnum.food.serialize(),
                                  ),
                                );
                                _model.loopIndex = 0;
                                while (_model.loopIndex <
                                    _model.allIngridientsOutput!.length) {
                                  if (_model.allStufsOutput!
                                      .where((e) =>
                                          (e.name ==
                                              _model.allIngridientsOutput
                                                  ?.elementAtOrNull(
                                                      _model.loopIndex)
                                                  ?.name) &&
                                          (e.unit ==
                                              _model.allIngridientsOutput
                                                  ?.elementAtOrNull(
                                                      _model.loopIndex)
                                                  ?.unit) &&
                                          (e.count >=
                                              _model.allIngridientsOutput!
                                                  .elementAtOrNull(
                                                      _model.loopIndex)!
                                                  .quantity))
                                      .toList()
                                      .isNotEmpty) {
                                    if (_model.allStufsOutput
                                            ?.where((e) =>
                                                (e.name ==
                                                    _model.allIngridientsOutput
                                                        ?.elementAtOrNull(
                                                            _model.loopIndex)
                                                        ?.name) &&
                                                (e.unit ==
                                                    _model.allIngridientsOutput
                                                        ?.elementAtOrNull(
                                                            _model.loopIndex)
                                                        ?.unit) &&
                                                (e.count >=
                                                    _model.allIngridientsOutput!
                                                        .elementAtOrNull(
                                                            _model.loopIndex)!
                                                        .quantity))
                                            .toList()
                                            ?.sortedList(
                                                keyOf: (e) => e.count,
                                                desc: true)
                                            ?.firstOrNull
                                            ?.count ==
                                        _model.allIngridientsOutput
                                            ?.elementAtOrNull(_model.loopIndex)
                                            ?.quantity) {
                                      await _model.allStufsOutput!
                                          .where((e) =>
                                              (e.name ==
                                                  _model.allIngridientsOutput
                                                      ?.elementAtOrNull(
                                                          _model.loopIndex)
                                                      ?.name) &&
                                              (e.unit ==
                                                  _model.allIngridientsOutput
                                                      ?.elementAtOrNull(
                                                          _model.loopIndex)
                                                      ?.unit) &&
                                              (e.count >=
                                                  _model.allIngridientsOutput!
                                                      .elementAtOrNull(
                                                          _model.loopIndex)!
                                                      .quantity))
                                          .toList()
                                          .sortedList(
                                              keyOf: (e) => e.count, desc: true)
                                          .firstOrNull!
                                          .reference
                                          .delete();
                                    } else {
                                      await _model.allStufsOutput!
                                          .where((e) =>
                                              (e.name ==
                                                  _model.allIngridientsOutput
                                                      ?.elementAtOrNull(
                                                          _model.loopIndex)
                                                      ?.name) &&
                                              (e.unit ==
                                                  _model.allIngridientsOutput
                                                      ?.elementAtOrNull(
                                                          _model.loopIndex)
                                                      ?.unit) &&
                                              (e.count >=
                                                  _model.allIngridientsOutput!
                                                      .elementAtOrNull(
                                                          _model.loopIndex)!
                                                      .quantity))
                                          .toList()
                                          .sortedList(
                                              keyOf: (e) => e.count, desc: true)
                                          .firstOrNull!
                                          .reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'count': FieldValue.increment(
                                                -(_model.allIngridientsOutput!
                                                    .elementAtOrNull(
                                                        _model.loopIndex)!
                                                    .quantity)),
                                          },
                                        ),
                                      });
                                    }
                                  }
                                  _model.loopIndex = _model.loopIndex + 1;
                                }
                              }
                              _model.loopIndex = 0;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'ahoiw0ly' /* Відмінусувати продукти */,
                            ),
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 16.0,
                          buttonSize: 50.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.question_mark,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      'Коли ви тиснете \"мідмінусувати продукти, то у Storage віднімаються лише ті продукти, яких достатньо, решту ви можете добавити у список покупок'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child:
                                StreamBuilder<List<IngredientsOfDishesRecord>>(
                              stream: queryIngredientsOfDishesRecord(
                                parent: widget!.choosedMeal,
                                queryBuilder: (ingredientsOfDishesRecord) =>
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
                                    listViewIngredientsOfDishesRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewIngredientsOfDishesRecordList
                                          .length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewIngredientsOfDishesRecord =
                                        listViewIngredientsOfDishesRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 15.0),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x85919191),
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
                                                          AddingridientspopupWidget(
                                                        dashRef:
                                                            columnListOfDishesRecord
                                                                .reference,
                                                        ingridient:
                                                            listViewIngredientsOfDishesRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          listViewIngredientsOfDishesRecord
                                                              .name,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
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
                                                      child: Text(
                                                        '${formatNumber(
                                                          listViewIngredientsOfDishesRecord
                                                              .quantity,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '####.##',
                                                          locale: '',
                                                        )} ${listViewIngredientsOfDishesRecord.unit?.name}',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<StaffStorageRecord>>(
                                                    stream:
                                                        queryStaffStorageRecord(
                                                      parent: FFAppState()
                                                          .currentUserRef,
                                                      queryBuilder:
                                                          (staffStorageRecord) =>
                                                              staffStorageRecord
                                                                  .where(
                                                                    'name',
                                                                    isEqualTo:
                                                                        listViewIngredientsOfDishesRecord
                                                                            .name,
                                                                  )
                                                                  .where(
                                                                    'staffCategoryType',
                                                                    isEqualTo:
                                                                        HomeStuffEnum
                                                                            .food
                                                                            .serialize(),
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                Color(
                                                                    0xFFF57F44),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<StaffStorageRecord>
                                                          containerStaffStorageRecordList =
                                                          snapshot.data!;
                                                      final containerStaffStorageRecord =
                                                          containerStaffStorageRecordList
                                                                  .isNotEmpty
                                                              ? containerStaffStorageRecordList
                                                                  .first
                                                              : null;

                                                      return Container(
                                                        width: 150.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (containerStaffStorageRecord !=
                                                                    null
                                                                ? ((containerStaffStorageRecord!
                                                                            .count <
                                                                        listViewIngredientsOfDishesRecord
                                                                            .quantity) ||
                                                                    (containerStaffStorageRecord
                                                                            ?.unit !=
                                                                        listViewIngredientsOfDishesRecord
                                                                            .unit))
                                                                : true)
                                                              InkWell(
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
                                                                    () async {
                                                                  if (!listViewIngredientsOfDishesRecord
                                                                      .inStock) {
                                                                    if (listViewIngredientsOfDishesRecord
                                                                            .removeToShopList !=
                                                                        'Added') {
                                                                      unawaited(
                                                                        () async {
                                                                          await listViewIngredientsOfDishesRecord
                                                                              .reference
                                                                              .update(createIngredientsOfDishesRecordData(
                                                                            removeToShopList:
                                                                                'Added',
                                                                          ));
                                                                        }(),
                                                                      );
                                                                      unawaited(
                                                                        () async {
                                                                          await ShoppingListRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set(createShoppingListRecordData(
                                                                            name:
                                                                                listViewIngredientsOfDishesRecord.name,
                                                                            unit:
                                                                                listViewIngredientsOfDishesRecord.unit,
                                                                            quantity:
                                                                                listViewIngredientsOfDishesRecord.quantity,
                                                                            shopName:
                                                                                ' ',
                                                                            isBought:
                                                                                false,
                                                                            dateOfBuy:
                                                                                dateTimeFromSecondsSinceEpoch(functions.toInt('0')),
                                                                          ));
                                                                        }(),
                                                                      );
                                                                    }
                                                                  }
                                                                },
                                                                child: Text(
                                                                  listViewIngredientsOfDishesRecord
                                                                          .inStock
                                                                      ? 'Home'
                                                                      : listViewIngredientsOfDishesRecord
                                                                          .removeToShopList,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: functions
                                                                            .setColorForItemInStock(listViewIngredientsOfDishesRecord.inStock),
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (containerStaffStorageRecord !=
                                                                    null
                                                                ? ((containerStaffStorageRecord!
                                                                            .count >=
                                                                        listViewIngredientsOfDishesRecord
                                                                            .quantity) &&
                                                                    (containerStaffStorageRecord
                                                                            ?.unit ==
                                                                        listViewIngredientsOfDishesRecord
                                                                            .unit))
                                                                : false)
                                                              Text(
                                                                '${containerStaffStorageRecord?.count?.toString()}${containerStaffStorageRecord?.unit?.name} у Storage',
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
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 25.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
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
                                          child: AddingridientspopupWidget(
                                            dashRef: widget!.choosedMeal!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: '',
                                icon: Icon(
                                  FFIcons.kplus,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      9.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF57F44),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
