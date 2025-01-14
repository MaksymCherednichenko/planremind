import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_planner_guide_model.dart';
export 'pets_planner_guide_model.dart';

class PetsPlannerGuideWidget extends StatefulWidget {
  const PetsPlannerGuideWidget({super.key});

  @override
  State<PetsPlannerGuideWidget> createState() => _PetsPlannerGuideWidgetState();
}

class _PetsPlannerGuideWidgetState extends State<PetsPlannerGuideWidget> {
  late PetsPlannerGuideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsPlannerGuideModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302.0,
      height: 302.0,
      decoration: BoxDecoration(
        color: Color(0xE0F8F3F3),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'z00c12sx' /* Давайте додамо першу подію */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                fontSize: 25.0,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
