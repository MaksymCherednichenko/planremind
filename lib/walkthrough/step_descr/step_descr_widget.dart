import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'step_descr_model.dart';
export 'step_descr_model.dart';

class StepDescrWidget extends StatefulWidget {
  const StepDescrWidget({super.key});

  @override
  State<StepDescrWidget> createState() => _StepDescrWidgetState();
}

class _StepDescrWidgetState extends State<StepDescrWidget> {
  late StepDescrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepDescrModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 504.0,
      height: 410.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Text(
        FFLocalizations.of(context).getText(
          'yj7kcc0a' /* Hello World */,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
