import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeStuffCategoriesRecord extends FirestoreRecord {
  HomeStuffCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stuffType" field.
  HomeStuffEnum? _stuffType;
  HomeStuffEnum? get stuffType => _stuffType;
  bool hasStuffType() => _stuffType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _stuffType = snapshotData['stuffType'] is HomeStuffEnum
        ? snapshotData['stuffType']
        : deserializeEnum<HomeStuffEnum>(snapshotData['stuffType']);
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('HomeStuffCategories')
          : FirebaseFirestore.instance.collectionGroup('HomeStuffCategories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('HomeStuffCategories').doc(id);

  static Stream<HomeStuffCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomeStuffCategoriesRecord.fromSnapshot(s));

  static Future<HomeStuffCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HomeStuffCategoriesRecord.fromSnapshot(s));

  static HomeStuffCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomeStuffCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomeStuffCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomeStuffCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomeStuffCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomeStuffCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomeStuffCategoriesRecordData({
  HomeStuffEnum? stuffType,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stuffType': stuffType,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomeStuffCategoriesRecordDocumentEquality
    implements Equality<HomeStuffCategoriesRecord> {
  const HomeStuffCategoriesRecordDocumentEquality();

  @override
  bool equals(HomeStuffCategoriesRecord? e1, HomeStuffCategoriesRecord? e2) {
    return e1?.stuffType == e2?.stuffType && e1?.name == e2?.name;
  }

  @override
  int hash(HomeStuffCategoriesRecord? e) =>
      const ListEquality().hash([e?.stuffType, e?.name]);

  @override
  bool isValidKey(Object? o) => o is HomeStuffCategoriesRecord;
}
