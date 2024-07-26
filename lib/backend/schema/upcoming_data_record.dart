import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpcomingDataRecord extends FirestoreRecord {
  UpcomingDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('upcomingData');

  static Stream<UpcomingDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpcomingDataRecord.fromSnapshot(s));

  static Future<UpcomingDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpcomingDataRecord.fromSnapshot(s));

  static UpcomingDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpcomingDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpcomingDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpcomingDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpcomingDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpcomingDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpcomingDataRecordData({
  DateTime? date,
  String? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'userID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpcomingDataRecordDocumentEquality
    implements Equality<UpcomingDataRecord> {
  const UpcomingDataRecordDocumentEquality();

  @override
  bool equals(UpcomingDataRecord? e1, UpcomingDataRecord? e2) {
    return e1?.date == e2?.date && e1?.userID == e2?.userID;
  }

  @override
  int hash(UpcomingDataRecord? e) =>
      const ListEquality().hash([e?.date, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is UpcomingDataRecord;
}
