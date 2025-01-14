import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthEventArchiveRecord extends FirestoreRecord {
  HealthEventArchiveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "eventReference" field.
  DocumentReference? _eventReference;
  DocumentReference? get eventReference => _eventReference;
  bool hasEventReference() => _eventReference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _eventReference = snapshotData['eventReference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('healthEventArchive')
          : FirebaseFirestore.instance.collectionGroup('healthEventArchive');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('healthEventArchive').doc(id);

  static Stream<HealthEventArchiveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthEventArchiveRecord.fromSnapshot(s));

  static Future<HealthEventArchiveRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HealthEventArchiveRecord.fromSnapshot(s));

  static HealthEventArchiveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthEventArchiveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthEventArchiveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthEventArchiveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthEventArchiveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthEventArchiveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthEventArchiveRecordData({
  DateTime? date,
  DocumentReference? eventReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'eventReference': eventReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthEventArchiveRecordDocumentEquality
    implements Equality<HealthEventArchiveRecord> {
  const HealthEventArchiveRecordDocumentEquality();

  @override
  bool equals(HealthEventArchiveRecord? e1, HealthEventArchiveRecord? e2) {
    return e1?.date == e2?.date && e1?.eventReference == e2?.eventReference;
  }

  @override
  int hash(HealthEventArchiveRecord? e) =>
      const ListEquality().hash([e?.date, e?.eventReference]);

  @override
  bool isValidKey(Object? o) => o is HealthEventArchiveRecord;
}
