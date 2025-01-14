import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthEventRecord extends FirestoreRecord {
  HealthEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "dateOnly" field.
  DateTime? _dateOnly;
  DateTime? get dateOnly => _dateOnly;
  bool hasDateOnly() => _dateOnly != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _isDone = snapshotData['isDone'] as bool?;
    _dateOnly = snapshotData['dateOnly'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('healthEvent')
          : FirebaseFirestore.instance.collectionGroup('healthEvent');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('healthEvent').doc(id);

  static Stream<HealthEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthEventRecord.fromSnapshot(s));

  static Future<HealthEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthEventRecord.fromSnapshot(s));

  static HealthEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthEventRecordData({
  String? name,
  String? description,
  DateTime? time,
  bool? isDone,
  DateTime? dateOnly,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'time': time,
      'isDone': isDone,
      'dateOnly': dateOnly,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthEventRecordDocumentEquality implements Equality<HealthEventRecord> {
  const HealthEventRecordDocumentEquality();

  @override
  bool equals(HealthEventRecord? e1, HealthEventRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.time == e2?.time &&
        e1?.isDone == e2?.isDone &&
        e1?.dateOnly == e2?.dateOnly;
  }

  @override
  int hash(HealthEventRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.time, e?.isDone, e?.dateOnly]);

  @override
  bool isValidKey(Object? o) => o is HealthEventRecord;
}
