import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddItemHouseholdRecord extends FirestoreRecord {
  AddItemHouseholdRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as String?;
    _unit = snapshotData['unit'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Add_Item_Household')
          : FirebaseFirestore.instance.collectionGroup('Add_Item_Household');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Add_Item_Household').doc(id);

  static Stream<AddItemHouseholdRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddItemHouseholdRecord.fromSnapshot(s));

  static Future<AddItemHouseholdRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AddItemHouseholdRecord.fromSnapshot(s));

  static AddItemHouseholdRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddItemHouseholdRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddItemHouseholdRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddItemHouseholdRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddItemHouseholdRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddItemHouseholdRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddItemHouseholdRecordData({
  String? name,
  String? category,
  String? unit,
  double? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'unit': unit,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddItemHouseholdRecordDocumentEquality
    implements Equality<AddItemHouseholdRecord> {
  const AddItemHouseholdRecordDocumentEquality();

  @override
  bool equals(AddItemHouseholdRecord? e1, AddItemHouseholdRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.unit == e2?.unit &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(AddItemHouseholdRecord? e) =>
      const ListEquality().hash([e?.name, e?.category, e?.unit, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is AddItemHouseholdRecord;
}
