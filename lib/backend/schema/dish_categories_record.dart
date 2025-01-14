import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DishCategoriesRecord extends FirestoreRecord {
  DishCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "breakfasts" field.
  List<DocumentReference>? _breakfasts;
  List<DocumentReference> get breakfasts => _breakfasts ?? const [];
  bool hasBreakfasts() => _breakfasts != null;

  // "lunches" field.
  List<DocumentReference>? _lunches;
  List<DocumentReference> get lunches => _lunches ?? const [];
  bool hasLunches() => _lunches != null;

  // "dinners" field.
  List<DocumentReference>? _dinners;
  List<DocumentReference> get dinners => _dinners ?? const [];
  bool hasDinners() => _dinners != null;

  // "others" field.
  List<DocumentReference>? _others;
  List<DocumentReference> get others => _others ?? const [];
  bool hasOthers() => _others != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _breakfasts = getDataList(snapshotData['breakfasts']);
    _lunches = getDataList(snapshotData['lunches']);
    _dinners = getDataList(snapshotData['dinners']);
    _others = getDataList(snapshotData['others']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dishCategories')
          : FirebaseFirestore.instance.collectionGroup('dishCategories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dishCategories').doc(id);

  static Stream<DishCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DishCategoriesRecord.fromSnapshot(s));

  static Future<DishCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DishCategoriesRecord.fromSnapshot(s));

  static DishCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DishCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DishCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DishCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DishCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DishCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDishCategoriesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class DishCategoriesRecordDocumentEquality
    implements Equality<DishCategoriesRecord> {
  const DishCategoriesRecordDocumentEquality();

  @override
  bool equals(DishCategoriesRecord? e1, DishCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.breakfasts, e2?.breakfasts) &&
        listEquality.equals(e1?.lunches, e2?.lunches) &&
        listEquality.equals(e1?.dinners, e2?.dinners) &&
        listEquality.equals(e1?.others, e2?.others);
  }

  @override
  int hash(DishCategoriesRecord? e) => const ListEquality()
      .hash([e?.breakfasts, e?.lunches, e?.dinners, e?.others]);

  @override
  bool isValidKey(Object? o) => o is DishCategoriesRecord;
}
