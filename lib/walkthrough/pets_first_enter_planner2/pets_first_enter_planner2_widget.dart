import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_first_enter_planner2_model.dart';
export 'pets_first_enter_planner2_model.dart';

class PetsFirstEnterPlanner2Widget extends StatefulWidget {
  const PetsFirstEnterPlanner2Widget({super.key});

  @override
  State<PetsFirstEnterPlanner2Widget> createState() =>
      _PetsFirstEnterPlanner2WidgetState();
}

class _PetsFirstEnterPlanner2WidgetState
    extends State<PetsFirstEnterPlanner2Widget> {
  late PetsFirstEnterPlanner2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsFirstEnterPlanner2Model());
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
                '7t7i9f71' /* Планер - місце де показуватиму... */,
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
