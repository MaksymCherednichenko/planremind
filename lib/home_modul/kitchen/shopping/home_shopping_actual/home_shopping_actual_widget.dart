import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import '/home_modul/kitchen/shopping/editingridientspopup_shopping/editingridientspopup_shopping_widget.dart';
import '/main/settings/user_friends/share_shoping_list_to/share_shoping_list_to_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
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
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.settings = await querySettingsCategoryAndShopRecordOnce(
        parent: FFAppState().currentUserRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().namesOfShops =
          _model.settings!.shops.toList().cast<String>();
      setState(() {});
      _model.sortByShop = [];
      _model.categoryTag = '';
      setState(() {});
      _model.createdSortList = await actions.createSortListFromShopNames(
        FFAppState().namesOfShops.toList(),
      );
      FFAppState().sortListFromShopsNames =
          _model.createdSortList!.toList().cast<String>();
      setState(() {});
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => setState(() {}),
                child: AppBarWidget(
                  title: 'Home',
                  colorButton: FlutterFlowTheme.of(context).home,
                  isSettingButton: true,
                  isAddButton: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 59.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                't63gma71' /* Shopping */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('HomePlannerPage');
                              },
                              text: FFLocalizations.of(context).getText(
                                '1z01i2jb' /* Planner */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(0.0),
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
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('StorageFood');
                              },
                              text: FFLocalizations.of(context).getText(
                                'j2e8qmsz' /* Storage */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(0.0),
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
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 59.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            'wdwvnmuq' /* Поточний список */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.39,
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
                                  color: FlutterFlowTheme.of(context).home,
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
                            context.pushNamed('HomeShoppingHistory');
                          },
                          text: FFLocalizations.of(context).getText(
                            'aixiys2i' /* Історія */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.39,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.isFilterOpen) {
                            _model.isFilterOpen = false;
                            setState(() {});
                          } else {
                            _model.isFilterOpen = true;
                            setState(() {});
                          }
                        },
                        child: Icon(
                          Icons.filter_list,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      if (_model.isFilterOpen)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.showFilterCategory == 1) {
                                      _model.showFilterCategory = 0;
                                      setState(() {});
                                    } else {
                                      _model.showFilterCategory = 1;
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'k4i5ux94' /* Сортувати по категоріям */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              if (_model.showFilterCategory == 1)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.isAllCategory) {
                                          _model.isAllCategory = false;
                                          setState(() {});
                                        } else {
                                          _model.isAllCategory = true;
                                          _model.categoryTag = '';
                                          setState(() {});
                                        }
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'm3y37i0j' /* Все */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  _model.isAllCategory
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.categoryTag == 'Food') {
                                          _model.categoryTag = '';
                                          _model.isAllCategory = true;
                                          setState(() {});
                                        } else {
                                          _model.categoryTag = 'Food';
                                          _model.isAllCategory = false;
                                          setState(() {});
                                        }
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'ctgd4508' /* Їжа */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  _model.categoryTag == 'Food'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.categoryTag == 'Household') {
                                          _model.categoryTag = '';
                                          _model.isAllCategory = true;
                                          setState(() {});
                                        } else {
                                          _model.categoryTag = 'Household';
                                          _model.isAllCategory = false;
                                          setState(() {});
                                        }
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'eaz5e3eb' /* Побутове */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  _model.categoryTag ==
                                                          'Household'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.showFilterCategory == 2) {
                                      _model.showFilterCategory = 0;
                                      setState(() {});
                                    } else {
                                      _model.showFilterCategory = 2;
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'v6pckmv2' /* Сортувати по магазинам */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              if (_model.showFilterCategory == 2)
                                Builder(
                                  builder: (context) {
                                    final sortByStores = FFAppState()
                                        .sortListFromShopsNames
                                        .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          List.generate(sortByStores.length,
                                              (sortByStoresIndex) {
                                        final sortByStoresItem =
                                            sortByStores[sortByStoresIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.index = 0;
                                            _model.numTemp = 0;
                                            setState(() {});
                                            while (_model.index! <
                                                _model.sortByShop.length) {
                                              if (sortByStoresItem ==
                                                  _model.sortByShop[
                                                      _model.index!]) {
                                                _model.numTemp =
                                                    _model.numTemp! + 1;
                                                setState(() {});
                                              }
                                              _model.index = _model.index! + 1;
                                              setState(() {});
                                            }
                                            if (_model.numTemp == 0) {
                                              _model.addToSortByShop(
                                                  sortByStoresItem);
                                              setState(() {});
                                            } else {
                                              _model.removeFromSortByShop(
                                                  sortByStoresItem);
                                              setState(() {});
                                            }
                                          },
                                          child: ListTile(
                                            title: Text(
                                              sortByStoresItem,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.sortByShop
                                                              .where((e) =>
                                                                  sortByStoresItem ==
                                                                  e)
                                                              .toList()
                                                              .isNotEmpty
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (_model.checkboxCheckedItems.length > 0)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StreamBuilder<List<ShoppingListRecord>>(
                          stream: queryShoppingListRecord(
                            parent: FFAppState().currentUserRef,
                            queryBuilder: (shoppingListRecord) =>
                                shoppingListRecord.where(
                              'bought',
                              isEqualTo: true,
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
                                iconShoppingListRecordList = snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.index = 0;
                                _model.boughtItemNum =
                                    iconShoppingListRecordList.length;
                                _model.forShareList = [];
                                setState(() {});
                                while (_model.index! < _model.boughtItemNum!) {
                                  _model.insertAtIndexInForShareList(
                                      _model.index!,
                                      iconShoppingListRecordList[
                                          _model.index!]);
                                  setState(() {});
                                  _model.index = _model.index! + 1;
                                  setState(() {});
                                }
                                if (_model.forShareList.isNotEmpty) {
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
                                          child: ShareShopingListToWidget(
                                            shoppingList: _model.forShareList,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                                _model.index = 0;
                                setState(() {});
                                while (_model.index! <
                                    iconShoppingListRecordList.length) {
                                  await iconShoppingListRecordList[
                                          _model.index!]
                                      .reference
                                      .update(createShoppingListRecordData(
                                        bought: false,
                                      ));
                                  _model.index = _model.index! + 1;
                                  setState(() {});
                                }
                                _model.isAllItemChoosed = false;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.share_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: StreamBuilder<List<ShoppingListRecord>>(
                            stream: queryShoppingListRecord(
                              parent: FFAppState().currentUserRef,
                              queryBuilder: (shoppingListRecord) =>
                                  shoppingListRecord.where(
                                'bought',
                                isEqualTo: true,
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
                                  iconShoppingListRecordList = snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.index = 0;
                                  setState(() {});
                                  while (_model.index! <
                                      iconShoppingListRecordList.length) {
                                    await iconShoppingListRecordList[
                                            _model.index!]
                                        .reference
                                        .delete();
                                    _model.index = _model.index! + 1;
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 28.0,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: StreamBuilder<List<ShoppingListRecord>>(
                            stream: queryShoppingListRecord(
                              parent: FFAppState().currentUserRef,
                              queryBuilder: (shoppingListRecord) =>
                                  shoppingListRecord.where(
                                'bought',
                                isEqualTo: true,
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
                                  buttonShoppingListRecordList = snapshot.data!;

                              return FFButtonWidget(
                                onPressed: (buttonShoppingListRecordList
                                            .length <=
                                        0)
                                    ? null
                                    : () async {
                                        _model.index = 0;
                                        _model.boughtItemNum =
                                            buttonShoppingListRecordList.length;
                                        setState(() {});
                                        unawaited(
                                          () async {
                                            await actions.moveToHistory();
                                          }(),
                                        );
                                        while (_model.index! <
                                            _model.boughtItemNum!) {
                                          if (buttonShoppingListRecordList[
                                                      _model.index!]
                                                  .categoryTag ==
                                              'Household') {
                                            await AddItemHouseholdRecord
                                                    .createDoc(FFAppState()
                                                        .currentUserRef!)
                                                .set(
                                                    createAddItemHouseholdRecordData(
                                              name:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .name,
                                              unit:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .unit,
                                              quantity:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .quantity,
                                            ));
                                          } else {
                                            await AddItemLibraryRecord
                                                    .createDoc(FFAppState()
                                                        .currentUserRef!)
                                                .set(
                                                    createAddItemLibraryRecordData(
                                              name:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .name,
                                              unit:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .unit,
                                              quantity:
                                                  buttonShoppingListRecordList[
                                                          _model.index!]
                                                      .quantity,
                                            ));
                                          }

                                          _model.index = _model.index! + 1;
                                          setState(() {});
                                        }
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'm62wgjbg' /* В історію */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.365,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFFFAFA),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF0B0B0B),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(13.0),
                                  disabledColor: Color(0xFFD8D7D7),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 12.0, 0.0, 0.0),
                  child: StreamBuilder<List<ShoppingListRecord>>(
                    stream: queryShoppingListRecord(
                      parent: FFAppState().currentUserRef,
                      queryBuilder: (shoppingListRecord) => shoppingListRecord
                          .where(
                            'quantity',
                            isGreaterThan: 0.0,
                          )
                          .whereIn('shop_name', _model.sortByShop)
                          .where(
                            'categoryTag',
                            isEqualTo: _model.isAllCategory
                                ? null
                                : _model.categoryTag,
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
                      List<ShoppingListRecord> textShoppingListRecordList =
                          snapshot.data!;

                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final firestoreBatch =
                              FirebaseFirestore.instance.batch();
                          try {
                            if (_model.isAllItemChoosed) {
                              _model.index = 0;
                              setState(() {});
                              while (_model.index! <
                                  textShoppingListRecordList.length) {
                                firestoreBatch.update(
                                    textShoppingListRecordList[_model.index!]
                                        .reference,
                                    createShoppingListRecordData(
                                      bought: false,
                                    ));
                                _model.index = _model.index! + 1;
                                setState(() {});
                              }
                              _model.isAllItemChoosed = false;
                              setState(() {});
                            } else {
                              _model.index = 0;
                              setState(() {});
                              while (_model.index! <
                                  textShoppingListRecordList.length) {
                                firestoreBatch.update(
                                    textShoppingListRecordList[_model.index!]
                                        .reference,
                                    createShoppingListRecordData(
                                      bought: true,
                                    ));
                                _model.index = _model.index! + 1;
                                setState(() {});
                              }
                              _model.isAllItemChoosed = true;
                              setState(() {});
                            }
                          } finally {
                            await firestoreBatch.commit();
                          }
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fdoo8lpk' /* Вибрати все */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Stack(
                    children: [
                      StreamBuilder<List<ShoppingListRecord>>(
                        stream: queryShoppingListRecord(
                          parent: FFAppState().currentUserRef,
                          queryBuilder: (shoppingListRecord) =>
                              shoppingListRecord
                                  .where(
                                    'quantity',
                                    isGreaterThan: 0.0,
                                  )
                                  .whereIn('shop_name', _model.sortByShop)
                                  .where(
                                    'categoryTag',
                                    isEqualTo: _model.isAllCategory
                                        ? null
                                        : _model.categoryTag,
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
                              listViewShoppingListRecordList = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewShoppingListRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewShoppingListRecord =
                                  listViewShoppingListRecordList[listViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
                                            value: _model.checkboxValueMap[
                                                    listViewShoppingListRecord] ??=
                                                listViewShoppingListRecord
                                                    .bought,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                          .checkboxValueMap[
                                                      listViewShoppingListRecord] =
                                                  newValue!);
                                              if (newValue!) {
                                                await listViewShoppingListRecord
                                                    .reference
                                                    .update(
                                                        createShoppingListRecordData(
                                                  bought: true,
                                                ));
                                              } else {
                                                await listViewShoppingListRecord
                                                    .reference
                                                    .update(
                                                        createShoppingListRecordData(
                                                  bought: false,
                                                ));
                                              }
                                            },
                                            side: BorderSide(
                                              width: 2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        EditingridientspopupShoppingWidget(
                                                                      shoppingListDoc:
                                                                          listViewShoppingListRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Text(
                                                            listViewShoppingListRecord
                                                                .name,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (listViewShoppingListRecord
                                                          .bought)
                                                        Text(
                                                          listViewShoppingListRecord
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    EditingridientspopupShoppingWidget(
                                                                  shoppingListDoc:
                                                                      listViewShoppingListRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Text(
                                                        '${formatNumber(
                                                          listViewShoppingListRecord
                                                              .quantity,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '####.##',
                                                          locale: '',
                                                        )} ${listViewShoppingListRecord.unit}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  EditingridientspopupShoppingWidget(
                                                                shoppingListDoc:
                                                                    listViewShoppingListRecord,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Text(
                                                      listViewShoppingListRecord
                                                          .shopName,
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AddingridientspopupShoppingWidget(),
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
                    ],
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
