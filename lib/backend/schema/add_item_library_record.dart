import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddItemLibraryRecord extends FirestoreRecord {
  AddItemLibraryRecord._(
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

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

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
    _endDate = snapshotData['end_date'] as DateTime?;
    _unit = snapshotData['unit'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Add_Item_Library')
          : FirebaseFirestore.instance.collectionGroup('Add_Item_Library');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Add_Item_Library').doc(id);

  static Stream<AddItemLibraryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddItemLibraryRecord.fromSnapshot(s));

  static Future<AddItemLibraryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddItemLibraryRecord.fromSnapshot(s));

  static AddItemLibraryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddItemLibraryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddItemLibraryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddItemLibraryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddItemLibraryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddItemLibraryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddItemLibraryRecordData({
  String? name,
  String? category,
  DateTime? endDate,
  String? unit,
  double? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'end_date': endDate,
      'unit': unit,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddItemLibraryRecordDocumentEquality
    implements Equality<AddItemLibraryRecord> {
  const AddItemLibraryRecordDocumentEquality();

  @override
  bool equals(AddItemLibraryRecord? e1, AddItemLibraryRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.endDate == e2?.endDate &&
        e1?.unit == e2?.unit &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(AddItemLibraryRecord? e) => const ListEquality()
      .hash([e?.name, e?.category, e?.endDate, e?.unit, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is AddItemLibraryRecord;
}
