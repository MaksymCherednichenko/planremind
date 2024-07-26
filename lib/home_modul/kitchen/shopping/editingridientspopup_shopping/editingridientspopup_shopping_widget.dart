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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editingridientspopup_shopping_model.dart';
export 'editingridientspopup_shopping_model.dart';

class EditingridientspopupShoppingWidget extends StatefulWidget {
  const EditingridientspopupShoppingWidget({
    super.key,
    required this.shoppingListDoc,
  });

  final ShoppingListRecord? shoppingListDoc;

  @override
  State<EditingridientspopupShoppingWidget> createState() =>
      _EditingridientspopupShoppingWidgetState();
}

class _EditingridientspopupShoppingWidgetState
    extends State<EditingridientspopupShoppingWidget> {
  late EditingridientspopupShoppingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditingridientspopupShoppingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.buttonClick = () {
        if (widget!.shoppingListDoc?.unit == 'g') {
          return 1;
        } else if (widget!.shoppingListDoc?.unit == 'kg') {
          return 2;
        } else if (widget!.shoppingListDoc?.unit == 'piece') {
          return 3;
        } else if (widget!.shoppingListDoc?.unit == 'ml') {
          return 4;
        } else if (widget!.shoppingListDoc?.unit == 'l') {
          return 5;
        } else {
          return 0;
        }
      }();
      _model.categoryColorClick = valueOrDefault<int>(
        () {
          if (widget!.shoppingListDoc?.categoryTag == 'Food') {
            return 1;
          } else if (widget!.shoppingListDoc?.categoryTag == 'Household') {
            return 2;
          } else {
            return 0;
          }
        }(),
        0,
      );
      _model.categoryTag = widget!.shoppingListDoc!.categoryTag;
      _model.updatePage(() {});
      FFAppState().setQuantityDouble = widget!.shoppingListDoc!.quantity;
      FFAppState().setQuantityInt = valueOrDefault<int>(
        widget!.shoppingListDoc!.quantity.toInt(),
        0,
      );
      FFAppState().unit = widget!.shoppingListDoc!.unit;
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

    _model.textController1 ??=
        TextEditingController(text: widget!.shoppingListDoc?.name);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget!.shoppingListDoc?.shopName);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 100.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        width: 327.0,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '4mdgsiq6' /* Edit item */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).primaryBackground,
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
                  ),
                ],
              ),
            ),
            if (_model.categoryTag == null || _model.categoryTag == '')
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '0h31jphx' /* Виберіть категорію (обов'язков... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.categoryColorClick = 1;
                          _model.categoryTag = 'Food';
                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'ggme409s' /* Їжа */,
                        ),
                        options: FFButtonOptions(
                          width: 155.5,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.categoryColorClick == 1
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: GoogleFonts.getFont(
                            'Inter',
                            color: valueOrDefault<Color>(
                              _model.categoryColorClick == 1
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).primaryText,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.categoryColorClick = 2;
                          _model.categoryTag = 'Household';
                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '2s6n5x1f' /* Побутові */,
                        ),
                        options: FFButtonOptions(
                          width: 155.5,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.categoryColorClick == 2
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: GoogleFonts.getFont(
                            'Inter',
                            color: valueOrDefault<Color>(
                              _model.categoryColorClick == 2
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).primaryText,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 0.0),
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
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          autofocus: false,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'fe4k9c8v' /* Name */,
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
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
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
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: Autocomplete<String>(
                          initialValue: TextEditingValue(
                              text: widget!.shoppingListDoc!.shopName),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return FFAppState().namesOfShops.where((option) {
                              final lowercaseOption = option.toLowerCase();
                              return lowercaseOption.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return AutocompleteOptionsList(
                              textFieldKey: _model.textFieldKey2,
                              textController: _model.textController2!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textHighlightStyle: TextStyle(),
                              elevation: 0.0,
                              optionBackgroundColor: Color(0xFFF1F4F8),
                              optionHighlightColor: Color(0xFFF1F4F8),
                              maxHeight: 200.0,
                            );
                          },
                          onSelected: (String selection) {
                            setState(() =>
                                _model.textFieldSelectedOption2 = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            _model.textFieldFocusNode2 = focusNode;

                            _model.textController2 = textEditingController;
                            return TextFormField(
                              key: _model.textFieldKey2,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'a91artj7' /* Shop name */,
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
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.textController2Validator
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.categoryTag != null &&
                              _model.categoryTag != '') {
                            await widget!.shoppingListDoc!.reference
                                .update(createShoppingListRecordData(
                              name: _model.textController1.text,
                              quantity: FFAppState().setQuantity,
                              unit: FFAppState().unit,
                              shopName: _model.textController2.text,
                              categoryTag: _model.categoryTag,
                            ));
                            _model.updatedSortList =
                                await actions.createSortListFromShopNames(
                              FFAppState().namesOfShops.toList(),
                            );
                            FFAppState().sortListFromShopsNames =
                                _model.updatedSortList!.toList().cast<String>();
                            setState(() {});
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
                          '8shfq9za' /* Save */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          height: 54.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF57F44),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget!.shoppingListDoc!.reference.delete();
                          _model.deletedSortList =
                              await actions.createSortListFromShopNames(
                            FFAppState().namesOfShops.toList(),
                          );
                          FFAppState().sortListFromShopsNames =
                              _model.deletedSortList!.toList().cast<String>();
                          setState(() {});
                          Navigator.pop(context);
                          FFAppState().setQuantityInt = 0;
                          FFAppState().setQuantityDouble = 0.0;
                          FFAppState().unit = '';
                          FFAppState().setQuantity = 0.0;
                          FFAppState().update(() {});

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'xugw4jjd' /* Delete */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          height: 54.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF54444),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
