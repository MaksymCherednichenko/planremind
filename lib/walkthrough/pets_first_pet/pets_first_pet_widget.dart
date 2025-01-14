import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pets_first_pet_model.dart';
export 'pets_first_pet_model.dart';

class PetsFirstPetWidget extends StatefulWidget {
  const PetsFirstPetWidget({super.key});

  @override
  State<PetsFirstPetWidget> createState() => _PetsFirstPetWidgetState();
}

class _PetsFirstPetWidgetState extends State<PetsFirstPetWidget> {
  late PetsFirstPetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsFirstPetModel());
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
            'wavj9t17' /* Давайте додамо вашого улюбленц... */,
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
