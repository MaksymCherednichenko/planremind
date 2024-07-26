import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryShoppingListRecord extends FirestoreRecord {
  HistoryShoppingListRecord._(
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

  // "totalSum" field.
  double? _totalSum;
  double get totalSum => _totalSum ?? 0.0;
  bool hasTotalSum() => _totalSum != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
    _totalSum = castToType<double>(snapshotData['totalSum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('historyShoppingList');

  static Stream<HistoryShoppingListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryShoppingListRecord.fromSnapshot(s));

  static Future<HistoryShoppingListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HistoryShoppingListRecord.fromSnapshot(s));

  static HistoryShoppingListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryShoppingListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryShoppingListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryShoppingListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryShoppingListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryShoppingListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryShoppingListRecordData({
  DateTime? date,
  String? userID,
  double? totalSum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'userID': userID,
      'totalSum': totalSum,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryShoppingListRecordDocumentEquality
    implements Equality<HistoryShoppingListRecord> {
  const HistoryShoppingListRecordDocumentEquality();

  @override
  bool equals(HistoryShoppingListRecord? e1, HistoryShoppingListRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.userID == e2?.userID &&
        e1?.totalSum == e2?.totalSum;
  }

  @override
  int hash(HistoryShoppingListRecord? e) =>
      const ListEquality().hash([e?.date, e?.userID, e?.totalSum]);

  @override
  bool isValidKey(Object? o) => o is HistoryShoppingListRecord;
}
