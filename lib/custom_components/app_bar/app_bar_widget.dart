import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    Color? colorButton,
    bool? isSettingButton,
    bool? isAddButton,
  })  : this.colorButton = colorButton ?? const Color(0xFFF57F44),
        this.isSettingButton = isSettingButton ?? false,
        this.isAddButton = isAddButton ?? false;

  final String? title;
  final Color colorButton;
  final bool isSettingButton;
  final bool isAddButton;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: valueOrDefault<Color>(
                    widget!.colorButton,
                    FlutterFlowTheme.of(context).home,
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget!.title!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  if (widget!.isSettingButton)
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 0.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        FFIcons.ksettingsGrey,
                        color: valueOrDefault<Color>(
                          widget!.colorButton,
                          FlutterFlowTheme.of(context).home,
                        ),
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('Settings');
                      },
                    ),
                  if (widget!.isAddButton)
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 0.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: valueOrDefault<Color>(
                          widget!.colorButton,
                          FlutterFlowTheme.of(context).home,
                        ),
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                ],
              ),
            ],
          ),
        ].addToStart(SizedBox(width: 19.0)).addToEnd(SizedBox(width: 19.0)),
      ),
    );
  }
}
