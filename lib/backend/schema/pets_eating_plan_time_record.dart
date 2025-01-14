import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsEatingPlanTimeRecord extends FirestoreRecord {
  PetsEatingPlanTimeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pet" field.
  DocumentReference? _pet;
  DocumentReference? get pet => _pet;
  bool hasPet() => _pet != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _pet = snapshotData['pet'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('petsEatingPlanTime');

  static Stream<PetsEatingPlanTimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsEatingPlanTimeRecord.fromSnapshot(s));

  static Future<PetsEatingPlanTimeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PetsEatingPlanTimeRecord.fromSnapshot(s));

  static PetsEatingPlanTimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PetsEatingPlanTimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsEatingPlanTimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsEatingPlanTimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsEatingPlanTimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsEatingPlanTimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsEatingPlanTimeRecordData({
  DocumentReference? pet,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pet': pet,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsEatingPlanTimeRecordDocumentEquality
    implements Equality<PetsEatingPlanTimeRecord> {
  const PetsEatingPlanTimeRecordDocumentEquality();

  @override
  bool equals(PetsEatingPlanTimeRecord? e1, PetsEatingPlanTimeRecord? e2) {
    return e1?.pet == e2?.pet && e1?.time == e2?.time;
  }

  @override
  int hash(PetsEatingPlanTimeRecord? e) =>
      const ListEquality().hash([e?.pet, e?.time]);

  @override
  bool isValidKey(Object? o) => o is PetsEatingPlanTimeRecord;
}
