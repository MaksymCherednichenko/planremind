import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/custom_components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    _model.switchValue =
        FFAppState().unitSystem == UnitSystemsEnum.imperial ? true : false;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarWidget(
                  title: 'Налаштування',
                  colorButton: FlutterFlowTheme.of(context).home,
                  isSettingButton: false,
                  isAddButton: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setAppLanguage(context, 'en');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '4kpeqt2p' /* ENG */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: valueOrDefault<Color>(
                                  FFLocalizations.of(context).languageCode ==
                                          'uk'
                                      ? Color(0xCC6D6D6D)
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  Colors.black,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '94sm86j1' /*    */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setAppLanguage(context, 'uk');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mcs61zcm' /* UKR */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: valueOrDefault<Color>(
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? Color(0xCC6D6D6D)
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  Colors.black,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('AccountSettings');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.account_box,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'f8o72jix' /* Профіль та підписки */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          'Settings_Storage_FoodCategories');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          FFIcons.kwidget4,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'dotf426g' /* Категорії для Сховку */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('SettingsShops');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.shopping_cart_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            's8i5pqoh' /* Магазини */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('FriendsPage');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: FaIcon(
                                          FontAwesomeIcons.userFriends,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 20.0,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'aqiihlos' /* Друзі */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('SettingsModules');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.view_module_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'r5sk7oja' /* Модулі */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.isUnits) {
                                            _model.isUnits = false;
                                            safeSetState(() {});
                                          } else {
                                            _model.isUnits = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.view_module_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .home,
                                            ),
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wm7q3olv' /* Система виміру */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            trailing: Icon(
                                              Icons.chevron_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .home,
                                              size: 24.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Transform.rotate(
                                      angle: 90.0 * (math.pi / 180),
                                      child: Visibility(
                                        visible: _model.isUnits,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 10.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderWidth: 0.0,
                                            buttonSize: 48.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.chevron_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .home,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model.isUnits)
                                Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFAppState().setUserUnits == 'US'
                                                ? FFLocalizations.of(context)
                                                    .getVariableText(
                                                    ukText: 'Імперські',
                                                    enText: 'Imperic',
                                                  )
                                                : FFLocalizations.of(context)
                                                    .getVariableText(
                                                    ukText: 'Метричні',
                                                    enText: 'Metric',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'm3ynx9bc' /* Euro */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Switch.adaptive(
                                                value: _model.switchValue!,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .switchValue = newValue!);
                                                  if (newValue!) {
                                                    FFAppState().setUserUnits =
                                                        'US';
                                                    FFAppState().unitSystem =
                                                        UnitSystemsEnum
                                                            .imperial;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      0,
                                                      (_) => 'oz',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      1,
                                                      (_) => 'pound',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      2,
                                                      (_) => 'piece',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      3,
                                                      (_) => 'pint',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      4,
                                                      (_) => 'liquid ounce',
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState().setUserUnits =
                                                        'Euro';
                                                    FFAppState().unitSystem =
                                                        UnitSystemsEnum.metric;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      0,
                                                      (_) => 'g',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      1,
                                                      (_) => 'kg',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      2,
                                                      (_) => 'piece',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      3,
                                                      (_) => 'l',
                                                    );
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateUnitsAtIndex(
                                                      4,
                                                      (_) => 'ml',
                                                    );
                                                    safeSetState(() {});
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .home,
                                                activeTrackColor:
                                                    Color(0xFFF0EEEE),
                                                inactiveTrackColor:
                                                    Color(0xFFF0EEEE),
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .home,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vnptuhqz' /* US */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context
                                          .pushNamed('Settings_Notifications');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.notifications_sharp,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            '6ihuaggm' /* Сповіщення */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await FFAppState()
                                          .currentUserRef!
                                          .update(createUsersRecordData(
                                            userLoginHistory:
                                                updateUserLoginHistoryStruct(
                                              UserLoginHistoryStruct(
                                                userLogginedEver: false,
                                                homeModuleOpened: false,
                                                carModuleOpened: false,
                                                plantModuleOpened: false,
                                                healthModuleOpened: false,
                                                petsModuleOpened: false,
                                                sportModuleOpened: false,
                                                petModulePetPageOpened: false,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                          ));

                                      context.pushNamed('WellcomePage');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.toc,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'e8fyqq2k' /* Пройти гайд заново */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Settings_help_center');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          FFIcons.kquestionCircle,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                        ),
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'r4me0mej' /* Допомога */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.chevron_right,
                                          color:
                                              FlutterFlowTheme.of(context).home,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 12.0, 30.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('LoginPage', context.mounted);
                    },
                    child: Icon(
                      FFIcons.klogout2,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
