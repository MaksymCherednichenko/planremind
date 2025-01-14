import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/car_service_modul/dialogs/add_car_popup/add_car_popup_widget.dart';
import '/car_service_modul/dialogs/expanded_float_menu/expanded_float_menu_widget.dart';
import '/car_service_modul/dialogs/my_car_popup/my_car_popup_widget.dart';
import '/custom_components/car_spare_part_mileage/car_spare_part_mileage_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_service_information_page_widget.dart'
    show CarServiceInformationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarServiceInformationPageModel
    extends FlutterFlowModel<CarServiceInformationPageWidget> {
  ///  Local state fields for this page.

  int? showInfo = 0;

  List<CarsRecord> carList = [];
  void addToCarList(CarsRecord item) => carList.add(item);
  void removeFromCarList(CarsRecord item) => carList.remove(item);
  void removeAtIndexFromCarList(int index) => carList.removeAt(index);
  void insertAtIndexInCarList(int index, CarsRecord item) =>
      carList.insert(index, item);
  void updateCarListAtIndex(int index, Function(CarsRecord) updateFn) =>
      carList[index] = updateFn(carList[index]);

  int currentIndex = 0;

  bool isCardExtended = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CarServiceInformationPage widget.
  List<CarsRecord>? cars;
  // State field(s) for vincodeTextField widget.
  FocusNode? vincodeTextFieldFocusNode;
  TextEditingController? vincodeTextFieldTextController;
  String? Function(BuildContext, String?)?
      vincodeTextFieldTextControllerValidator;
  // State field(s) for mileageTextField widget.
  FocusNode? mileageTextFieldFocusNode;
  TextEditingController? mileageTextFieldTextController;
  String? Function(BuildContext, String?)?
      mileageTextFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarsRecord>? cars4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarsRecord>? cars2;
  // Models for carSparePartMileage dynamic component.
  late FlutterFlowDynamicModels<CarSparePartMileageModel>
      carSparePartMileageModels;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<CarsRecord>? cars3;

  @override
  void initState(BuildContext context) {
    carSparePartMileageModels =
        FlutterFlowDynamicModels(() => CarSparePartMileageModel());
  }

  @override
  void dispose() {
    vincodeTextFieldFocusNode?.dispose();
    vincodeTextFieldTextController?.dispose();

    mileageTextFieldFocusNode?.dispose();
    mileageTextFieldTextController?.dispose();

    carSparePartMileageModels.dispose();
  }
}
