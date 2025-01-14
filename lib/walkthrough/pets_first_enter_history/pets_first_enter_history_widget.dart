import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_first_enter_history_model.dart';
export 'pets_first_enter_history_model.dart';

class PetsFirstEnterHistoryWidget extends StatefulWidget {
  const PetsFirstEnterHistoryWidget({super.key});

  @override
  State<PetsFirstEnterHistoryWidget> createState() =>
      _PetsFirstEnterHistoryWidgetState();
}

class _PetsFirstEnterHistoryWidgetState
    extends State<PetsFirstEnterHistoryWidget> {
  late PetsFirstEnterHistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsFirstEnterHistoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Container(
          width: 320.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xE0F8F3F3),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'c09dc14l' /* В Історії Ви можете знайти под... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
