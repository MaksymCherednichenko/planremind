import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/calendar_popup/calendar_popup_widget.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/addingridientspopup/addingridientspopup_widget.dart';
import '/home_modul/kitchen/meal/meal_for_planner_page/editingridientspopup/editingridientspopup_widget.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_meal_for_planner_page_model.dart';
export 'add_meal_for_planner_page_model.dart';

class AddMealForPlannerPageWidget extends StatefulWidget {
  const AddMealForPlannerPageWidget({
    super.key,
    required this.listOfDishesRef,
  });

  final DocumentReference? listOfDishesRef;

  @override
  State<AddMealForPlannerPageWidget> createState() =>
      _AddMealForPlannerPageWidgetState();
}

class _AddMealForPlannerPageWidgetState
    extends State<AddMealForPlannerPageWidget> {
  late AddMealForPlannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMealForPlannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().choosedDate = null;
      FFAppState().tag = '';
      FFAppState().isDateRange = false;
      FFAppState().chooseSecDate = null;
      setState(() {});
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget!.listOfDishesRef!.delete();
                  context.safePop();
                  FFAppState().choosedDate = null;
                  FFAppState().tag = '';
                  FFAppState().isDateRange = false;
                  FFAppState().chooseSecDate = null;
                  FFAppState().dateRange = [];
                  FFAppState().update(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'p4a6hhem' /* Button */,
                ),
                icon: Icon(
                  FFIcons.kaltArrowLeft,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: 0.0,
                  height: 6.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFF5F5F5),
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w200,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 51.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '9oijar81' /* Додати страву */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF0B0B0B),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      width: 327.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 2000),
                          () async {
                            await widget!.listOfDishesRef!
                                .update(createListOfDishesRecordData(
                              name: _model.textController.text,
                            ));
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: FFLocalizations.of(context).getText(
                            'pzx0q4ri' /* Назва */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF0B0B0B),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 2.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE4E4E4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE4E4E4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: StreamBuilder<List<IngredientsOfDishesRecord>>(
                      stream: queryIngredientsOfDishesRecord(
                        parent: widget!.listOfDishesRef,
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
                                valueColor: AlwaysStoppedAnimation<Color>(
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
                              listViewIngredientsOfDishesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewIngredientsOfDishesRecord =
                                listViewIngredientsOfDishesRecordList[
                                    listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0x85919191),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            EditingridientspopupWidget(
                                                          listOfIngridientsRef:
                                                              listViewIngredientsOfDishesRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Text(
                                                listViewIngredientsOfDishesRecord
                                                    .name,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0x85919191),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            EditingridientspopupWidget(
                                                          listOfIngridientsRef:
                                                              listViewIngredientsOfDishesRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Text(
                                                '${formatNumber(
                                                  listViewIngredientsOfDishesRecord
                                                      .quantity,
                                                  formatType: FormatType.custom,
                                                  format: '####.##',
                                                  locale: '',
                                                )} ${listViewIngredientsOfDishesRecord.unit}',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (!listViewIngredientsOfDishesRecord
                                                  .inStock) {
                                                if (listViewIngredientsOfDishesRecord
                                                        .removeToShopList !=
                                                    'Added') {
                                                  unawaited(
                                                    () async {
                                                      await listViewIngredientsOfDishesRecord
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
                                                      await ShoppingListRecord
                                                              .createDoc(
                                                                  FFAppState()
                                                                      .currentUserRef!)
                                                          .set(
                                                              createShoppingListRecordData(
                                                        name:
                                                            listViewIngredientsOfDishesRecord
                                                                .name,
                                                        unit:
                                                            listViewIngredientsOfDishesRecord
                                                                .unit,
                                                        quantity:
                                                            listViewIngredientsOfDishesRecord
                                                                .quantity,
                                                        bought: false,
                                                        shopName: ' ',
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
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: functions
                                                            .setColorForItemInStock(
                                                                listViewIngredientsOfDishesRecord
                                                                    .inStock),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var ingredientsOfDishesRecordReference =
                          IngredientsOfDishesRecord.createDoc(
                              widget!.listOfDishesRef!);
                      await ingredientsOfDishesRecordReference
                          .set(createIngredientsOfDishesRecordData());
                      _model.listOfIngridients =
                          IngredientsOfDishesRecord.getDocumentFromData(
                              createIngredientsOfDishesRecordData(),
                              ingredientsOfDishesRecordReference);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x85919191),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: AddingridientspopupWidget(
                                listOfIngridients: _model.listOfIngridients!,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'vghxvaz0' /* Інгредієнт */,
                    ),
                    icon: Icon(
                      Icons.add,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 54.0,
                      padding: EdgeInsets.all(0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: StreamBuilder<ListOfDishesRecord>(
                    stream: ListOfDishesRecord.getDocument(
                        widget!.listOfDishesRef!),
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CalendarPopupWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      FFAppState().chooseSecDate = null;
                                      setState(() {});
                                    },
                                    text: '',
                                    icon: Icon(
                                      FFIcons.kcalendarMinimalistic,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 318.0,
                                      height: 50.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              275.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFF5F5F5),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFFEE8B60),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xE8E4E4E4),
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        45.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
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
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CalendarPopupWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        FFAppState().chooseSecDate = null;
                                        setState(() {});
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            'd/M/y',
                                            FFAppState().choosedDate,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          'Planned date',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().isDateRange)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CalendarPopupWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: '',
                                      icon: Icon(
                                        FFIcons.kcalendarMinimalistic,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 318.0,
                                        height: 50.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                275.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF5F5F5),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFFEE8B60),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xE8E4E4E4),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          45.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
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
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: CalendarPopupWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              'd/M/y',
                                              FFAppState().chooseSecDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'To date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                35.0, 0.0, 35.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??=
                                          FFAppState().isDateRange,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState().isDateRange = true;
                                          setState(() {});
                                        } else {
                                          FFAppState().isDateRange = false;
                                          setState(() {});
                                        }
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      activeColor: Color(0x85919191),
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '25cuicol' /* Проміжок дат */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 8.0, 20.0, 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.7, 0.6),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 2.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().tag = 'Breakfast';
                                        FFAppState().update(() {});
                                        _model.buttonClick = 1;
                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ldkeap1b' /* Сніданок */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 155.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.buttonClick == 1
                                              ? Colors.black
                                              : Colors.white,
                                          Colors.white,
                                        ),
                                        textStyle: GoogleFonts.getFont(
                                          'Inter',
                                          color: valueOrDefault<Color>(
                                            _model.buttonClick == 1
                                                ? Colors.white
                                                : Colors.black,
                                            Colors.black,
                                          ),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFFFF),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.65, 0.6),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().tag = 'Lunch';
                                        FFAppState().update(() {});
                                        _model.buttonClick = 2;
                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'dgefvyj2' /* Обід */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 155.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.buttonClick == 2
                                              ? Colors.black
                                              : Colors.white,
                                          Colors.white,
                                        ),
                                        textStyle: GoogleFonts.getFont(
                                          'Inter',
                                          color: valueOrDefault<Color>(
                                            _model.buttonClick == 2
                                                ? Colors.white
                                                : Colors.black,
                                            Colors.black,
                                          ),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.7, 0.73),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 2.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().tag = 'Dinner';
                                        FFAppState().update(() {});
                                        _model.buttonClick = 3;
                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'lez9arqj' /* Вечеря */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 155.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.buttonClick == 3
                                              ? Colors.black
                                              : Colors.white,
                                          Colors.white,
                                        ),
                                        textStyle: GoogleFonts.getFont(
                                          'Inter',
                                          color: valueOrDefault<Color>(
                                            _model.buttonClick == 3
                                                ? Colors.white
                                                : Colors.black,
                                            Colors.black,
                                          ),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.65, 0.73),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().tag = 'Other';
                                        FFAppState().update(() {});
                                        _model.buttonClick = 4;
                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'f0x4u85m' /* Інше */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 155.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.buttonClick == 4
                                              ? Colors.black
                                              : Colors.white,
                                          Colors.white,
                                        ),
                                        textStyle: GoogleFonts.getFont(
                                          'Inter',
                                          color: valueOrDefault<Color>(
                                            _model.buttonClick == 4
                                                ? Colors.white
                                                : Colors.black,
                                            Colors.black,
                                          ),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 10.0),
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
                                    'mealDocFromPlanner':
                                        columnListOfDishesRecord,
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '2nqq997t' /* Додати рецепт */,
                              ),
                              icon: Icon(
                                Icons.edit_note_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 318.0,
                                height: 50.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if ((FFAppState().choosedDate != null) &&
                                    (FFAppState().tag != null &&
                                        FFAppState().tag != '')) {
                                  await widget!.listOfDishesRef!
                                      .update(createListOfDishesRecordData(
                                    tag: FFAppState().tag,
                                    date: FFAppState().choosedDate,
                                    name: _model.textController.text,
                                    userID: FFAppState().userID,
                                  ));
                                  if (FFAppState().isDateRange) {
                                    FFAppState().dateRange = functions
                                        .dateRange(FFAppState().choosedDate!,
                                            FFAppState().chooseSecDate)!
                                        .toList()
                                        .cast<DateTime>();
                                    setState(() {});
                                    _model.index = 1;
                                    setState(() {});
                                    while (_model.index! <
                                        FFAppState().dateRange.length) {
                                      await actions
                                          .duplicateDishesAndIngredients(
                                        widget!.listOfDishesRef!,
                                        FFAppState().dateRange[_model.index!],
                                      );
                                      _model.index = _model.index! + 1;
                                      setState(() {});
                                    }
                                  }

                                  context.goNamed('HomePlannerPage');

                                  FFAppState().choosedDate = null;
                                  FFAppState().isDateRange = false;
                                  FFAppState().chooseSecDate = null;
                                  FFAppState().tag = '';
                                  FFAppState().dateRange = [];
                                  FFAppState().update(() {});
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: NotFieldErrorWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                'kc9tfw40' /* Додати */,
                              ),
                              options: FFButtonOptions(
                                width: 318.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    130.0, 0.0, 130.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF57F44),
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
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
  }
}
