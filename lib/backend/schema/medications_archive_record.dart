import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsArchiveRecord extends FirestoreRecord {
  MedicationsArchiveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "medicationId" field.
  DocumentReference? _medicationId;
  DocumentReference? get medicationId => _medicationId;
  bool hasMedicationId() => _medicationId != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "timeOfUsage" field.
  List<MedicationUsageTimeStruct>? _timeOfUsage;
  List<MedicationUsageTimeStruct> get timeOfUsage => _timeOfUsage ?? const [];
  bool hasTimeOfUsage() => _timeOfUsage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _medicationId = snapshotData['medicationId'] as DocumentReference?;
    _isDone = snapshotData['isDone'] as bool?;
    _timeOfUsage = getStructList(
      snapshotData['timeOfUsage'],
      MedicationUsageTimeStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medications_archive')
          : FirebaseFirestore.instance.collectionGroup('medications_archive');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('medications_archive').doc(id);

  static Stream<MedicationsArchiveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationsArchiveRecord.fromSnapshot(s));

  static Future<MedicationsArchiveRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MedicationsArchiveRecord.fromSnapshot(s));

  static MedicationsArchiveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationsArchiveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationsArchiveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationsArchiveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationsArchiveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationsArchiveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationsArchiveRecordData({
  DateTime? date,
  DocumentReference? medicationId,
  bool? isDone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'medicationId': medicationId,
      'isDone': isDone,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationsArchiveRecordDocumentEquality
    implements Equality<MedicationsArchiveRecord> {
  const MedicationsArchiveRecordDocumentEquality();

  @override
  bool equals(MedicationsArchiveRecord? e1, MedicationsArchiveRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.medicationId == e2?.medicationId &&
        e1?.isDone == e2?.isDone &&
        listEquality.equals(e1?.timeOfUsage, e2?.timeOfUsage);
  }

  @override
  int hash(MedicationsArchiveRecord? e) => const ListEquality()
      .hash([e?.date, e?.medicationId, e?.isDone, e?.timeOfUsage]);

  @override
  bool isValidKey(Object? o) => o is MedicationsArchiveRecord;
}
