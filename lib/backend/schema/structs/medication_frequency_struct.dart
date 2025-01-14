// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationFrequencyStruct extends FFFirebaseStruct {
  MedicationFrequencyStruct({
    FrequencySchemeEnum? scheme,
    DateTime? lastDate,
    int? everyXDays,
    List<int>? daysOfWeek,
    List<MedicationUsageTimeStruct>? timeOfUsage,
    DateTime? specificDay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _scheme = scheme,
        _lastDate = lastDate,
        _everyXDays = everyXDays,
        _daysOfWeek = daysOfWeek,
        _timeOfUsage = timeOfUsage,
        _specificDay = specificDay,
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

  // "everyXDays" field.
  int? _everyXDays;
  int get everyXDays => _everyXDays ?? 0;
  set everyXDays(int? val) => _everyXDays = val;

  void incrementEveryXDays(int amount) => everyXDays = everyXDays + amount;

  bool hasEveryXDays() => _everyXDays != null;

  // "daysOfWeek" field.
  List<int>? _daysOfWeek;
  List<int> get daysOfWeek => _daysOfWeek ?? const [];
  set daysOfWeek(List<int>? val) => _daysOfWeek = val;

  void updateDaysOfWeek(Function(List<int>) updateFn) {
    updateFn(_daysOfWeek ??= []);
  }

  bool hasDaysOfWeek() => _daysOfWeek != null;

  // "timeOfUsage" field.
  List<MedicationUsageTimeStruct>? _timeOfUsage;
  List<MedicationUsageTimeStruct> get timeOfUsage => _timeOfUsage ?? const [];
  set timeOfUsage(List<MedicationUsageTimeStruct>? val) => _timeOfUsage = val;

  void updateTimeOfUsage(Function(List<MedicationUsageTimeStruct>) updateFn) {
    updateFn(_timeOfUsage ??= []);
  }

  bool hasTimeOfUsage() => _timeOfUsage != null;

  // "specificDay" field.
  DateTime? _specificDay;
  DateTime? get specificDay => _specificDay;
  set specificDay(DateTime? val) => _specificDay = val;

  bool hasSpecificDay() => _specificDay != null;

  static MedicationFrequencyStruct fromMap(Map<String, dynamic> data) =>
      MedicationFrequencyStruct(
        scheme: data['scheme'] is FrequencySchemeEnum
            ? data['scheme']
            : deserializeEnum<FrequencySchemeEnum>(data['scheme']),
        lastDate: data['lastDate'] as DateTime?,
        everyXDays: castToType<int>(data['everyXDays']),
        daysOfWeek: getDataList(data['daysOfWeek']),
        timeOfUsage: getStructList(
          data['timeOfUsage'],
          MedicationUsageTimeStruct.fromMap,
        ),
        specificDay: data['specificDay'] as DateTime?,
      );

  static MedicationFrequencyStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationFrequencyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'scheme': _scheme?.serialize(),
        'lastDate': _lastDate,
        'everyXDays': _everyXDays,
        'daysOfWeek': _daysOfWeek,
        'timeOfUsage': _timeOfUsage?.map((e) => e.toMap()).toList(),
        'specificDay': _specificDay,
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
        'everyXDays': serializeParam(
          _everyXDays,
          ParamType.int,
        ),
        'daysOfWeek': serializeParam(
          _daysOfWeek,
          ParamType.int,
          isList: true,
        ),
        'timeOfUsage': serializeParam(
          _timeOfUsage,
          ParamType.DataStruct,
          isList: true,
        ),
        'specificDay': serializeParam(
          _specificDay,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MedicationFrequencyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MedicationFrequencyStruct(
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
        everyXDays: deserializeParam(
          data['everyXDays'],
          ParamType.int,
          false,
        ),
        daysOfWeek: deserializeParam<int>(
          data['daysOfWeek'],
          ParamType.int,
          true,
        ),
        timeOfUsage: deserializeStructParam<MedicationUsageTimeStruct>(
          data['timeOfUsage'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicationUsageTimeStruct.fromSerializableMap,
        ),
        specificDay: deserializeParam(
          data['specificDay'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MedicationFrequencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationFrequencyStruct &&
        scheme == other.scheme &&
        lastDate == other.lastDate &&
        everyXDays == other.everyXDays &&
        listEquality.equals(daysOfWeek, other.daysOfWeek) &&
        listEquality.equals(timeOfUsage, other.timeOfUsage) &&
        specificDay == other.specificDay;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [scheme, lastDate, everyXDays, daysOfWeek, timeOfUsage, specificDay]);
}

MedicationFrequencyStruct createMedicationFrequencyStruct({
  FrequencySchemeEnum? scheme,
  DateTime? lastDate,
  int? everyXDays,
  DateTime? specificDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicationFrequencyStruct(
      scheme: scheme,
      lastDate: lastDate,
      everyXDays: everyXDays,
      specificDay: specificDay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicationFrequencyStruct? updateMedicationFrequencyStruct(
  MedicationFrequencyStruct? medicationFrequency, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicationFrequency
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicationFrequencyStructData(
  Map<String, dynamic> firestoreData,
  MedicationFrequencyStruct? medicationFrequency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicationFrequency == null) {
    return;
  }
  if (medicationFrequency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicationFrequency.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicationFrequencyData =
      getMedicationFrequencyFirestoreData(medicationFrequency, forFieldValue);
  final nestedData =
      medicationFrequencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      medicationFrequency.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicationFrequencyFirestoreData(
  MedicationFrequencyStruct? medicationFrequency, [
  bool forFieldValue = false,
]) {
  if (medicationFrequency == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicationFrequency.toMap());

  // Add any Firestore field values
  medicationFrequency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicationFrequencyListFirestoreData(
  List<MedicationFrequencyStruct>? medicationFrequencys,
) =>
    medicationFrequencys
        ?.map((e) => getMedicationFrequencyFirestoreData(e, true))
        .toList() ??
    [];
