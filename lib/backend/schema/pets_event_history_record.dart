import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsEventHistoryRecord extends FirestoreRecord {
  PetsEventHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventReference" field.
  DocumentReference? _eventReference;
  DocumentReference? get eventReference => _eventReference;
  bool hasEventReference() => _eventReference != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventReference = snapshotData['eventReference'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('petsEventHistory')
          : FirebaseFirestore.instance.collectionGroup('petsEventHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('petsEventHistory').doc(id);

  static Stream<PetsEventHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsEventHistoryRecord.fromSnapshot(s));

  static Future<PetsEventHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PetsEventHistoryRecord.fromSnapshot(s));

  static PetsEventHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PetsEventHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsEventHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsEventHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsEventHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsEventHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsEventHistoryRecordData({
  DocumentReference? eventReference,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventReference': eventReference,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsEventHistoryRecordDocumentEquality
    implements Equality<PetsEventHistoryRecord> {
  const PetsEventHistoryRecordDocumentEquality();

  @override
  bool equals(PetsEventHistoryRecord? e1, PetsEventHistoryRecord? e2) {
    return e1?.eventReference == e2?.eventReference && e1?.date == e2?.date;
  }

  @override
  int hash(PetsEventHistoryRecord? e) =>
      const ListEquality().hash([e?.eventReference, e?.date]);

  @override
  bool isValidKey(Object? o) => o is PetsEventHistoryRecord;
}
