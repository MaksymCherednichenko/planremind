import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeFriendShareBoxRecord extends FirestoreRecord {
  HomeFriendShareBoxRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fromUserId" field.
  DocumentReference? _fromUserId;
  DocumentReference? get fromUserId => _fromUserId;
  bool hasFromUserId() => _fromUserId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "stuff" field.
  List<DocumentReference>? _stuff;
  List<DocumentReference> get stuff => _stuff ?? const [];
  bool hasStuff() => _stuff != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fromUserId = snapshotData['fromUserId'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _stuff = getDataList(snapshotData['stuff']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('homeFriendShareBox')
          : FirebaseFirestore.instance.collectionGroup('homeFriendShareBox');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('homeFriendShareBox').doc(id);

  static Stream<HomeFriendShareBoxRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomeFriendShareBoxRecord.fromSnapshot(s));

  static Future<HomeFriendShareBoxRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HomeFriendShareBoxRecord.fromSnapshot(s));

  static HomeFriendShareBoxRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomeFriendShareBoxRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomeFriendShareBoxRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomeFriendShareBoxRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomeFriendShareBoxRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomeFriendShareBoxRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomeFriendShareBoxRecordData({
  DocumentReference? fromUserId,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fromUserId': fromUserId,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomeFriendShareBoxRecordDocumentEquality
    implements Equality<HomeFriendShareBoxRecord> {
  const HomeFriendShareBoxRecordDocumentEquality();

  @override
  bool equals(HomeFriendShareBoxRecord? e1, HomeFriendShareBoxRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fromUserId == e2?.fromUserId &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.stuff, e2?.stuff);
  }

  @override
  int hash(HomeFriendShareBoxRecord? e) =>
      const ListEquality().hash([e?.fromUserId, e?.date, e?.stuff]);

  @override
  bool isValidKey(Object? o) => o is HomeFriendShareBoxRecord;
}
