import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_notifications_model.dart';
export 'settings_notifications_model.dart';

class SettingsNotificationsWidget extends StatefulWidget {
  const SettingsNotificationsWidget({super.key});

  @override
  State<SettingsNotificationsWidget> createState() =>
      _SettingsNotificationsWidgetState();
}

class _SettingsNotificationsWidgetState
    extends State<SettingsNotificationsWidget> {
  late SettingsNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsNotificationsModel());
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
          iconTheme: IconThemeData(color: Color(0xFFF57F44)),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: '',
              icon: Icon(
                FFIcons.kaltArrowLeft,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 24.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF5F5F5),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Color(0xFFF57F44),
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'vvzp9nru' /* Сповіщення */,
            ),
            style: GoogleFonts.getFont(
              'Inter',
              color: Color(0xFF0B0B0B),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '6y8vuvih' /* Година, о которій надходять сп... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<UsersRecord>(
                    stream:
                        UsersRecord.getDocument(FFAppState().currentUserRef!),
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

                      final dropDownUsersRecord = snapshot.data!;

                      return FlutterFlowDropDown<int>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<int>(
                          _model.dropDownValue ??=
                              dropDownUsersRecord.pushNotificationServerHour,
                        ),
                        options: List<int>.from([
                          5,
                          6,
                          7,
                          8,
                          9,
                          10,
                          11,
                          12,
                          13,
                          14,
                          15,
                          16,
                          17,
                          18,
                          19,
                          20
                        ]),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            '4tp145uv' /* 05:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '8x7xb1p7' /* 06:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'tjx1jvng' /* 07:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'g000n8bv' /* 08:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'jta2por3' /* 09:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'ta48ajxw' /* 10:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'gjbdoh0l' /* 11:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'lklfc3b4' /* 12:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'isnca8z2' /* 13:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'voe8ig9o' /* 14:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6beriiu6' /* 15:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'i6giq53o' /* 16:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'm0azsprf' /* 17:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'qay86yu4' /* 18:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'rka9l64u' /* 19:00 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6jmqefyq' /* 20:00 */,
                          )
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          await FFAppState()
                              .currentUserRef!
                              .update(createUsersRecordData(
                                pushNotificationServerHour:
                                    _model.dropDownValue,
                              ));
                          FFAppState().TodayPlannerNotificationHour =
                              _model.dropDownValue!;
                          safeSetState(() {});
                        },
                        height: 50.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          '9lawvclt' /* Оберіть час сповіщень */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 15.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
