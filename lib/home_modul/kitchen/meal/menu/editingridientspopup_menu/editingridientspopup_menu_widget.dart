import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editingridientspopup_menu_model.dart';
export 'editingridientspopup_menu_model.dart';

class EditingridientspopupMenuWidget extends StatefulWidget {
  const EditingridientspopupMenuWidget({
    super.key,
    this.menuIngridient,
  });

  final MenuItemIngredientsRecord? menuIngridient;

  @override
  State<EditingridientspopupMenuWidget> createState() =>
      _EditingridientspopupMenuWidgetState();
}

class _EditingridientspopupMenuWidgetState
    extends State<EditingridientspopupMenuWidget> {
  late EditingridientspopupMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditingridientspopupMenuModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.buttonClick = () {
        if (widget!.menuIngridient?.unit == 'g') {
          return 1;
        } else if (widget!.menuIngridient?.unit == 'kg') {
          return 2;
        } else if (widget!.menuIngridient?.unit == 'piece') {
          return 3;
        } else if (widget!.menuIngridient?.unit == 'ml') {
          return 4;
        } else if (widget!.menuIngridient?.unit == 'l') {
          return 5;
        } else {
          return 0;
        }
      }();
      _model.updatePage(() {});
      FFAppState().setQuantityDouble = widget!.menuIngridient!.quantity;
      FFAppState().setQuantityInt = valueOrDefault<int>(
        widget!.menuIngridient!.quantity.toInt(),
        0,
      );
      FFAppState().unit = widget!.menuIngridient!.unit;
      FFAppState().setQuantity = () {
        if (FFAppState().setQuantityInt > 0) {
          return FFAppState().setQuantityInt.toDouble();
        } else if (FFAppState().setQuantityDouble > 0.0) {
          return FFAppState().setQuantityDouble;
        } else {
          return 0.0;
        }
      }();
      FFAppState().update(() {});
    });

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 100.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          width: 327.0,
          height: 491.0,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: StreamBuilder<MenuItemIngredientsRecord>(
              stream: MenuItemIngredientsRecord.getDocument(
                  widget!.menuIngridient!.reference),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFF57F44),
                        ),
                      ),
                    ),
                  );
                }

                final columnMenuItemIngredientsRecord = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.0,
                          decoration: BoxDecoration(),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '2egjgcni' /* Редагувати */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            FFAppState().setQuantityInt = 0;
                            FFAppState().setQuantityDouble = 0.0;
                            FFAppState().unit = '';
                            FFAppState().update(() {});
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 270.0,
                                child: TextFormField(
                                  controller: _model.textController ??=
                                      TextEditingController(
                                    text: columnMenuItemIngredientsRecord.name,
                                  ),
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'aqh32xk2' /* Name */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF0B0B0B),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          lineHeight: 2.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE4E4E4),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE4E4E4),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.customCountControllerModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: CustomCountControllerWidget(
                          isButtonDisable: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 50.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget!.menuIngridient!.reference
                                    .update(createMenuItemIngredientsRecordData(
                                  name: _model.textController.text,
                                  quantity: FFAppState().setQuantity,
                                  inStock: false,
                                  unit: FFAppState().unit,
                                  removeToShopList: 'Add to list',
                                ));
                                Navigator.pop(context);
                                FFAppState().setQuantityInt = 0;
                                FFAppState().setQuantityDouble = 0.0;
                                FFAppState().unit = '';
                                FFAppState().setQuantity = 0.0;
                                FFAppState().update(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'suwx5810' /* Save */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 54.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF57F44),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget!.menuIngridient!.reference
                                    .delete();
                                Navigator.pop(context);
                                FFAppState().setQuantityInt = 0;
                                FFAppState().setQuantityDouble = 0.0;
                                FFAppState().unit = '';
                                FFAppState().setQuantity = 0.0;
                                FFAppState().update(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '9q0emc6f' /* Delete */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 54.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF54444),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
