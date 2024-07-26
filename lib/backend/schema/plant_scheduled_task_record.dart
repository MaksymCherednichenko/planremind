import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantScheduledTaskRecord extends FirestoreRecord {
  PlantScheduledTaskRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  List<String>? _title;
  List<String> get title => _title ?? const [];
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _title = getDataList(snapshotData['title']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('plantScheduledTask')
          : FirebaseFirestore.instance.collectionGroup('plantScheduledTask');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('plantScheduledTask').doc(id);

  static Stream<PlantScheduledTaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantScheduledTaskRecord.fromSnapshot(s));

  static Future<PlantScheduledTaskRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlantScheduledTaskRecord.fromSnapshot(s));

  static PlantScheduledTaskRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlantScheduledTaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantScheduledTaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantScheduledTaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantScheduledTaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantScheduledTaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantScheduledTaskRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantScheduledTaskRecordDocumentEquality
    implements Equality<PlantScheduledTaskRecord> {
  const PlantScheduledTaskRecordDocumentEquality();

  @override
  bool equals(PlantScheduledTaskRecord? e1, PlantScheduledTaskRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date && listEquality.equals(e1?.title, e2?.title);
  }

  @override
  int hash(PlantScheduledTaskRecord? e) =>
      const ListEquality().hash([e?.date, e?.title]);

  @override
  bool isValidKey(Object? o) => o is PlantScheduledTaskRecord;
}
