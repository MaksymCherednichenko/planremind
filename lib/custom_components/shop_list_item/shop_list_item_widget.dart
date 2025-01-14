import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_modul/kitchen/shopping/addingridientspopup_shopping/addingridientspopup_shopping_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shop_list_item_model.dart';
export 'shop_list_item_model.dart';

class ShopListItemWidget extends StatefulWidget {
  const ShopListItemWidget({
    super.key,
    bool? choosed,
    required this.item,
  }) : this.choosed = choosed ?? false;

  final bool choosed;
  final ShoppingListRecord? item;

  @override
  State<ShopListItemWidget> createState() => _ShopListItemWidgetState();
}

class _ShopListItemWidgetState extends State<ShopListItemWidget> {
  late ShopListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: double.infinity,
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 6.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= widget!.item!.isBought,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue = newValue!);
                      if (newValue!) {
                        await widget!.item!.reference
                            .update(createShoppingListRecordData(
                          isBought: true,
                          dateOfBuy: functions.getDateOnly(getCurrentTimestamp),
                        ));
                      } else {
                        await widget!.item!.reference
                            .update(createShoppingListRecordData(
                          isBought: false,
                        ));
                      }
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    activeColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    checkColor: FlutterFlowTheme.of(context).home,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
                          child: AddingridientspopupShoppingWidget(
                            ingridient: widget!.item,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 135.0,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        if (_model.checkboxValue ?? true)
                          Text(
                            widget!.item!.name,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        if (!_model.checkboxValue!)
                          Text(
                            widget!.item!.name,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                '${formatNumber(
                  widget!.item?.quantity,
                  formatType: FormatType.custom,
                  format: '####.##',
                  locale: '',
                )} ${widget!.item?.unit?.name}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Text(
                    widget!.item!.shopName,
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
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
