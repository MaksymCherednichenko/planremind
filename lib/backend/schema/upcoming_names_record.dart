import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpcomingNamesRecord extends FirestoreRecord {
  UpcomingNamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "item_id" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  bool hasItemId() => _itemId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _itemId = snapshotData['item_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('upcomingNames')
          : FirebaseFirestore.instance.collectionGroup('upcomingNames');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('upcomingNames').doc(id);

  static Stream<UpcomingNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpcomingNamesRecord.fromSnapshot(s));

  static Future<UpcomingNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpcomingNamesRecord.fromSnapshot(s));

  static UpcomingNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpcomingNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpcomingNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpcomingNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpcomingNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpcomingNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpcomingNamesRecordData({
  String? name,
  String? itemId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'item_id': itemId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpcomingNamesRecordDocumentEquality
    implements Equality<UpcomingNamesRecord> {
  const UpcomingNamesRecordDocumentEquality();

  @override
  bool equals(UpcomingNamesRecord? e1, UpcomingNamesRecord? e2) {
    return e1?.name == e2?.name && e1?.itemId == e2?.itemId;
  }

  @override
  int hash(UpcomingNamesRecord? e) =>
      const ListEquality().hash([e?.name, e?.itemId]);

  @override
  bool isValidKey(Object? o) => o is UpcomingNamesRecord;
}
