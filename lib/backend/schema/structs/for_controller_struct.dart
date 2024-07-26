// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ForControllerStruct extends FFFirebaseStruct {
  ForControllerStruct({
    int? value,
    String? controllerView,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        _controllerView = controllerView,
        super(firestoreUtilData);

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "controllerView" field.
  String? _controllerView;
  String get controllerView => _controllerView ?? '';
  set controllerView(String? val) => _controllerView = val;

  bool hasControllerView() => _controllerView != null;

  static ForControllerStruct fromMap(Map<String, dynamic> data) =>
      ForControllerStruct(
        value: castToType<int>(data['value']),
        controllerView: data['controllerView'] as String?,
      );

  static ForControllerStruct? maybeFromMap(dynamic data) => data is Map
      ? ForControllerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'controllerView': _controllerView,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
        'controllerView': serializeParam(
          _controllerView,
          ParamType.String,
        ),
      }.withoutNulls;

  static ForControllerStruct fromSerializableMap(Map<String, dynamic> data) =>
      ForControllerStruct(
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
        controllerView: deserializeParam(
          data['controllerView'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ForControllerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ForControllerStruct &&
        value == other.value &&
        controllerView == other.controllerView;
  }

  @override
  int get hashCode => const ListEquality().hash([value, controllerView]);
}

ForControllerStruct createForControllerStruct({
  int? value,
  String? controllerView,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ForControllerStruct(
      value: value,
      controllerView: controllerView,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ForControllerStruct? updateForControllerStruct(
  ForControllerStruct? forController, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    forController
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addForControllerStructData(
  Map<String, dynamic> firestoreData,
  ForControllerStruct? forController,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (forController == null) {
    return;
  }
  if (forController.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && forController.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final forControllerData =
      getForControllerFirestoreData(forController, forFieldValue);
  final nestedData =
      forControllerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = forController.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getForControllerFirestoreData(
  ForControllerStruct? forController, [
  bool forFieldValue = false,
]) {
  if (forController == null) {
    return {};
  }
  final firestoreData = mapToFirestore(forController.toMap());

  // Add any Firestore field values
  forController.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getForControllerListFirestoreData(
  List<ForControllerStruct>? forControllers,
) =>
    forControllers
        ?.map((e) => getForControllerFirestoreData(e, true))
        .toList() ??
    [];
