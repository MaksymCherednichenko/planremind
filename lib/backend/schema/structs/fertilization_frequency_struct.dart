// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FertilizationFrequencyStruct extends FFFirebaseStruct {
  FertilizationFrequencyStruct({
    int? everyXDay,
    DateTime? lastFertilization,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _everyXDay = everyXDay,
        _lastFertilization = lastFertilization,
        super(firestoreUtilData);

  // "everyXDay" field.
  int? _everyXDay;
  int get everyXDay => _everyXDay ?? 0;
  set everyXDay(int? val) => _everyXDay = val;

  void incrementEveryXDay(int amount) => everyXDay = everyXDay + amount;

  bool hasEveryXDay() => _everyXDay != null;

  // "lastFertilization" field.
  DateTime? _lastFertilization;
  DateTime? get lastFertilization => _lastFertilization;
  set lastFertilization(DateTime? val) => _lastFertilization = val;

  bool hasLastFertilization() => _lastFertilization != null;

  static FertilizationFrequencyStruct fromMap(Map<String, dynamic> data) =>
      FertilizationFrequencyStruct(
        everyXDay: castToType<int>(data['everyXDay']),
        lastFertilization: data['lastFertilization'] as DateTime?,
      );

  static FertilizationFrequencyStruct? maybeFromMap(dynamic data) => data is Map
      ? FertilizationFrequencyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'everyXDay': _everyXDay,
        'lastFertilization': _lastFertilization,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'everyXDay': serializeParam(
          _everyXDay,
          ParamType.int,
        ),
        'lastFertilization': serializeParam(
          _lastFertilization,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static FertilizationFrequencyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FertilizationFrequencyStruct(
        everyXDay: deserializeParam(
          data['everyXDay'],
          ParamType.int,
          false,
        ),
        lastFertilization: deserializeParam(
          data['lastFertilization'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'FertilizationFrequencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FertilizationFrequencyStruct &&
        everyXDay == other.everyXDay &&
        lastFertilization == other.lastFertilization;
  }

  @override
  int get hashCode => const ListEquality().hash([everyXDay, lastFertilization]);
}

FertilizationFrequencyStruct createFertilizationFrequencyStruct({
  int? everyXDay,
  DateTime? lastFertilization,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FertilizationFrequencyStruct(
      everyXDay: everyXDay,
      lastFertilization: lastFertilization,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FertilizationFrequencyStruct? updateFertilizationFrequencyStruct(
  FertilizationFrequencyStruct? fertilizationFrequency, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fertilizationFrequency
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFertilizationFrequencyStructData(
  Map<String, dynamic> firestoreData,
  FertilizationFrequencyStruct? fertilizationFrequency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fertilizationFrequency == null) {
    return;
  }
  if (fertilizationFrequency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      fertilizationFrequency.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fertilizationFrequencyData = getFertilizationFrequencyFirestoreData(
      fertilizationFrequency, forFieldValue);
  final nestedData =
      fertilizationFrequencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      fertilizationFrequency.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFertilizationFrequencyFirestoreData(
  FertilizationFrequencyStruct? fertilizationFrequency, [
  bool forFieldValue = false,
]) {
  if (fertilizationFrequency == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fertilizationFrequency.toMap());

  // Add any Firestore field values
  fertilizationFrequency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFertilizationFrequencyListFirestoreData(
  List<FertilizationFrequencyStruct>? fertilizationFrequencys,
) =>
    fertilizationFrequencys
        ?.map((e) => getFertilizationFrequencyFirestoreData(e, true))
        .toList() ??
    [];
