import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BirthdayDateInfoRecord extends FirestoreRecord {
  BirthdayDateInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('birthdayDateInfo')
          : FirebaseFirestore.instance.collectionGroup('birthdayDateInfo');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('birthdayDateInfo').doc(id);

  static Stream<BirthdayDateInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BirthdayDateInfoRecord.fromSnapshot(s));

  static Future<BirthdayDateInfoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BirthdayDateInfoRecord.fromSnapshot(s));

  static BirthdayDateInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BirthdayDateInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BirthdayDateInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BirthdayDateInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BirthdayDateInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BirthdayDateInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBirthdayDateInfoRecordData({
  String? name,
  int? age,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
    }.withoutNulls,
  );

  return firestoreData;
}

class BirthdayDateInfoRecordDocumentEquality
    implements Equality<BirthdayDateInfoRecord> {
  const BirthdayDateInfoRecordDocumentEquality();

  @override
  bool equals(BirthdayDateInfoRecord? e1, BirthdayDateInfoRecord? e2) {
    return e1?.name == e2?.name && e1?.age == e2?.age;
  }

  @override
  int hash(BirthdayDateInfoRecord? e) =>
      const ListEquality().hash([e?.name, e?.age]);

  @override
  bool isValidKey(Object? o) => o is BirthdayDateInfoRecord;
}
