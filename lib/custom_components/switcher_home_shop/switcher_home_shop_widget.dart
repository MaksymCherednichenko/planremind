import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switcher_home_shop_model.dart';
export 'switcher_home_shop_model.dart';

class SwitcherHomeShopWidget extends StatefulWidget {
  const SwitcherHomeShopWidget({
    super.key,
    bool? isHome,
  }) : this.isHome = isHome ?? false;

  final bool isHome;

  @override
  State<SwitcherHomeShopWidget> createState() => _SwitcherHomeShopWidgetState();
}

class _SwitcherHomeShopWidgetState extends State<SwitcherHomeShopWidget> {
  late SwitcherHomeShopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitcherHomeShopModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.switcherValue = widget!.isHome;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.5, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'nu0juiqw' /* Home */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: _model.switcherValue
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.switcherValue = !_model.switcherValue;
            safeSetState(() {});
          },
          child: Container(
            width: 32.0,
            height: 16.0,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  width: 32.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      valueOrDefault<double>(
                        _model.switcherValue ? -1.0 : 1.0,
                        -1.0,
                      ),
                      0.0),
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).home,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2.5, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'se12gpd4' /* Shop */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: !_model.switcherValue
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
