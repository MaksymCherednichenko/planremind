import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsedUserCodeRecord extends FirestoreRecord {
  UsedUserCodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userNumber" field.
  int? _userNumber;
  int get userNumber => _userNumber ?? 0;
  bool hasUserNumber() => _userNumber != null;

  void _initializeFields() {
    _userNumber = castToType<int>(snapshotData['userNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usedUserCode');

  static Stream<UsedUserCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsedUserCodeRecord.fromSnapshot(s));

  static Future<UsedUserCodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsedUserCodeRecord.fromSnapshot(s));

  static UsedUserCodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsedUserCodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsedUserCodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsedUserCodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsedUserCodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsedUserCodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsedUserCodeRecordData({
  int? userNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userNumber': userNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsedUserCodeRecordDocumentEquality
    implements Equality<UsedUserCodeRecord> {
  const UsedUserCodeRecordDocumentEquality();

  @override
  bool equals(UsedUserCodeRecord? e1, UsedUserCodeRecord? e2) {
    return e1?.userNumber == e2?.userNumber;
  }

  @override
  int hash(UsedUserCodeRecord? e) => const ListEquality().hash([e?.userNumber]);

  @override
  bool isValidKey(Object? o) => o is UsedUserCodeRecord;
}
