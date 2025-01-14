import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsEventRecord extends FirestoreRecord {
  PetsEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "frequencyType" field.
  EventTypeEnum? _frequencyType;
  EventTypeEnum? get frequencyType => _frequencyType;
  bool hasFrequencyType() => _frequencyType != null;

  // "pet" field.
  DocumentReference? _pet;
  DocumentReference? get pet => _pet;
  bool hasPet() => _pet != null;

  // "eventType" field.
  PetsEventsEnum? _eventType;
  PetsEventsEnum? get eventType => _eventType;
  bool hasEventType() => _eventType != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "person" field.
  String? _person;
  String get person => _person ?? '';
  bool hasPerson() => _person != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "dose" field.
  int? _dose;
  int get dose => _dose ?? 0;
  bool hasDose() => _dose != null;

  // "doseType" field.
  MedicationDoseEnum? _doseType;
  MedicationDoseEnum? get doseType => _doseType;
  bool hasDoseType() => _doseType != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "repeat" field.
  int? _repeat;
  int get repeat => _repeat ?? 0;
  bool hasRepeat() => _repeat != null;

  // "dateType" field.
  DateTypesEnum? _dateType;
  DateTypesEnum? get dateType => _dateType;
  bool hasDateType() => _dateType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _frequencyType = snapshotData['frequencyType'] is EventTypeEnum
        ? snapshotData['frequencyType']
        : deserializeEnum<EventTypeEnum>(snapshotData['frequencyType']);
    _pet = snapshotData['pet'] as DocumentReference?;
    _eventType = snapshotData['eventType'] is PetsEventsEnum
        ? snapshotData['eventType']
        : deserializeEnum<PetsEventsEnum>(snapshotData['eventType']);
    _address = snapshotData['address'] as String?;
    _person = snapshotData['person'] as String?;
    _name = snapshotData['name'] as String?;
    _dose = castToType<int>(snapshotData['dose']);
    _doseType = snapshotData['doseType'] is MedicationDoseEnum
        ? snapshotData['doseType']
        : deserializeEnum<MedicationDoseEnum>(snapshotData['doseType']);
    _date = snapshotData['date'] as DateTime?;
    _repeat = castToType<int>(snapshotData['repeat']);
    _dateType = snapshotData['dateType'] is DateTypesEnum
        ? snapshotData['dateType']
        : deserializeEnum<DateTypesEnum>(snapshotData['dateType']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PetsEvent')
          : FirebaseFirestore.instance.collectionGroup('PetsEvent');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PetsEvent').doc(id);

  static Stream<PetsEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsEventRecord.fromSnapshot(s));

  static Future<PetsEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsEventRecord.fromSnapshot(s));

  static PetsEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PetsEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsEventRecordData({
  EventTypeEnum? frequencyType,
  DocumentReference? pet,
  PetsEventsEnum? eventType,
  String? address,
  String? person,
  String? name,
  int? dose,
  MedicationDoseEnum? doseType,
  DateTime? date,
  int? repeat,
  DateTypesEnum? dateType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'frequencyType': frequencyType,
      'pet': pet,
      'eventType': eventType,
      'address': address,
      'person': person,
      'name': name,
      'dose': dose,
      'doseType': doseType,
      'date': date,
      'repeat': repeat,
      'dateType': dateType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsEventRecordDocumentEquality implements Equality<PetsEventRecord> {
  const PetsEventRecordDocumentEquality();

  @override
  bool equals(PetsEventRecord? e1, PetsEventRecord? e2) {
    return e1?.frequencyType == e2?.frequencyType &&
        e1?.pet == e2?.pet &&
        e1?.eventType == e2?.eventType &&
        e1?.address == e2?.address &&
        e1?.person == e2?.person &&
        e1?.name == e2?.name &&
        e1?.dose == e2?.dose &&
        e1?.doseType == e2?.doseType &&
        e1?.date == e2?.date &&
        e1?.repeat == e2?.repeat &&
        e1?.dateType == e2?.dateType;
  }

  @override
  int hash(PetsEventRecord? e) => const ListEquality().hash([
        e?.frequencyType,
        e?.pet,
        e?.eventType,
        e?.address,
        e?.person,
        e?.name,
        e?.dose,
        e?.doseType,
        e?.date,
        e?.repeat,
        e?.dateType
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsEventRecord;
}
