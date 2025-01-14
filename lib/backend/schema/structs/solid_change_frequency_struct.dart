// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolidChangeFrequencyStruct extends FFFirebaseStruct {
  SolidChangeFrequencyStruct({
    FrequencySolidChangeEnum? frequency,
    DateTime? lastChange,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _frequency = frequency,
        _lastChange = lastChange,
        super(firestoreUtilData);

  // "frequency" field.
  FrequencySolidChangeEnum? _frequency;
  FrequencySolidChangeEnum get frequency =>
      _frequency ?? FrequencySolidChangeEnum.onceAYear;
  set frequency(FrequencySolidChangeEnum? val) => _frequency = val;

  bool hasFrequency() => _frequency != null;

  // "lastChange" field.
  DateTime? _lastChange;
  DateTime? get lastChange => _lastChange;
  set lastChange(DateTime? val) => _lastChange = val;

  bool hasLastChange() => _lastChange != null;

  static SolidChangeFrequencyStruct fromMap(Map<String, dynamic> data) =>
      SolidChangeFrequencyStruct(
        frequency: data['frequency'] is FrequencySolidChangeEnum
            ? data['frequency']
            : deserializeEnum<FrequencySolidChangeEnum>(data['frequency']),
        lastChange: data['lastChange'] as DateTime?,
      );

  static SolidChangeFrequencyStruct? maybeFromMap(dynamic data) => data is Map
      ? SolidChangeFrequencyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'frequency': _frequency?.serialize(),
        'lastChange': _lastChange,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'frequency': serializeParam(
          _frequency,
          ParamType.Enum,
        ),
        'lastChange': serializeParam(
          _lastChange,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SolidChangeFrequencyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SolidChangeFrequencyStruct(
        frequency: deserializeParam<FrequencySolidChangeEnum>(
          data['frequency'],
          ParamType.Enum,
          false,
        ),
        lastChange: deserializeParam(
          data['lastChange'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SolidChangeFrequencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SolidChangeFrequencyStruct &&
        frequency == other.frequency &&
        lastChange == other.lastChange;
  }

  @override
  int get hashCode => const ListEquality().hash([frequency, lastChange]);
}

SolidChangeFrequencyStruct createSolidChangeFrequencyStruct({
  FrequencySolidChangeEnum? frequency,
  DateTime? lastChange,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SolidChangeFrequencyStruct(
      frequency: frequency,
      lastChange: lastChange,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SolidChangeFrequencyStruct? updateSolidChangeFrequencyStruct(
  SolidChangeFrequencyStruct? solidChangeFrequency, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    solidChangeFrequency
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSolidChangeFrequencyStructData(
  Map<String, dynamic> firestoreData,
  SolidChangeFrequencyStruct? solidChangeFrequency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (solidChangeFrequency == null) {
    return;
  }
  if (solidChangeFrequency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && solidChangeFrequency.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final solidChangeFrequencyData =
      getSolidChangeFrequencyFirestoreData(solidChangeFrequency, forFieldValue);
  final nestedData =
      solidChangeFrequencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      solidChangeFrequency.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSolidChangeFrequencyFirestoreData(
  SolidChangeFrequencyStruct? solidChangeFrequency, [
  bool forFieldValue = false,
]) {
  if (solidChangeFrequency == null) {
    return {};
  }
  final firestoreData = mapToFirestore(solidChangeFrequency.toMap());

  // Add any Firestore field values
  solidChangeFrequency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSolidChangeFrequencyListFirestoreData(
  List<SolidChangeFrequencyStruct>? solidChangeFrequencys,
) =>
    solidChangeFrequencys
        ?.map((e) => getSolidChangeFrequencyFirestoreData(e, true))
        .toList() ??
    [];
