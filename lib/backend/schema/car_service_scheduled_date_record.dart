import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarServiceScheduledDateRecord extends FirestoreRecord {
  CarServiceScheduledDateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carServiceScheduledDate');

  static Stream<CarServiceScheduledDateRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CarServiceScheduledDateRecord.fromSnapshot(s));

  static Future<CarServiceScheduledDateRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CarServiceScheduledDateRecord.fromSnapshot(s));

  static CarServiceScheduledDateRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CarServiceScheduledDateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarServiceScheduledDateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarServiceScheduledDateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarServiceScheduledDateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarServiceScheduledDateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarServiceScheduledDateRecordData({
  String? userID,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarServiceScheduledDateRecordDocumentEquality
    implements Equality<CarServiceScheduledDateRecord> {
  const CarServiceScheduledDateRecordDocumentEquality();

  @override
  bool equals(
      CarServiceScheduledDateRecord? e1, CarServiceScheduledDateRecord? e2) {
    return e1?.userID == e2?.userID && e1?.date == e2?.date;
  }

  @override
  int hash(CarServiceScheduledDateRecord? e) =>
      const ListEquality().hash([e?.userID, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CarServiceScheduledDateRecord;
}
