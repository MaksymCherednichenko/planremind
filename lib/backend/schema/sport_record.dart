import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SportRecord extends FirestoreRecord {
  SportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "DateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _info = snapshotData['info'] as String?;
    _dateTime = snapshotData['DateTime'] as DateTime?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sport')
          : FirebaseFirestore.instance.collectionGroup('sport');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sport').doc(id);

  static Stream<SportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SportRecord.fromSnapshot(s));

  static Future<SportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SportRecord.fromSnapshot(s));

  static SportRecord fromSnapshot(DocumentSnapshot snapshot) => SportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSportRecordData({
  String? title,
  String? info,
  DateTime? dateTime,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'info': info,
      'DateTime': dateTime,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class SportRecordDocumentEquality implements Equality<SportRecord> {
  const SportRecordDocumentEquality();

  @override
  bool equals(SportRecord? e1, SportRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.info == e2?.info &&
        e1?.dateTime == e2?.dateTime &&
        e1?.time == e2?.time;
  }

  @override
  int hash(SportRecord? e) =>
      const ListEquality().hash([e?.title, e?.info, e?.dateTime, e?.time]);

  @override
  bool isValidKey(Object? o) => o is SportRecord;
}
