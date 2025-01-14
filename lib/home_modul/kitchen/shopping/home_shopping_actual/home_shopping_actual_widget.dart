import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import '/home_modul/kitchen/storage_page/share_shop_list_for_user_popup/share_shop_list_for_user_popup_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_shopping_actual_model.dart';
export 'home_shopping_actual_model.dart';

class HomeShoppingActualWidget extends StatefulWidget {
  const HomeShoppingActualWidget({super.key});

  @override
  State<HomeShoppingActualWidget> createState() =>
      _HomeShoppingActualWidgetState();
}

class _HomeShoppingActualWidgetState extends State<HomeShoppingActualWidget> {
  late HomeShoppingActualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeShoppingActualModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
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
        floatingActionButton: FloatingActionButton(
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
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AddingridientspopupShoppingWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).home,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarWidget(
                  title: 'Home',
                  colorButton: FlutterFlowTheme.of(context).home,
                  isSettingButton: true,
                  isAddButton: false,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '7b3i19op' /* Shopping */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF57F44),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('HomePlannerPage');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'sbtl8jns' /* Planner */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('StorageFood');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'urlbnkua' /* Storage */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 59.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'nlwcov11' /* Поточний список */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.39,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF9EEE6),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color:
                                            FlutterFlowTheme.of(context).home,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed('HomeShoppingHistory');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'tsdg2fb4' /* Історія */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.39,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 5.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).home,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mald2apg' /* Нові пропозиції у скрині */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.mark_email_unread_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 10.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.shopListToDoneAllOutput =
                                          await queryShoppingListRecordOnce(
                                        parent: FFAppState().currentUserRef,
                                        queryBuilder: (shoppingListRecord) =>
                                            shoppingListRecord.where(Filter.or(
                                          Filter(
                                            'dateOfBuy',
                                            isGreaterThanOrEqualTo:
                                                functions.getDateOnly(
                                                    getCurrentTimestamp),
                                          ),
                                          Filter(
                                            'dateOfBuy',
                                            isEqualTo:
                                                dateTimeFromSecondsSinceEpoch(
                                                    functions.toInt('0')),
                                          ),
                                        )),
                                      );
                                      _model.loopIndex = 0;
                                      safeSetState(() {});
                                      while (_model.loopIndex <
                                          _model.shopListToDoneAllOutput!
                                              .length) {
                                        if (_model.shopListToDoneAllOutput
                                                ?.elementAtOrNull(
                                                    _model.loopIndex)
                                                ?.isBought ==
                                            false) {
                                          await _model.shopListToDoneAllOutput!
                                              .elementAtOrNull(
                                                  _model.loopIndex)!
                                              .reference
                                              .update(
                                                  createShoppingListRecordData(
                                                isBought: true,
                                                dateOfBuy:
                                                    functions.getDateOnly(
                                                        getCurrentTimestamp),
                                              ));
                                        }
                                        _model.loopIndex = _model.loopIndex + 1;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.done_all,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6k4cmnpp' /* Виконано усе */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                ),
                                if (_model.selectMode)
                                  Container(
                                    width: 105.0,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectMode = false;
                                        _model.selectedItemsList = [];
                                        safeSetState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.deselect_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5ij3uo5j' /* Скасувати */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                if (_model.selectMode == false)
                                  Container(
                                    width: 105.0,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectMode = true;
                                        safeSetState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.select_all,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'db9h64vt' /* Вибрати */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (_model.selectMode)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 15.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.selectedAll) {
                                            _model.selectedItemsList = [];
                                            _model.selectedAll = false;
                                            safeSetState(() {});
                                          } else {
                                            _model.selectAllOutput =
                                                await queryShoppingListRecordOnce(
                                              parent:
                                                  FFAppState().currentUserRef,
                                              queryBuilder:
                                                  (shoppingListRecord) =>
                                                      shoppingListRecord
                                                          .where(Filter.or(
                                                Filter(
                                                  'dateOfBuy',
                                                  isGreaterThanOrEqualTo:
                                                      functions.getDateOnly(
                                                          getCurrentTimestamp),
                                                ),
                                                Filter(
                                                  'dateOfBuy',
                                                  isEqualTo:
                                                      dateTimeFromSecondsSinceEpoch(
                                                          functions.toInt('0')),
                                                ),
                                              )),
                                            );
                                            _model.selectedItemsList = _model
                                                .selectAllOutput!
                                                .map((e) => e.reference)
                                                .toList()
                                                .cast<DocumentReference>();
                                            _model.selectedAll = true;
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.select_all,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6tpidpvc' /* Обрати все  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
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
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        ShareShopListForUserPopupWidget(
                                                      shopList: _model
                                                          .selectedItemsList,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            Icons.share_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        InkWell(
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
                                                              'Ви дійсно бажаєте видалити обрані записи?'),
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
                                              _model.loopIndex = 0;
                                              safeSetState(() {});
                                              while (_model.loopIndex <
                                                  _model.selectedItemsList
                                                      .length) {
                                                await _model.selectedItemsList
                                                    .elementAtOrNull(
                                                        _model.loopIndex)!
                                                    .delete();
                                                _model.loopIndex =
                                                    _model.loopIndex + 1;
                                                safeSetState(() {});
                                              }
                                              _model.selectedAll = false;
                                              _model.loopIndex = 0;
                                              _model.selectedItemsList = [];
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 28.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: StreamBuilder<List<ShoppingListRecord>>(
                          stream: _model.shopListCache(
                            requestFn: () => queryShoppingListRecord(
                              parent: FFAppState().currentUserRef,
                              queryBuilder: (shoppingListRecord) =>
                                  shoppingListRecord.where(Filter.or(
                                Filter(
                                  'dateOfBuy',
                                  isGreaterThanOrEqualTo: functions
                                      .getDateOnly(getCurrentTimestamp),
                                ),
                                Filter(
                                  'dateOfBuy',
                                  isEqualTo: dateTimeFromSecondsSinceEpoch(
                                      functions.toInt('0')),
                                ),
                              )),
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
                            List<ShoppingListRecord>
                                containerShoppingListRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 80.0),
                                child: Builder(
                                  builder: (context) {
                                    final shopList =
                                        containerShoppingListRecordList
                                            .toList();

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(shopList.length,
                                            (shopListIndex) {
                                          final shopListItem =
                                              shopList[shopListIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                          AddingridientspopupShoppingWidget(
                                                        ingridient:
                                                            shopListItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            onLongPress: () async {
                                              _model.selectMode = true;
                                              _model.selectedItemsList = [];
                                              _model.selectedAll = false;
                                              safeSetState(() {});
                                              _model.addToSelectedItemsList(
                                                  shopListItem.reference);
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 1.0,
                                                    color: Color(0x13000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .checkboxValueMap[shopListItem] ??=
                                                                        shopListItem
                                                                            .isBought,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.checkboxValueMap[shopListItem] =
                                                                              newValue!);
                                                                      if (newValue!) {
                                                                        await shopListItem
                                                                            .reference
                                                                            .update(createShoppingListRecordData(
                                                                          isBought:
                                                                              true,
                                                                          dateOfBuy:
                                                                              functions.getDateOnly(getCurrentTimestamp),
                                                                        ));
                                                                        _model.storageItemOutput =
                                                                            await queryStaffStorageRecordOnce(
                                                                          parent:
                                                                              FFAppState().currentUserRef,
                                                                          queryBuilder: (staffStorageRecord) =>
                                                                              staffStorageRecord.where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                shopListItem.name,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        if ((_model.storageItemOutput !=
                                                                                null) ==
                                                                            true) {
                                                                          await _model
                                                                              .storageItemOutput!
                                                                              .reference
                                                                              .update(createStaffStorageRecordData(
                                                                            count:
                                                                                functions.sumDouble(shopListItem.quantity, _model.storageItemOutput!.count),
                                                                          ));
                                                                        } else {
                                                                          await StaffStorageRecord.createDoc(FFAppState().currentUserRef!)
                                                                              .set(createStaffStorageRecordData(
                                                                            staffCategoryType:
                                                                                shopListItem.staffCategory,
                                                                            category:
                                                                                shopListItem.categoryFoodOrHousehold,
                                                                            name:
                                                                                shopListItem.name,
                                                                            count:
                                                                                shopListItem.quantity,
                                                                            unit:
                                                                                shopListItem.unit,
                                                                          ));
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        await shopListItem
                                                                            .reference
                                                                            .update(createShoppingListRecordData(
                                                                          isBought:
                                                                              false,
                                                                          dateOfBuy:
                                                                              dateTimeFromSecondsSinceEpoch(functions.toInt('0')),
                                                                        ));
                                                                        _model.storageItemOutputOff =
                                                                            await queryStaffStorageRecordOnce(
                                                                          parent:
                                                                              FFAppState().currentUserRef,
                                                                          queryBuilder: (staffStorageRecord) =>
                                                                              staffStorageRecord.where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                shopListItem.name,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        if (_model.storageItemOutputOff !=
                                                                            null) {
                                                                          if (_model.storageItemOutputOff!.count >
                                                                              shopListItem.quantity) {
                                                                            await _model.storageItemOutputOff!.reference.update(createStaffStorageRecordData(
                                                                              count: functions.minusDouble(_model.storageItemOutputOff!.count, shopListItem.quantity),
                                                                            ));
                                                                          } else {
                                                                            await _model.storageItemOutputOff!.reference.delete();
                                                                          }
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    side:
                                                                        BorderSide(
                                                                      width: 2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .home,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  shopListItem
                                                                      .name,
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
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                            Text(
                                                              '${shopListItem.quantity.toString()} ${shopListItem.unit?.name}',
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (shopListItem.isBought)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      4.0,
                                                                      7.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.selectMode)
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model
                                                              .selectedItemsList
                                                              .contains(shopListItem
                                                                  .reference)) {
                                                            _model.removeFromSelectedItemsList(
                                                                shopListItem
                                                                    .reference);
                                                            _model.selectedAll =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.addToSelectedItemsList(
                                                                shopListItem
                                                                    .reference);
                                                            safeSetState(() {});
                                                            if (containerShoppingListRecordList
                                                                    .length ==
                                                                _model
                                                                    .selectedItemsList
                                                                    .length) {
                                                              _model.selectedAll =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                    .selectedItemsList
                                                                    .contains(
                                                                        shopListItem
                                                                            .reference)
                                                                ? Color(
                                                                    0x67F57F44)
                                                                : Color(
                                                                    0x28979797),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(height: 5.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
