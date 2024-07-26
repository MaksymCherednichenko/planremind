import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_modul/kitchen/calendar_popup/calendar_popup_widget.dart';
import '/main/settings/not_field_error/not_field_error_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_menu_to_plan_popup_model.dart';
export 'add_menu_to_plan_popup_model.dart';

class AddMenuToPlanPopupWidget extends StatefulWidget {
  const AddMenuToPlanPopupWidget({
    super.key,
    required this.itemMenu,
  });

  final MenuRecord? itemMenu;

  @override
  State<AddMenuToPlanPopupWidget> createState() =>
      _AddMenuToPlanPopupWidgetState();
}

class _AddMenuToPlanPopupWidgetState extends State<AddMenuToPlanPopupWidget> {
  late AddMenuToPlanPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMenuToPlanPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().choosedDate = null;
      FFAppState().tag = '';
      FFAppState().isDateRange = false;
      FFAppState().chooseSecDate = null;
      setState(() {});
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
      child: Container(
        width: 327.0,
        height: 491.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.0,
                      decoration: BoxDecoration(),
                    ),
                    Text(
                      '${FFLocalizations.of(context).getVariableText(
                        ukText: 'Додати ',
                        enText: 'Add ',
                      )}${widget!.itemMenu?.name}${FFLocalizations.of(context).getVariableText(
                        ukText: ' до планування',
                        enText: ' to plan',
                      )}',
                      textAlign: TextAlign.center,
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        FFAppState().choosedDate = null;
                        FFAppState().tag = '';
                        FFAppState().isDateRange = false;
                        FFAppState().chooseSecDate = null;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CalendarPopupWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          FFAppState().chooseSecDate = null;
                          setState(() {});
                        },
                        text: '',
                        icon: Icon(
                          FFIcons.kcalendarMinimalistic,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 318.0,
                          height: 50.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              220.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF5F5F5),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFEE8B60),
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0xE8E4E4E4),
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CalendarPopupWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            FFAppState().chooseSecDate = null;
                            setState(() {});
                          },
                          child: Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                'd/M/y',
                                FFAppState().choosedDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'Planned date',
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
                    ),
                  ],
                ),
              ),
              if (FFAppState().isDateRange)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
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
                            width: 318.0,
                            height: 50.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                220.0, 0.0, 0.0, 0.0),
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
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CalendarPopupWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'd/M/y',
                                  FFAppState().chooseSecDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'To date',
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
                      ),
                    ],
                  ),
                ),
              Row(
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
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??=
                            FFAppState().isDateRange,
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxValue = newValue!);
                          if (newValue!) {
                            FFAppState().isDateRange = true;
                            setState(() {});
                          } else {
                            FFAppState().isDateRange = false;
                            setState(() {});
                          }
                        },
                        side: BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        activeColor: Color(0x85919191),
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'vshdl7tr' /* Проміжок дат */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-0.7, 0.6),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().tag = 'Breakfast';
                              FFAppState().update(() {});
                              _model.buttonClick = 1;
                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'shl6gc0k' /* Сніданок */,
                            ),
                            options: FFButtonOptions(
                              width: 155.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.buttonClick == 1
                                    ? Colors.black
                                    : Colors.white,
                                Colors.white,
                              ),
                              textStyle: GoogleFonts.getFont(
                                'Inter',
                                color: valueOrDefault<Color>(
                                  _model.buttonClick == 1
                                      ? Colors.white
                                      : Colors.black,
                                  Colors.black,
                                ),
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                fontStyle: FontStyle.normal,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0x00FFFFFF),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.65, 0.6),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().tag = 'Lunch';
                              FFAppState().update(() {});
                              _model.buttonClick = 2;
                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'amak5n4u' /* Обід */,
                            ),
                            options: FFButtonOptions(
                              width: 155.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.buttonClick == 2
                                    ? Colors.black
                                    : Colors.white,
                                Colors.white,
                              ),
                              textStyle: GoogleFonts.getFont(
                                'Inter',
                                color: valueOrDefault<Color>(
                                  _model.buttonClick == 2
                                      ? Colors.white
                                      : Colors.black,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-0.7, 0.73),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().tag = 'Dinner';
                              FFAppState().update(() {});
                              _model.buttonClick = 3;
                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'nfzpiijv' /* Вечеря */,
                            ),
                            options: FFButtonOptions(
                              width: 155.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.buttonClick == 3
                                    ? Colors.black
                                    : Colors.white,
                                Colors.white,
                              ),
                              textStyle: GoogleFonts.getFont(
                                'Inter',
                                color: valueOrDefault<Color>(
                                  _model.buttonClick == 3
                                      ? Colors.white
                                      : Colors.black,
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
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.65, 0.73),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().tag = 'Other';
                              FFAppState().update(() {});
                              _model.buttonClick = 4;
                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'f8qmjixs' /* Інше */,
                            ),
                            options: FFButtonOptions(
                              width: 155.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.buttonClick == 4
                                    ? Colors.black
                                    : Colors.white,
                                Colors.white,
                              ),
                              textStyle: GoogleFonts.getFont(
                                'Inter',
                                color: valueOrDefault<Color>(
                                  _model.buttonClick == 4
                                      ? Colors.white
                                      : Colors.black,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 50.0,
                  decoration: BoxDecoration(),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  if ((FFAppState().choosedDate != null) &&
                      (FFAppState().tag != null && FFAppState().tag != '')) {
                    var listOfDishesRecordReference =
                        ListOfDishesRecord.collection.doc();
                    await listOfDishesRecordReference.set({
                      ...createListOfDishesRecordData(
                        tag: FFAppState().tag,
                        date: FFAppState().choosedDate,
                        name: widget!.itemMenu?.name,
                        userID: widget!.itemMenu?.userID,
                        recipeFull: widget!.itemMenu?.recipeFull,
                        siteLink: widget!.itemMenu?.siteLink,
                        videoLink: widget!.itemMenu?.videoLink,
                      ),
                      ...mapToFirestore(
                        {
                          'recipe': widget!.itemMenu?.recipe,
                        },
                      ),
                    });
                    _model.newMeal = ListOfDishesRecord.getDocumentFromData({
                      ...createListOfDishesRecordData(
                        tag: FFAppState().tag,
                        date: FFAppState().choosedDate,
                        name: widget!.itemMenu?.name,
                        userID: widget!.itemMenu?.userID,
                        recipeFull: widget!.itemMenu?.recipeFull,
                        siteLink: widget!.itemMenu?.siteLink,
                        videoLink: widget!.itemMenu?.videoLink,
                      ),
                      ...mapToFirestore(
                        {
                          'recipe': widget!.itemMenu?.recipe,
                        },
                      ),
                    }, listOfDishesRecordReference);
                    _model.ingredientsMenu =
                        await actions.getMenuIngredientsReferences(
                      widget!.itemMenu!.reference,
                    );
                    _model.index = 0;
                    _model.numOfItems = _model.ingredientsMenu?.length;
                    setState(() {});
                    while (_model.index! < _model.numOfItems!) {
                      await IngredientsOfDishesRecord.createDoc(
                              _model.newMeal!.reference)
                          .set(createIngredientsOfDishesRecordData(
                        name: _model.ingredientsMenu?[_model.index!]?.name,
                        quantity:
                            _model.ingredientsMenu?[_model.index!]?.quantity,
                        inStock:
                            _model.ingredientsMenu?[_model.index!]?.inStock,
                        unit: _model.ingredientsMenu?[_model.index!]?.unit,
                        removeToShopList: 'Add to list',
                      ));
                      _model.index = _model.index! + 1;
                      setState(() {});
                    }
                    if (FFAppState().isDateRange) {
                      FFAppState().dateRange = functions
                          .dateRange(FFAppState().choosedDate!,
                              FFAppState().chooseSecDate)!
                          .toList()
                          .cast<DateTime>();
                      setState(() {});
                      _model.index = 0;
                      setState(() {});
                      while (_model.index! < FFAppState().dateRange.length) {
                        await actions.duplicateDishesAndIngredients(
                          _model.newMeal!.reference,
                          FFAppState().dateRange[_model.index!],
                        );
                        _model.index = _model.index! + 1;
                        setState(() {});
                      }
                    }
                    Navigator.pop(context);
                    FFAppState().choosedDate = null;
                    FFAppState().isDateRange = false;
                    FFAppState().chooseSecDate = null;
                    FFAppState().tag = '';
                    FFAppState().dateRange = [];
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
                  'yileuecv' /* Додати */,
                ),
                options: FFButtonOptions(
                  width: 318.0,
                  height: 54.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFF57F44),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
