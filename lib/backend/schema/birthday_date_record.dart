import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BirthdayDateRecord extends FirestoreRecord {
  BirthdayDateRecord._(
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

  // "dateDay" field.
  DateTime? _dateDay;
  DateTime? get dateDay => _dateDay;
  bool hasDateDay() => _dateDay != null;

  // "dateMonth" field.
  DateTime? _dateMonth;
  DateTime? get dateMonth => _dateMonth;
  bool hasDateMonth() => _dateMonth != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
    _dateDay = snapshotData['dateDay'] as DateTime?;
    _dateMonth = snapshotData['dateMonth'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('birthdayDate');

  static Stream<BirthdayDateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BirthdayDateRecord.fromSnapshot(s));

  static Future<BirthdayDateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BirthdayDateRecord.fromSnapshot(s));

  static BirthdayDateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BirthdayDateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BirthdayDateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BirthdayDateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BirthdayDateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BirthdayDateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBirthdayDateRecordData({
  DateTime? date,
  String? userID,
  DateTime? dateDay,
  DateTime? dateMonth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'userID': userID,
      'dateDay': dateDay,
      'dateMonth': dateMonth,
    }.withoutNulls,
  );

  return firestoreData;
}

class BirthdayDateRecordDocumentEquality
    implements Equality<BirthdayDateRecord> {
  const BirthdayDateRecordDocumentEquality();

  @override
  bool equals(BirthdayDateRecord? e1, BirthdayDateRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.userID == e2?.userID &&
        e1?.dateDay == e2?.dateDay &&
        e1?.dateMonth == e2?.dateMonth;
  }

  @override
  int hash(BirthdayDateRecord? e) =>
      const ListEquality().hash([e?.date, e?.userID, e?.dateDay, e?.dateMonth]);

  @override
  bool isValidKey(Object? o) => o is BirthdayDateRecord;
}
