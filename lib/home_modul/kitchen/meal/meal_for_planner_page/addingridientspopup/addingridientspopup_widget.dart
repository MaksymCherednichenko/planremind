import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addingridientspopup_model.dart';
export 'addingridientspopup_model.dart';

class AddingridientspopupWidget extends StatefulWidget {
  const AddingridientspopupWidget({
    super.key,
    required this.listOfIngridients,
  });

  final IngredientsOfDishesRecord? listOfIngridients;

  @override
  State<AddingridientspopupWidget> createState() =>
      _AddingridientspopupWidgetState();
}

class _AddingridientspopupWidgetState extends State<AddingridientspopupWidget> {
  late AddingridientspopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddingridientspopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().unit = 'piece';
      FFAppState().setQuantityInt = 0;
      FFAppState().setQuantityDouble = 0.0;
      FFAppState().setQuantity = 0.0;
      setState(() {});
      _model.buttonClick = 3;
      setState(() {});
      _model.allFoodInStock = await queryAddItemLibraryRecordOnce(
        parent: FFAppState().currentUserRef,
      );
    });

    _model.textController ??= TextEditingController();
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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
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
                          'avhahze2' /* Додати інгредієнти */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          await widget!.listOfIngridients!.reference.delete();
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
                          child: Container(
                            width: double.infinity,
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return _model.allFoodInStock!
                                    .map((e) => e.name)
                                    .toList()
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
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
                                setState(() =>
                                    _model.textFieldSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.textFieldFocusNode = focusNode;

                                _model.textController = textEditingController;
                                return TextFormField(
                                  key: _model.textFieldKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.choosedFoodInStock =
                                          await queryAddItemLibraryRecordOnce(
                                        parent: FFAppState().currentUserRef,
                                        queryBuilder: (addItemLibraryRecord) =>
                                            addItemLibraryRecord.where(
                                          'name',
                                          isEqualTo: _model.textController.text,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.textController.text ==
                                          _model.choosedFoodInStock?.name) {
                                        setState(() {
                                          _model.checkboxValue = true;
                                        });
                                        FFAppState().unit =
                                            _model.choosedFoodInStock!.unit;
                                        setState(() {});
                                        _model.buttonClick = () {
                                          if (_model.choosedFoodInStock?.unit ==
                                              'g') {
                                            return 1;
                                          } else if (_model
                                                  .choosedFoodInStock?.unit ==
                                              'kg') {
                                            return 2;
                                          } else if (_model
                                                  .choosedFoodInStock?.unit ==
                                              'piece') {
                                            return 3;
                                          } else if (_model
                                                  .choosedFoodInStock?.unit ==
                                              'ml') {
                                            return 4;
                                          } else if (_model
                                                  .choosedFoodInStock?.unit ==
                                              'l') {
                                            return 5;
                                          } else {
                                            return 0;
                                          }
                                        }();
                                        _model.updatePage(() {});
                                        if ((FFAppState().unit == 'kg') ||
                                            (FFAppState().unit == 'l')) {
                                          FFAppState().setQuantityDouble =
                                              _model
                                                  .choosedFoodInStock!.quantity;
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState().setQuantityInt = _model
                                              .choosedFoodInStock!.quantity
                                              .toInt();
                                          FFAppState().update(() {});
                                        }
                                      }

                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'q56fk39m' /* Назва */,
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
                                );
                              },
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
                                value: _model.checkboxValue ??= false,
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
                              '99weeg34' /* Маю це вдома */,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if ((FFAppState().unit != null &&
                                      FFAppState().unit != '') &&
                                  ((FFAppState().setQuantityInt > 0) ||
                                      (FFAppState().setQuantityDouble > 0.0)) &&
                                  (_model.textController.text != null &&
                                      _model.textController.text != '')) {
                                if (_model.textController.text ==
                                    _model.choosedFoodInStock?.name) {
                                  await widget!.listOfIngridients!.reference
                                      .update(
                                          createIngredientsOfDishesRecordData(
                                    name: _model.textController.text,
                                    quantity: FFAppState().setQuantity,
                                    inStock: _model.checkboxValue,
                                    unit: FFAppState().unit,
                                    removeToShopList: 'Add to list',
                                    storageFoodOldQuantity:
                                        _model.choosedFoodInStock?.quantity,
                                  ));
                                  _model.choosedItemInStorageFood =
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
                                    if (((FFAppState().unit == 'kg') ||
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
                                              )) <
                                        _model.choosedItemInStorageFood!
                                            .quantity) {
                                      if (_model.choosedItemInStorageFood
                                              ?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          _model.choosedItemInStorageFood!
                                              .reference.id,
                                          FFAppState().userID,
                                        );

                                        await _model
                                            .choosedItemInStorageFood!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          quantity: _model
                                                  .choosedItemInStorageFood!
                                                  .quantity -
                                              FFAppState().setQuantity,
                                        ));
                                        await actions.createUpcomingData();
                                      } else {
                                        await _model
                                            .choosedItemInStorageFood!.reference
                                            .update(
                                                createAddItemLibraryRecordData(
                                          quantity: _model
                                                  .choosedItemInStorageFood!
                                                  .quantity -
                                              FFAppState().setQuantity,
                                        ));
                                      }
                                    } else {
                                      if (_model.choosedItemInStorageFood
                                              ?.endDate !=
                                          null) {
                                        await actions.deleteUpcomingData(
                                          _model.choosedItemInStorageFood!
                                              .reference.id,
                                          FFAppState().userID,
                                        );
                                      }
                                      await _model
                                          .choosedItemInStorageFood!.reference
                                          .delete();
                                    }
                                  }
                                } else {
                                  await widget!.listOfIngridients!.reference
                                      .update(
                                          createIngredientsOfDishesRecordData(
                                    name: _model.textController.text,
                                    quantity: FFAppState().setQuantity,
                                    inStock: _model.checkboxValue,
                                    unit: FFAppState().unit,
                                    removeToShopList: 'Add to list',
                                  ));
                                }

                                Navigator.pop(context);
                                FFAppState().setQuantityInt = 0;
                                FFAppState().setQuantityDouble = 0.0;
                                FFAppState().unit = '';
                                FFAppState().setQuantity = 0.0;
                                FFAppState().update(() {});
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: NotFieldErrorWidget(),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'g488qv0n' /* Додати */,
                            ),
                            options: FFButtonOptions(
                              width: 260.0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
