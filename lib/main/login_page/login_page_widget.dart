import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 370.0.ms,
            duration: 780.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 510.0.ms,
            duration: 1250.0.ms,
            begin: Offset(0.0, 200.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 760.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 760.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Xnip2023-11-14_15-48-41-removebg.png',
                    width: 331.0,
                    height: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 450.0,
                height: 300.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.29, 0.0),
                      child: Container(
                        width: 430.0,
                        height: 800.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Xnip2023-09-16_13-13-05.jpg',
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.09, -0.49),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          FFAppState().currentUserRef = currentUserReference;
                          FFAppState().userID = currentUserUid;
                          FFAppState().lastDaySetMileage = getCurrentTimestamp;
                          FFAppState().update(() {});

                          context.pushNamedAuth('HubPage', context.mounted);
                        },
                        text: FFLocalizations.of(context).getText(
                          'fmkm4vpe' /* Вхід з Google */,
                        ),
                        icon: Icon(
                          FFIcons.kgoogle,
                          color: Color(0x914B39EF),
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: 250.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          color: Colors.white,
                          textStyle: GoogleFonts.getFont(
                            'Inter',
                            color: Color(0xFF606060),
                            fontSize: 16.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation1']!),
                    ),
                    isAndroid
                        ? Container()
                        : Align(
                            alignment: AlignmentDirectional(-0.09, -0.01),
                            child: FFButtonWidget(
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                final user =
                                    await authManager.signInWithApple(context);
                                if (user == null) {
                                  return;
                                }
                                FFAppState().currentUserRef =
                                    currentUserReference;
                                FFAppState().userID = currentUserUid;
                                FFAppState().lastDaySetMileage =
                                    getCurrentTimestamp;
                                FFAppState().update(() {});

                                context.pushNamedAuth(
                                    'WellcomePage', context.mounted);
                              },
                              text: FFLocalizations.of(context).getText(
                                'z0vadp7z' /* Вхід з Apple */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                                color: Color(0x914B39EF),
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                width: 250.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Inter',
                                  color: Color(0xFF606060),
                                  fontSize: 16.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation2']!),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
