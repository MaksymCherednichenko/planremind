import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home_modul/kitchen/storage_page/not_field_category/not_field_category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_item_household_model.dart';
export 'edit_item_household_model.dart';

class EditItemHouseholdWidget extends StatefulWidget {
  const EditItemHouseholdWidget({
    super.key,
    required this.itemInLibrary,
  });

  final AddItemHouseholdRecord? itemInLibrary;

  @override
  State<EditItemHouseholdWidget> createState() =>
      _EditItemHouseholdWidgetState();
}

class _EditItemHouseholdWidgetState extends State<EditItemHouseholdWidget> {
  late EditItemHouseholdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditItemHouseholdModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.bottonClick = () {
        if (widget!.itemInLibrary?.unit == 'g') {
          return 1;
        } else if (widget!.itemInLibrary?.unit == 'kg') {
          return 2;
        } else if (widget!.itemInLibrary?.unit == 'piece') {
          return 3;
        } else if (widget!.itemInLibrary?.unit == 'ml') {
          return 4;
        } else if (widget!.itemInLibrary?.unit == 'l') {
          return 5;
        } else {
          return 0;
        }
      }();
      _model.updatePage(() {});
      FFAppState().setQuantityDouble = valueOrDefault<double>(
        widget!.itemInLibrary?.quantity,
        0.0,
      );
      FFAppState().setQuantityInt = valueOrDefault<int>(
        valueOrDefault<double>(
          widget!.itemInLibrary?.quantity,
          0.0,
        ).toInt(),
        0,
      );
      FFAppState().unit = widget!.itemInLibrary!.unit;
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

    _model.textController ??=
        TextEditingController(text: widget!.itemInLibrary?.name);
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
      child: Container(
        width: 327.0,
        height: 550.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                -2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.0,
                    decoration: BoxDecoration(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'b4g1jhdg' /* Edit Item */,
                      ),
                      style: GoogleFonts.getFont(
                        'Inter',
                        color: Color(0xFF0B0B0B),
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
              Container(
                width: 437.0,
                height: 464.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??=
                                      widget!.itemInLibrary?.category != null &&
                                              widget!.itemInLibrary?.category !=
                                                  ''
                                          ? widget!.itemInLibrary?.category
                                          : null,
                                ),
                                options: FFAppState().categoryHousehold,
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  await widget!.itemInLibrary!.reference
                                      .update(createAddItemHouseholdRecordData(
                                    category: _model.dropDownValue,
                                  ));
                                },
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'g1djl29i' /* Category */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 15.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onFieldSubmitted: (_) async {
                                        await AddItemLibraryRecord.createDoc(
                                                FFAppState().currentUserRef!)
                                            .set(createAddItemLibraryRecordData(
                                          name: _model.textController.text,
                                        ));
                                      },
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'imwol8nc' /* Name */,
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE4E4E4),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
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
                            width: 40.0,
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
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.dropDownValue == null) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: NotFieldCategoryWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      return;
                                    }

                                    await widget!.itemInLibrary!.reference
                                        .update(
                                            createAddItemHouseholdRecordData(
                                      name: _model.textController.text,
                                      quantity: FFAppState().setQuantity,
                                      unit: FFAppState().unit,
                                      category: _model.dropDownValue,
                                    ));
                                    Navigator.pop(context);
                                    FFAppState().setQuantityInt = 0;
                                    FFAppState().setQuantityDouble = 0.0;
                                    FFAppState().unit = '';
                                    FFAppState().setQuantity = 0.0;
                                    FFAppState().update(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'v62ipaar' /* Save */,
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
                                    await widget!.itemInLibrary!.reference
                                        .delete();
                                    Navigator.pop(context);
                                    FFAppState().setQuantityInt = 0;
                                    FFAppState().setQuantityDouble = 0.0;
                                    FFAppState().unit = '';
                                    FFAppState().setQuantity = 0.0;
                                    FFAppState().update(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '4wpo2wsd' /* Delete */,
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
