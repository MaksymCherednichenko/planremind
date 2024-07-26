import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home_modul/kitchen/calendar_popup/calendar_popup_widget.dart';
import '/home_modul/kitchen/storage_page/not_field_category/not_field_category_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_item_storage_food_model.dart';
export 'edit_item_storage_food_model.dart';

class EditItemStorageFoodWidget extends StatefulWidget {
  const EditItemStorageFoodWidget({
    super.key,
    required this.itemInLibrary,
  });

  final AddItemLibraryRecord? itemInLibrary;

  @override
  State<EditItemStorageFoodWidget> createState() =>
      _EditItemStorageFoodWidgetState();
}

class _EditItemStorageFoodWidgetState extends State<EditItemStorageFoodWidget> {
  late EditItemStorageFoodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditItemStorageFoodModel());

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
      FFAppState().choosedDate = widget!.itemInLibrary?.endDate;
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
          color: Color(0xFFF5F5F5),
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
                        'dglcnn9m' /* Edit Item */,
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
                      FFAppState().choosedDate = null;
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
                                options: FFAppState().category,
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  await widget!.itemInLibrary!.reference
                                      .update(createAddItemLibraryRecordData(
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
                                  's6f7vn6m' /* Category */,
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
                                          '64t722l3' /* Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF0B0B0B),
                                              fontSize: 13.0,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CalendarPopupWidget(),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: '',
                                      icon: Icon(
                                        FFIcons.kcalendarMinimalistic,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                230.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF5F5F5),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFFEE8B60),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xE8E4E4E4),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              'd/M/y',
                                              FFAppState().choosedDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'Take to',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 40.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
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
                                      if (widget!.itemInLibrary?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          widget!.itemInLibrary!.reference.id,
                                          FFAppState().userID,
                                        );

                                        await widget!.itemInLibrary!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          name: _model.textController.text,
                                          quantity: FFAppState().setQuantity,
                                          unit: FFAppState().unit,
                                          endDate: FFAppState().choosedDate,
                                          category: _model.dropDownValue,
                                        ));
                                        await actions.createUpcomingData();
                                      } else {
                                        await widget!.itemInLibrary!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          name: _model.textController.text,
                                          quantity: FFAppState().setQuantity,
                                          unit: FFAppState().unit,
                                          endDate: FFAppState().choosedDate,
                                          category: _model.dropDownValue,
                                        ));
                                        await actions.createUpcomingData();
                                      }

                                      Navigator.pop(context);
                                      FFAppState().setQuantityInt = 0;
                                      FFAppState().setQuantityDouble = 0.0;
                                      FFAppState().unit = '';
                                      FFAppState().choosedDate = null;
                                      FFAppState().setQuantity = 0.0;
                                      FFAppState().update(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'jgc8h2vb' /* Save */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                      if (widget!.itemInLibrary?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          widget!.itemInLibrary!.reference.id,
                                          FFAppState().userID,
                                        );
                                      }
                                      await widget!.itemInLibrary!.reference
                                          .delete();
                                      Navigator.pop(context);
                                      FFAppState().setQuantityInt = 0;
                                      FFAppState().setQuantityDouble = 0.0;
                                      FFAppState().unit = '';
                                      FFAppState().choosedDate = null;
                                      FFAppState().setQuantity = 0.0;
                                      FFAppState().update(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'pgjbz0tx' /* Delete */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
