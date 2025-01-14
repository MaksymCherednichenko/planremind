import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllHauseholdRecord extends FirestoreRecord {
  AllHauseholdRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _unit = snapshotData['unit'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('allHausehold')
          : FirebaseFirestore.instance.collectionGroup('allHausehold');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('allHausehold').doc(id);

  static Stream<AllHauseholdRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllHauseholdRecord.fromSnapshot(s));

  static Future<AllHauseholdRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllHauseholdRecord.fromSnapshot(s));

  static AllHauseholdRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllHauseholdRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllHauseholdRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllHauseholdRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllHauseholdRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllHauseholdRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllHauseholdRecordData({
  String? name,
  String? unit,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'unit': unit,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllHauseholdRecordDocumentEquality
    implements Equality<AllHauseholdRecord> {
  const AllHauseholdRecordDocumentEquality();

  @override
  bool equals(AllHauseholdRecord? e1, AllHauseholdRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.unit == e2?.unit &&
        e1?.category == e2?.category;
  }

  @override
  int hash(AllHauseholdRecord? e) =>
      const ListEquality().hash([e?.name, e?.unit, e?.category]);

  @override
  bool isValidKey(Object? o) => o is AllHauseholdRecord;
}
