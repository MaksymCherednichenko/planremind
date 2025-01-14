import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRecord extends FirestoreRecord {
  MedicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "notificationEnable" field.
  bool? _notificationEnable;
  bool get notificationEnable => _notificationEnable ?? false;
  bool hasNotificationEnable() => _notificationEnable != null;

  // "frequency" field.
  MedicationFrequencyStruct? _frequency;
  MedicationFrequencyStruct get frequency =>
      _frequency ?? MedicationFrequencyStruct();
  bool hasFrequency() => _frequency != null;

  // "doseType" field.
  MedicationDoseEnum? _doseType;
  MedicationDoseEnum? get doseType => _doseType;
  bool hasDoseType() => _doseType != null;

  // "dose" field.
  int? _dose;
  int get dose => _dose ?? 0;
  bool hasDose() => _dose != null;

  // "state" field.
  RecordStateEnum? _state;
  RecordStateEnum? get state => _state;
  bool hasState() => _state != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _notificationEnable = snapshotData['notificationEnable'] as bool?;
    _frequency = snapshotData['frequency'] is MedicationFrequencyStruct
        ? snapshotData['frequency']
        : MedicationFrequencyStruct.maybeFromMap(snapshotData['frequency']);
    _doseType = snapshotData['doseType'] is MedicationDoseEnum
        ? snapshotData['doseType']
        : deserializeEnum<MedicationDoseEnum>(snapshotData['doseType']);
    _dose = castToType<int>(snapshotData['dose']);
    _state = snapshotData['state'] is RecordStateEnum
        ? snapshotData['state']
        : deserializeEnum<RecordStateEnum>(snapshotData['state']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medication')
          : FirebaseFirestore.instance.collectionGroup('medication');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('medication').doc(id);

  static Stream<MedicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRecord.fromSnapshot(s));

  static Future<MedicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationRecord.fromSnapshot(s));

  static MedicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationRecordData({
  String? name,
  int? duration,
  bool? notificationEnable,
  MedicationFrequencyStruct? frequency,
  MedicationDoseEnum? doseType,
  int? dose,
  RecordStateEnum? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'duration': duration,
      'notificationEnable': notificationEnable,
      'frequency': MedicationFrequencyStruct().toMap(),
      'doseType': doseType,
      'dose': dose,
      'state': state,
    }.withoutNulls,
  );

  // Handle nested data for "frequency" field.
  addMedicationFrequencyStructData(firestoreData, frequency, 'frequency');

  return firestoreData;
}

class MedicationRecordDocumentEquality implements Equality<MedicationRecord> {
  const MedicationRecordDocumentEquality();

  @override
  bool equals(MedicationRecord? e1, MedicationRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.duration == e2?.duration &&
        e1?.notificationEnable == e2?.notificationEnable &&
        e1?.frequency == e2?.frequency &&
        e1?.doseType == e2?.doseType &&
        e1?.dose == e2?.dose &&
        e1?.state == e2?.state;
  }

  @override
  int hash(MedicationRecord? e) => const ListEquality().hash([
        e?.name,
        e?.duration,
        e?.notificationEnable,
        e?.frequency,
        e?.doseType,
        e?.dose,
        e?.state
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationRecord;
}
