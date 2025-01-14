import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarServiceTaskHistoryRecord extends FirestoreRecord {
  CarServiceTaskHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "serviceTastReference" field.
  DocumentReference? _serviceTastReference;
  DocumentReference? get serviceTastReference => _serviceTastReference;
  bool hasServiceTastReference() => _serviceTastReference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _serviceTastReference =
        snapshotData['serviceTastReference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carServiceTaskHistory')
          : FirebaseFirestore.instance.collectionGroup('carServiceTaskHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carServiceTaskHistory').doc(id);

  static Stream<CarServiceTaskHistoryRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CarServiceTaskHistoryRecord.fromSnapshot(s));

  static Future<CarServiceTaskHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CarServiceTaskHistoryRecord.fromSnapshot(s));

  static CarServiceTaskHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarServiceTaskHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarServiceTaskHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarServiceTaskHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarServiceTaskHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarServiceTaskHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarServiceTaskHistoryRecordData({
  DateTime? date,
  DocumentReference? serviceTastReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'serviceTastReference': serviceTastReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarServiceTaskHistoryRecordDocumentEquality
    implements Equality<CarServiceTaskHistoryRecord> {
  const CarServiceTaskHistoryRecordDocumentEquality();

  @override
  bool equals(
      CarServiceTaskHistoryRecord? e1, CarServiceTaskHistoryRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.serviceTastReference == e2?.serviceTastReference;
  }

  @override
  int hash(CarServiceTaskHistoryRecord? e) =>
      const ListEquality().hash([e?.date, e?.serviceTastReference]);

  @override
  bool isValidKey(Object? o) => o is CarServiceTaskHistoryRecord;
}
