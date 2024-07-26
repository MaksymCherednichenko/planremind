import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_count_controller_model.dart';
export 'custom_count_controller_model.dart';

class CustomCountControllerWidget extends StatefulWidget {
  const CustomCountControllerWidget({
    super.key,
    bool? isButtonDisable,
  }) : this.isButtonDisable = isButtonDisable ?? false;

  final bool isButtonDisable;

  @override
  State<CustomCountControllerWidget> createState() =>
      _CustomCountControllerWidgetState();
}

class _CustomCountControllerWidgetState
    extends State<CustomCountControllerWidget> {
  late CustomCountControllerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCountControllerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.textController?.text =
            ((FFAppState().unit == 'kg') || (FFAppState().unit == 'l')
                    ? valueOrDefault<double>(
                        FFAppState().setQuantityDouble,
                        0.0,
                      )
                    : valueOrDefault<double>(
                        FFAppState().setQuantityInt.toDouble(),
                        0.0,
                      ))
                .toString();
        _model.textController?.selection =
            TextSelection.collapsed(offset: _model.textController!.text.length);
      });
    });

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      (FFAppState().unit == 'kg') || (FFAppState().unit == 'l')
          ? valueOrDefault<String>(
              formatNumber(
                FFAppState().setQuantityDouble,
                formatType: FormatType.custom,
                format: '####.##',
                locale: '',
              ),
              '0',
            )
          : valueOrDefault<String>(
              FFAppState().setQuantityInt.toString(),
              '0',
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FFButtonWidget(
                onPressed: widget!.isButtonDisable
                    ? null
                    : () async {
                        FFAppState().unit = FFAppState().units[0];
                        setState(() {});
                        _model.buttonClick = 1;
                        setState(() {});
                      },
                text: FFAppState().units[0],
                options: FFButtonOptions(
                  width: 45.0,
                  height: 40.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.buttonClick == 1 ? Colors.black : Colors.white,
                    Colors.white,
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: valueOrDefault<Color>(
                          _model.buttonClick == 1 ? Colors.white : Colors.black,
                          Colors.black,
                        ),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                showLoadingIndicator: false,
              ),
              FFButtonWidget(
                onPressed: widget!.isButtonDisable
                    ? null
                    : () async {
                        FFAppState().unit = FFAppState().units[1];
                        setState(() {});
                        _model.buttonClick = 2;
                        setState(() {});
                      },
                text: FFAppState().units[1],
                options: FFButtonOptions(
                  width: 45.0,
                  height: 40.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.buttonClick == 2 ? Colors.black : Colors.white,
                    Colors.white,
                  ),
                  textStyle: GoogleFonts.getFont(
                    'Inter',
                    color: valueOrDefault<Color>(
                      _model.buttonClick == 2 ? Colors.white : Colors.black,
                      Colors.black,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: widget!.isButtonDisable
                    ? null
                    : () async {
                        FFAppState().unit = FFAppState().units[2];
                        setState(() {});
                        _model.buttonClick = 3;
                        setState(() {});
                      },
                text: FFAppState().units[2],
                options: FFButtonOptions(
                  width: 45.0,
                  height: 40.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.buttonClick == 3 ? Colors.black : Colors.white,
                    Colors.white,
                  ),
                  textStyle: GoogleFonts.getFont(
                    'Inter',
                    color: valueOrDefault<Color>(
                      _model.buttonClick == 3 ? Colors.white : Colors.black,
                      Colors.black,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: widget!.isButtonDisable
                    ? null
                    : () async {
                        FFAppState().unit = FFAppState().units[3];
                        setState(() {});
                        _model.buttonClick = 4;
                        setState(() {});
                      },
                text: FFAppState().units[3],
                options: FFButtonOptions(
                  width: 45.0,
                  height: 40.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.buttonClick == 4 ? Colors.black : Colors.white,
                    Colors.white,
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: valueOrDefault<Color>(
                          _model.buttonClick == 4 ? Colors.white : Colors.black,
                          Colors.black,
                        ),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: widget!.isButtonDisable
                    ? null
                    : () async {
                        FFAppState().unit = FFAppState().units[4];
                        setState(() {});
                        _model.buttonClick = 5;
                        setState(() {});
                      },
                text: FFAppState().units[4],
                options: FFButtonOptions(
                  width: FFAppState().units[4] == 'liquid ounce' ? 70.0 : 45.0,
                  height: 40.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.buttonClick == 5 ? Colors.black : Colors.white,
                    Colors.white,
                  ),
                  textStyle: GoogleFonts.getFont(
                    'Inter',
                    color: valueOrDefault<Color>(
                      _model.buttonClick == 5 ? Colors.white : Colors.black,
                      Colors.black,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Color(0xFFE4E4E4),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x00FFFFFF),
                        borderRadius: 9.0,
                        borderWidth: 0.0,
                        buttonSize: 37.0,
                        fillColor: Colors.white,
                        disabledColor: Color(0xFFE4E4E4),
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: Colors.black,
                          size: 12.0,
                        ),
                        onPressed: (valueOrDefault<double>(
                                  (FFAppState().unit == 'kg') ||
                                          (FFAppState().unit == 'l')
                                      ? valueOrDefault<double>(
                                          FFAppState().setQuantityDouble,
                                          0.0,
                                        )
                                      : valueOrDefault<double>(
                                          FFAppState()
                                              .setQuantityInt
                                              .toDouble(),
                                          0.0,
                                        ),
                                  0.0,
                                ) ==
                                0.0)
                            ? null
                            : () async {
                                if ((FFAppState().unit == 'kg') ||
                                    (FFAppState().unit == 'l')) {
                                  FFAppState().setQuantityDouble =
                                      FFAppState().setQuantityDouble + -0.5;
                                  FFAppState().update(() {});
                                  setState(() {
                                    _model.textController?.text =
                                        valueOrDefault<String>(
                                      formatNumber(
                                        FFAppState().setQuantityDouble,
                                        formatType: FormatType.custom,
                                        format: '####.##',
                                        locale: '',
                                      ),
                                      '0',
                                    );
                                    _model.textController?.selection =
                                        TextSelection.collapsed(
                                            offset: _model
                                                .textController!.text.length);
                                  });
                                  FFAppState().setQuantity =
                                      FFAppState().setQuantityDouble;
                                  setState(() {});
                                } else {
                                  if ((FFAppState().unit == 'piece') ||
                                      (FFAppState().unit == 'oz') ||
                                      (FFAppState().unit == 'pound') ||
                                      (FFAppState().unit == 'pint') ||
                                      (FFAppState().unit == 'liquid ounce') ||
                                      (FFAppState().unit == 'quart')) {
                                    FFAppState().setQuantityInt =
                                        FFAppState().setQuantityInt + -1;
                                    FFAppState().update(() {});
                                  } else {
                                    if (FFAppState().setQuantityInt <= 100) {
                                      FFAppState().setQuantityInt = 0;
                                      FFAppState().update(() {});
                                    } else {
                                      FFAppState().setQuantityInt =
                                          FFAppState().setQuantityInt + -100;
                                      FFAppState().update(() {});
                                    }
                                  }

                                  setState(() {
                                    _model.textController?.text =
                                        valueOrDefault<String>(
                                      FFAppState().setQuantityInt.toString(),
                                      '0',
                                    );
                                    _model.textController?.selection =
                                        TextSelection.collapsed(
                                            offset: _model
                                                .textController!.text.length);
                                  });
                                  FFAppState().setQuantity =
                                      FFAppState().setQuantityInt.toDouble();
                                  setState(() {});
                                }
                              },
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 0),
                              () async {
                                if (!((FFAppState().unit == 'kg') ||
                                    (FFAppState().unit == 'l'))) {
                                  FFAppState().setQuantityInt =
                                      int.parse(_model.textController.text);
                                  FFAppState().update(() {});
                                  setState(() {
                                    _model.textController?.text =
                                        valueOrDefault<String>(
                                      FFAppState().setQuantityInt.toString(),
                                      '0',
                                    );
                                    _model.textController?.selection =
                                        TextSelection.collapsed(
                                            offset: _model
                                                .textController!.text.length);
                                  });
                                  FFAppState().setQuantity =
                                      FFAppState().setQuantityInt.toDouble();
                                  setState(() {});
                                } else {
                                  FFAppState().setQuantityDouble =
                                      double.parse(_model.textController.text);
                                  FFAppState().update(() {});
                                  setState(() {
                                    _model.textController?.text =
                                        valueOrDefault<String>(
                                      formatNumber(
                                        FFAppState().setQuantityDouble,
                                        formatType: FormatType.custom,
                                        format: '####.##',
                                        locale: '',
                                      ),
                                      '0',
                                    );
                                    _model.textController?.selection =
                                        TextSelection.collapsed(
                                            offset: _model
                                                .textController!.text.length);
                                  });
                                  FFAppState().setQuantity =
                                      FFAppState().setQuantityDouble;
                                  setState(() {});
                                }
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.center,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x00FFFFFF),
                        borderRadius: 9.0,
                        borderWidth: 0.0,
                        buttonSize: 37.0,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if ((FFAppState().unit == 'kg') ||
                              (FFAppState().unit == 'l')) {
                            FFAppState().setQuantityDouble =
                                FFAppState().setQuantityDouble + 0.5;
                            FFAppState().update(() {});
                            setState(() {
                              _model.textController?.text =
                                  valueOrDefault<String>(
                                formatNumber(
                                  FFAppState().setQuantityDouble,
                                  formatType: FormatType.custom,
                                  format: '####.##',
                                  locale: '',
                                ),
                                '0',
                              );
                              _model.textController?.selection =
                                  TextSelection.collapsed(
                                      offset:
                                          _model.textController!.text.length);
                            });
                            FFAppState().setQuantity =
                                FFAppState().setQuantityDouble;
                            setState(() {});
                          } else {
                            if ((FFAppState().unit == 'piece') ||
                                (FFAppState().unit == 'oz') ||
                                (FFAppState().unit == 'pound') ||
                                (FFAppState().unit == 'pint') ||
                                (FFAppState().unit == 'liquid ounce') ||
                                (FFAppState().unit == 'quart')) {
                              FFAppState().setQuantityInt =
                                  FFAppState().setQuantityInt + 1;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().setQuantityInt =
                                  FFAppState().setQuantityInt + 100;
                              FFAppState().update(() {});
                            }

                            setState(() {
                              _model.textController?.text =
                                  valueOrDefault<String>(
                                FFAppState().setQuantityInt.toString(),
                                '0',
                              );
                              _model.textController?.selection =
                                  TextSelection.collapsed(
                                      offset:
                                          _model.textController!.text.length);
                            });
                            FFAppState().setQuantity =
                                FFAppState().setQuantityInt.toDouble();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
