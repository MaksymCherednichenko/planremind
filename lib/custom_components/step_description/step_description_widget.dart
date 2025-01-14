import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'step_description_model.dart';
export 'step_description_model.dart';

class StepDescriptionWidget extends StatefulWidget {
  const StepDescriptionWidget({
    super.key,
    required this.ind,
  });

  final int? ind;

  @override
  State<StepDescriptionWidget> createState() => _StepDescriptionWidgetState();
}

class _StepDescriptionWidgetState extends State<StepDescriptionWidget> {
  late StepDescriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepDescriptionModel());

    _model.textController ??= TextEditingController(
        text: FFAppState().recipeSteps.elementAtOrNull(widget!.ind!));
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 2000),
          () async {
            FFAppState().updateRecipeStepsAtIndex(
              widget!.ind!,
              (_) => _model.textController.text,
            );
            safeSetState(() {});
          },
        ),
        onFieldSubmitted: (_) async {
          FFAppState().updateRecipeStepsAtIndex(
            widget!.ind!,
            (_) => _model.textController.text,
          );
          safeSetState(() {});
        },
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          suffixIcon: _model.textController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    _model.textController?.clear();
                    FFAppState().updateRecipeStepsAtIndex(
                      widget!.ind!,
                      (_) => _model.textController.text,
                    );
                    safeSetState(() {});
                    safeSetState(() {});
                  },
                  child: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 15.0,
                  ),
                )
              : null,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              fontSize: 15.0,
              letterSpacing: 0.0,
            ),
        maxLines: 3,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
