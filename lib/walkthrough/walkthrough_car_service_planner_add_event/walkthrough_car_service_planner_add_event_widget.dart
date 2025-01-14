import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'walkthrough_car_service_planner_add_event_model.dart';
export 'walkthrough_car_service_planner_add_event_model.dart';

class WalkthroughCarServicePlannerAddEventWidget extends StatefulWidget {
  const WalkthroughCarServicePlannerAddEventWidget({super.key});

  @override
  State<WalkthroughCarServicePlannerAddEventWidget> createState() =>
      _WalkthroughCarServicePlannerAddEventWidgetState();
}

class _WalkthroughCarServicePlannerAddEventWidgetState
    extends State<WalkthroughCarServicePlannerAddEventWidget> {
  late WalkthroughCarServicePlannerAddEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => WalkthroughCarServicePlannerAddEventModel());
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
            'mzv0htg2' /* Давайте створимо першу подію
Н... */
            ,
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
