// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationUsageTimeStruct extends FFFirebaseStruct {
  MedicationUsageTimeStruct({
    DateTime? time,
    bool? isUseg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _isUseg = isUseg,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime get time =>
      _time ?? DateTime.fromMicrosecondsSinceEpoch(946674000000000);
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "isUseg" field.
  bool? _isUseg;
  bool get isUseg => _isUseg ?? false;
  set isUseg(bool? val) => _isUseg = val;

  bool hasIsUseg() => _isUseg != null;

  static MedicationUsageTimeStruct fromMap(Map<String, dynamic> data) =>
      MedicationUsageTimeStruct(
        time: data['time'] as DateTime?,
        isUseg: data['isUseg'] as bool?,
      );

  static MedicationUsageTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationUsageTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'isUseg': _isUseg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'isUseg': serializeParam(
          _isUseg,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MedicationUsageTimeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MedicationUsageTimeStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        isUseg: deserializeParam(
          data['isUseg'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MedicationUsageTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicationUsageTimeStruct &&
        time == other.time &&
        isUseg == other.isUseg;
  }

  @override
  int get hashCode => const ListEquality().hash([time, isUseg]);
}

MedicationUsageTimeStruct createMedicationUsageTimeStruct({
  DateTime? time,
  bool? isUseg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicationUsageTimeStruct(
      time: time,
      isUseg: isUseg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicationUsageTimeStruct? updateMedicationUsageTimeStruct(
  MedicationUsageTimeStruct? medicationUsageTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicationUsageTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicationUsageTimeStructData(
  Map<String, dynamic> firestoreData,
  MedicationUsageTimeStruct? medicationUsageTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicationUsageTime == null) {
    return;
  }
  if (medicationUsageTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicationUsageTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicationUsageTimeData =
      getMedicationUsageTimeFirestoreData(medicationUsageTime, forFieldValue);
  final nestedData =
      medicationUsageTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      medicationUsageTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicationUsageTimeFirestoreData(
  MedicationUsageTimeStruct? medicationUsageTime, [
  bool forFieldValue = false,
]) {
  if (medicationUsageTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicationUsageTime.toMap());

  // Add any Firestore field values
  medicationUsageTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicationUsageTimeListFirestoreData(
  List<MedicationUsageTimeStruct>? medicationUsageTimes,
) =>
    medicationUsageTimes
        ?.map((e) => getMedicationUsageTimeFirestoreData(e, true))
        .toList() ??
    [];
