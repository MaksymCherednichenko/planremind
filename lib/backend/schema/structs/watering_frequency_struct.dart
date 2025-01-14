// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WateringFrequencyStruct extends FFFirebaseStruct {
  WateringFrequencyStruct({
    FrequencySchemeEnum? scheme,
    DateTime? lastDate,
    int? everyXDay,
    List<int>? dayOfWeek,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _scheme = scheme,
        _lastDate = lastDate,
        _everyXDay = everyXDay,
        _dayOfWeek = dayOfWeek,
        super(firestoreUtilData);

  // "scheme" field.
  FrequencySchemeEnum? _scheme;
  FrequencySchemeEnum get scheme => _scheme ?? FrequencySchemeEnum.EveryDay;
  set scheme(FrequencySchemeEnum? val) => _scheme = val;

  bool hasScheme() => _scheme != null;

  // "lastDate" field.
  DateTime? _lastDate;
  DateTime? get lastDate => _lastDate;
  set lastDate(DateTime? val) => _lastDate = val;

  bool hasLastDate() => _lastDate != null;

  // "everyXDay" field.
  int? _everyXDay;
  int get everyXDay => _everyXDay ?? 0;
  set everyXDay(int? val) => _everyXDay = val;

  void incrementEveryXDay(int amount) => everyXDay = everyXDay + amount;

  bool hasEveryXDay() => _everyXDay != null;

  // "dayOfWeek" field.
  List<int>? _dayOfWeek;
  List<int> get dayOfWeek => _dayOfWeek ?? const [];
  set dayOfWeek(List<int>? val) => _dayOfWeek = val;

  void updateDayOfWeek(Function(List<int>) updateFn) {
    updateFn(_dayOfWeek ??= []);
  }

  bool hasDayOfWeek() => _dayOfWeek != null;

  static WateringFrequencyStruct fromMap(Map<String, dynamic> data) =>
      WateringFrequencyStruct(
        scheme: data['scheme'] is FrequencySchemeEnum
            ? data['scheme']
            : deserializeEnum<FrequencySchemeEnum>(data['scheme']),
        lastDate: data['lastDate'] as DateTime?,
        everyXDay: castToType<int>(data['everyXDay']),
        dayOfWeek: getDataList(data['dayOfWeek']),
      );

  static WateringFrequencyStruct? maybeFromMap(dynamic data) => data is Map
      ? WateringFrequencyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'scheme': _scheme?.serialize(),
        'lastDate': _lastDate,
        'everyXDay': _everyXDay,
        'dayOfWeek': _dayOfWeek,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'scheme': serializeParam(
          _scheme,
          ParamType.Enum,
        ),
        'lastDate': serializeParam(
          _lastDate,
          ParamType.DateTime,
        ),
        'everyXDay': serializeParam(
          _everyXDay,
          ParamType.int,
        ),
        'dayOfWeek': serializeParam(
          _dayOfWeek,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static WateringFrequencyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WateringFrequencyStruct(
        scheme: deserializeParam<FrequencySchemeEnum>(
          data['scheme'],
          ParamType.Enum,
          false,
        ),
        lastDate: deserializeParam(
          data['lastDate'],
          ParamType.DateTime,
          false,
        ),
        everyXDay: deserializeParam(
          data['everyXDay'],
          ParamType.int,
          false,
        ),
        dayOfWeek: deserializeParam<int>(
          data['dayOfWeek'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'WateringFrequencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WateringFrequencyStruct &&
        scheme == other.scheme &&
        lastDate == other.lastDate &&
        everyXDay == other.everyXDay &&
        listEquality.equals(dayOfWeek, other.dayOfWeek);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([scheme, lastDate, everyXDay, dayOfWeek]);
}

WateringFrequencyStruct createWateringFrequencyStruct({
  FrequencySchemeEnum? scheme,
  DateTime? lastDate,
  int? everyXDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WateringFrequencyStruct(
      scheme: scheme,
      lastDate: lastDate,
      everyXDay: everyXDay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WateringFrequencyStruct? updateWateringFrequencyStruct(
  WateringFrequencyStruct? wateringFrequency, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    wateringFrequency
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWateringFrequencyStructData(
  Map<String, dynamic> firestoreData,
  WateringFrequencyStruct? wateringFrequency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wateringFrequency == null) {
    return;
  }
  if (wateringFrequency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && wateringFrequency.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final wateringFrequencyData =
      getWateringFrequencyFirestoreData(wateringFrequency, forFieldValue);
  final nestedData =
      wateringFrequencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = wateringFrequency.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWateringFrequencyFirestoreData(
  WateringFrequencyStruct? wateringFrequency, [
  bool forFieldValue = false,
]) {
  if (wateringFrequency == null) {
    return {};
  }
  final firestoreData = mapToFirestore(wateringFrequency.toMap());

  // Add any Firestore field values
  wateringFrequency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWateringFrequencyListFirestoreData(
  List<WateringFrequencyStruct>? wateringFrequencys,
) =>
    wateringFrequencys
        ?.map((e) => getWateringFrequencyFirestoreData(e, true))
        .toList() ??
    [];
