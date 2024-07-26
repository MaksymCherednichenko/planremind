import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editingridientspopup_model.dart';
export 'editingridientspopup_model.dart';

class EditingridientspopupWidget extends StatefulWidget {
  const EditingridientspopupWidget({
    super.key,
    this.listOfIngridientsRef,
  });

  final IngredientsOfDishesRecord? listOfIngridientsRef;

  @override
  State<EditingridientspopupWidget> createState() =>
      _EditingridientspopupWidgetState();
}

class _EditingridientspopupWidgetState
    extends State<EditingridientspopupWidget> {
  late EditingridientspopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditingridientspopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.buttonClick = () {
        if (widget!.listOfIngridientsRef?.unit == 'g') {
          return 1;
        } else if (widget!.listOfIngridientsRef?.unit == 'kg') {
          return 2;
        } else if (widget!.listOfIngridientsRef?.unit == 'piece') {
          return 3;
        } else if (widget!.listOfIngridientsRef?.unit == 'ml') {
          return 4;
        } else if (widget!.listOfIngridientsRef?.unit == 'l') {
          return 5;
        } else {
          return 0;
        }
      }();
      _model.updatePage(() {});
      FFAppState().setQuantityDouble = valueOrDefault<double>(
        widget!.listOfIngridientsRef?.quantity,
        0.0,
      );
      FFAppState().setQuantityInt = valueOrDefault<int>(
        valueOrDefault<double>(
          widget!.listOfIngridientsRef?.quantity,
          0.0,
        ).toInt(),
        0,
      );
      FFAppState().unit = widget!.listOfIngridientsRef!.unit;
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
      _model.allFoodInStock = await queryAddItemLibraryRecordOnce(
        parent: FFAppState().currentUserRef,
      );
    });
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
            child: StreamBuilder<IngredientsOfDishesRecord>(
              stream: IngredientsOfDishesRecord.getDocument(
                  widget!.listOfIngridientsRef!.reference),
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

                final columnIngredientsOfDishesRecord = snapshot.data!;

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
                            'eorckk0k' /* Редагування */,
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
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(
                                      text:
                                          columnIngredientsOfDishesRecord.name),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return _model.allFoodInStock!
                                        .map((e) => e.name)
                                        .toList()
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.textFieldKey,
                                      textController: _model.textController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      textHighlightStyle: TextStyle(),
                                      elevation: 0.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() => _model
                                        .textFieldSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.textFieldFocusNode = focusNode;

                                    _model.textController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.textFieldKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'ti5ic8ic' /* Name */,
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
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    );
                                  },
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
                          isButtonDisable: _model.textController.text ==
                              _model.textFieldSelectedOption,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 29.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: Color(0xFF57636C),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??=
                                      columnIngredientsOfDishesRecord.inStock,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                  },
                                  side: BorderSide(
                                    width: 2,
                                    color: Color(0xFF57636C),
                                  ),
                                  activeColor: Color(0xFFF5F5F5),
                                  checkColor: Color(0xFF57636C),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '5eh02cc8' /* Маю це вдома */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
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
                                await widget!.listOfIngridientsRef!.reference
                                    .update(createIngredientsOfDishesRecordData(
                                  name: _model.textController.text,
                                  quantity: FFAppState().setQuantity,
                                  inStock: _model.checkboxValue,
                                  unit: FFAppState().unit,
                                  removeToShopList: 'Add to list',
                                ));
                                _model.chooseFoodInStock =
                                    await queryAddItemLibraryRecordOnce(
                                  parent: FFAppState().currentUserRef,
                                  queryBuilder: (addItemLibraryRecord) =>
                                      addItemLibraryRecord.where(
                                    'name',
                                    isEqualTo: _model.textController.text,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.checkboxValue!) {
                                  if (_model.textController.text ==
                                      _model.chooseFoodInStock?.name) {
                                    if (FFAppState().setQuantity <
                                        widget!.listOfIngridientsRef!
                                            .storageFoodOldQuantity) {
                                      if (_model.chooseFoodInStock?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          _model
                                              .chooseFoodInStock!.reference.id,
                                          FFAppState().userID,
                                        );

                                        await _model
                                            .chooseFoodInStock!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          quantity: widget!
                                                  .listOfIngridientsRef!
                                                  .storageFoodOldQuantity -
                                              FFAppState().setQuantity,
                                        ));
                                        await actions.createUpcomingData();
                                      } else {
                                        await _model
                                            .chooseFoodInStock!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          quantity: widget!
                                                  .listOfIngridientsRef!
                                                  .storageFoodOldQuantity -
                                              FFAppState().setQuantity,
                                        ));
                                      }
                                    } else {
                                      if (_model.chooseFoodInStock?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          _model
                                              .chooseFoodInStock!.reference.id,
                                          FFAppState().userID,
                                        );
                                        await _model
                                            .chooseFoodInStock!.reference
                                            .delete();
                                      } else {
                                        await _model
                                            .chooseFoodInStock!.reference
                                            .delete();
                                      }
                                    }
                                  }
                                }
                                Navigator.pop(context);
                                FFAppState().setQuantityInt = 0;
                                FFAppState().setQuantityDouble = 0.0;
                                FFAppState().unit = '';
                                FFAppState().setQuantity = 0.0;
                                FFAppState().update(() {});

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '9jolfibk' /* Зберегти */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.35,
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
                                _model.chooseFoodInStockDelete =
                                    await queryAddItemLibraryRecordOnce(
                                  parent: FFAppState().currentUserRef,
                                  queryBuilder: (addItemLibraryRecord) =>
                                      addItemLibraryRecord.where(
                                    'name',
                                    isEqualTo: _model.textController.text,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _model.oldQuantity = widget!
                                    .listOfIngridientsRef
                                    ?.storageFoodOldQuantity;
                                setState(() {});
                                if (_model.checkboxValue! &&
                                    (_model.textController.text ==
                                        _model.chooseFoodInStockDelete?.name)) {
                                  if (_model.chooseFoodInStock?.endDate !=
                                      null) {
                                    await actions.deleteUpcomingData(
                                      _model.chooseFoodInStockDelete!.reference
                                          .id,
                                      FFAppState().userID,
                                    );

                                    await _model
                                        .chooseFoodInStockDelete!.reference
                                        .update(createAddItemLibraryRecordData(
                                      quantity: _model.oldQuantity,
                                    ));
                                    await actions.createUpcomingData();
                                  } else {
                                    await _model
                                        .chooseFoodInStockDelete!.reference
                                        .update(createAddItemLibraryRecordData(
                                      quantity: _model.oldQuantity,
                                    ));
                                  }
                                } else if (_model.checkboxValue! &&
                                    !(_model.chooseFoodInStockDelete != null)) {
                                  await AddItemLibraryRecord.createDoc(
                                          FFAppState().currentUserRef!)
                                      .set(createAddItemLibraryRecordData(
                                    name: widget!.listOfIngridientsRef?.name,
                                    unit: widget!.listOfIngridientsRef?.unit,
                                    quantity:
                                        widget!.listOfIngridientsRef?.quantity,
                                  ));
                                }

                                await widget!.listOfIngridientsRef!.reference
                                    .delete();
                                Navigator.pop(context);
                                FFAppState().setQuantityInt = 0;
                                FFAppState().setQuantityDouble = 0.0;
                                FFAppState().unit = '';
                                FFAppState().setQuantity = 0.0;
                                FFAppState().update(() {});

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'ttr784yp' /* Видалити */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.35,
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
