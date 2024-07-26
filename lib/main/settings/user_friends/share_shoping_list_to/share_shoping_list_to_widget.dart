import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'share_shoping_list_to_model.dart';
export 'share_shoping_list_to_model.dart';

class ShareShopingListToWidget extends StatefulWidget {
  const ShareShopingListToWidget({
    super.key,
    required this.shoppingList,
  });

  final List<ShoppingListRecord>? shoppingList;

  @override
  State<ShareShopingListToWidget> createState() =>
      _ShareShopingListToWidgetState();
}

class _ShareShopingListToWidgetState extends State<ShareShopingListToWidget> {
  late ShareShopingListToModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareShopingListToModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.usersToSend = [];
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
        width: 300.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FFIcons.kclose,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'wfiz4n9e' /* Поділитися */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: StreamBuilder<List<UsersFriendsRecord>>(
                    stream: queryUsersFriendsRecord(
                      parent: FFAppState().currentUserRef,
                    ),
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
                      List<UsersFriendsRecord> columnUsersFriendsRecordList =
                          snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(columnUsersFriendsRecordList.length,
                                  (columnIndex) {
                            final columnUsersFriendsRecord =
                                columnUsersFriendsRecordList[columnIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFFADA7A7),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValueMap[
                                                  columnUsersFriendsRecord] ??=
                                              false,
                                          onChanged: (newValue) async {
                                            setState(() => _model
                                                        .checkboxValueMap[
                                                    columnUsersFriendsRecord] =
                                                newValue!);
                                            if (newValue!) {
                                              _model.addToUsersToSend(
                                                  columnUsersFriendsRecord);
                                              setState(() {});
                                            } else {
                                              _model.removeFromUsersToSend(
                                                  columnUsersFriendsRecord);
                                              setState(() {});
                                            }
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: Color(0xFFADA7A7),
                                          ),
                                          activeColor: Color(0xFFADA7A7),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 130.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                columnUsersFriendsRecord.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              columnUsersFriendsRecord
                                                  .friendCode
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFFADA7A7),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.ind = 0;
                      setState(() {});
                      while (_model.ind! < _model.usersToSend.length) {
                        _model.user = await queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: _model.usersToSend[_model.ind!].uid,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        triggerPushNotification(
                          notificationTitle:
                              FFLocalizations.of(context).getVariableText(
                            ukText: 'Список покупок',
                            enText: 'Shopping list',
                          ),
                          notificationText:
                              '${FFLocalizations.of(context).getVariableText(
                            ukText: 'Привіт! ',
                            enText: 'Hi! ',
                          )}${currentUserDisplayName} ${FFLocalizations.of(context).getVariableText(
                            ukText: 'відправив(-ла) Вам список покупок.',
                            enText: 'send you shopping list.',
                          )}',
                          notificationSound: 'default',
                          userRefs: [_model.user!.reference],
                          initialPageName: 'HomeShoppingActual',
                          parameterData: {},
                        );
                        _model.ind2 = 0;
                        setState(() {});
                        while (_model.ind2! < widget!.shoppingList!.length) {
                          await ShoppingListRecord.createDoc(
                                  _model.user!.reference)
                              .set(createShoppingListRecordData(
                            name: widget!.shoppingList?[_model.ind2!]?.name,
                            shopName:
                                widget!.shoppingList?[_model.ind2!]?.shopName,
                            unit: widget!.shoppingList?[_model.ind2!]?.unit,
                            quantity:
                                widget!.shoppingList?[_model.ind2!]?.quantity,
                            bought: false,
                            categoryTag: widget!
                                .shoppingList?[_model.ind2!]?.categoryTag,
                          ));
                          _model.ind2 = _model.ind2! + 1;
                          setState(() {});
                        }
                        _model.ind = _model.ind! + 1;
                        setState(() {});
                      }
                      Navigator.pop(context);

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '7tsu3xv3' /* Відправити */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
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
