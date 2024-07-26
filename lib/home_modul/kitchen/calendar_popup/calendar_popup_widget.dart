import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_popup_model.dart';
export 'calendar_popup_model.dart';

class CalendarPopupWidget extends StatefulWidget {
  const CalendarPopupWidget({super.key});

  @override
  State<CalendarPopupWidget> createState() => _CalendarPopupWidgetState();
}

class _CalendarPopupWidgetState extends State<CalendarPopupWidget> {
  late CalendarPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            'nifdpk9b' /* Choose a date */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            width: 382.0,
            height: 426.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: FlutterFlowCalendar(
              color: Color(0xFFF57F44),
              iconColor: FlutterFlowTheme.of(context).secondaryText,
              weekFormat: false,
              weekStartsMonday: true,
              initialDate:
                  FFAppState().isDateRange && (FFAppState().choosedDate != null)
                      ? FFAppState().chooseSecDate
                      : FFAppState().choosedDate,
              rowHeight: 60.0,
              onChange: (DateTimeRange? newSelectedDate) async {
                if (_model.calendarSelectedDay == newSelectedDate) {
                  return;
                }
                _model.calendarSelectedDay = newSelectedDate;
                if (FFAppState().isDateRange &&
                    (FFAppState().choosedDate != null)) {
                  FFAppState().chooseSecDate = _model.calendarSelectedDay?.end;
                  setState(() {});
                } else {
                  FFAppState().choosedDate = _model.calendarSelectedDay?.start;
                  setState(() {});
                }

                setState(() {});
              },
              titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                  ),
              dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              selectedDateStyle:
                  FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
              inactiveDateStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
              locale: FFLocalizations.of(context).languageCode,
            ),
          ),
        ),
        Container(
          width: 352.0,
          height: 61.0,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
            },
            text: FFLocalizations.of(context).getText(
              'qt439pau' /* Choose */,
            ),
            options: FFButtonOptions(
              height: 30.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFFF57F44),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
