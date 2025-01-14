import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffStorageRecord extends FirestoreRecord {
  StaffStorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "staffCategoryType" field.
  HomeStuffEnum? _staffCategoryType;
  HomeStuffEnum? get staffCategoryType => _staffCategoryType;
  bool hasStaffCategoryType() => _staffCategoryType != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "count" field.
  double? _count;
  double get count => _count ?? 0.0;
  bool hasCount() => _count != null;

  // "unit" field.
  UnitsEnum? _unit;
  UnitsEnum? get unit => _unit;
  bool hasUnit() => _unit != null;

  // "endOfDate" field.
  DateTime? _endOfDate;
  DateTime? get endOfDate => _endOfDate;
  bool hasEndOfDate() => _endOfDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _staffCategoryType = snapshotData['staffCategoryType'] is HomeStuffEnum
        ? snapshotData['staffCategoryType']
        : deserializeEnum<HomeStuffEnum>(snapshotData['staffCategoryType']);
    _category = snapshotData['category'] as String?;
    _name = snapshotData['name'] as String?;
    _count = castToType<double>(snapshotData['count']);
    _unit = snapshotData['unit'] is UnitsEnum
        ? snapshotData['unit']
        : deserializeEnum<UnitsEnum>(snapshotData['unit']);
    _endOfDate = snapshotData['endOfDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('staffStorage')
          : FirebaseFirestore.instance.collectionGroup('staffStorage');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('staffStorage').doc(id);

  static Stream<StaffStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StaffStorageRecord.fromSnapshot(s));

  static Future<StaffStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StaffStorageRecord.fromSnapshot(s));

  static StaffStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StaffStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StaffStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StaffStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StaffStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StaffStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStaffStorageRecordData({
  HomeStuffEnum? staffCategoryType,
  String? category,
  String? name,
  double? count,
  UnitsEnum? unit,
  DateTime? endOfDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'staffCategoryType': staffCategoryType,
      'category': category,
      'name': name,
      'count': count,
      'unit': unit,
      'endOfDate': endOfDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class StaffStorageRecordDocumentEquality
    implements Equality<StaffStorageRecord> {
  const StaffStorageRecordDocumentEquality();

  @override
  bool equals(StaffStorageRecord? e1, StaffStorageRecord? e2) {
    return e1?.staffCategoryType == e2?.staffCategoryType &&
        e1?.category == e2?.category &&
        e1?.name == e2?.name &&
        e1?.count == e2?.count &&
        e1?.unit == e2?.unit &&
        e1?.endOfDate == e2?.endOfDate;
  }

  @override
  int hash(StaffStorageRecord? e) => const ListEquality().hash([
        e?.staffCategoryType,
        e?.category,
        e?.name,
        e?.count,
        e?.unit,
        e?.endOfDate
      ]);

  @override
  bool isValidKey(Object? o) => o is StaffStorageRecord;
}
