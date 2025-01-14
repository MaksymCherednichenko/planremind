import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_box_model.dart';
export 'check_box_model.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    this.setCheckBox,
    required this.setValue,
  });

  final bool? setCheckBox;
  final Future Function(bool value)? setValue;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late CheckBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.setCheckBox != null) {
        _model.checkBoxValue = widget!.setCheckBox!;
        _model.updatePage(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.checkBoxValue = true;
            _model.updatePage(() {});
            await widget.setValue?.call(
              _model.checkBoxValue,
            );
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Checkbox.png',
                ).image,
              ),
            ),
          ),
        ),
        if (_model.checkBoxValue)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.checkBoxValue = false;
              _model.updatePage(() {});
              await widget.setValue?.call(
                _model.checkBoxValue,
              );
            },
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Frame_34970.png',
                  ).image,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
