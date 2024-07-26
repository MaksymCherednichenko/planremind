import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'total_sum_model.dart';
export 'total_sum_model.dart';

class TotalSumWidget extends StatefulWidget {
  const TotalSumWidget({
    super.key,
    this.sum,
    required this.historyRef,
  });

  final double? sum;
  final DocumentReference? historyRef;

  @override
  State<TotalSumWidget> createState() => _TotalSumWidgetState();
}

class _TotalSumWidgetState extends State<TotalSumWidget> {
  late TotalSumModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalSumModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      formatNumber(
        widget!.sum,
        formatType: FormatType.custom,
        format: '####.##',
        locale: '',
      ),
      '0',
    ));
    _model.textFieldFocusNode ??= FocusNode();
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'zlrvi890' /* Загальна сума */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Container(
            width: 150.0,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 2000),
                () async {
                  await widget!.historyRef!
                      .update(createHistoryShoppingListRecordData(
                    totalSum: double.tryParse(_model.textController.text),
                  ));
                },
              ),
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
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.end,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
      ],
    );
  }
}
