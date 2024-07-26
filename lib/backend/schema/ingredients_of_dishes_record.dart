import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientsOfDishesRecord extends FirestoreRecord {
  IngredientsOfDishesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "inStock" field.
  bool? _inStock;
  bool get inStock => _inStock ?? false;
  bool hasInStock() => _inStock != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "removeToShopList" field.
  String? _removeToShopList;
  String get removeToShopList => _removeToShopList ?? '';
  bool hasRemoveToShopList() => _removeToShopList != null;

  // "storageFoodOldQuantity" field.
  double? _storageFoodOldQuantity;
  double get storageFoodOldQuantity => _storageFoodOldQuantity ?? 0.0;
  bool hasStorageFoodOldQuantity() => _storageFoodOldQuantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _inStock = snapshotData['inStock'] as bool?;
    _unit = snapshotData['unit'] as String?;
    _removeToShopList = snapshotData['removeToShopList'] as String?;
    _storageFoodOldQuantity =
        castToType<double>(snapshotData['storageFoodOldQuantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ingredientsOfDishes')
          : FirebaseFirestore.instance.collectionGroup('ingredientsOfDishes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ingredientsOfDishes').doc(id);

  static Stream<IngredientsOfDishesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredientsOfDishesRecord.fromSnapshot(s));

  static Future<IngredientsOfDishesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IngredientsOfDishesRecord.fromSnapshot(s));

  static IngredientsOfDishesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredientsOfDishesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredientsOfDishesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredientsOfDishesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredientsOfDishesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredientsOfDishesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredientsOfDishesRecordData({
  String? name,
  double? quantity,
  bool? inStock,
  String? unit,
  String? removeToShopList,
  double? storageFoodOldQuantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'inStock': inStock,
      'unit': unit,
      'removeToShopList': removeToShopList,
      'storageFoodOldQuantity': storageFoodOldQuantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredientsOfDishesRecordDocumentEquality
    implements Equality<IngredientsOfDishesRecord> {
  const IngredientsOfDishesRecordDocumentEquality();

  @override
  bool equals(IngredientsOfDishesRecord? e1, IngredientsOfDishesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.quantity == e2?.quantity &&
        e1?.inStock == e2?.inStock &&
        e1?.unit == e2?.unit &&
        e1?.removeToShopList == e2?.removeToShopList &&
        e1?.storageFoodOldQuantity == e2?.storageFoodOldQuantity;
  }

  @override
  int hash(IngredientsOfDishesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.quantity,
        e?.inStock,
        e?.unit,
        e?.removeToShopList,
        e?.storageFoodOldQuantity
      ]);

  @override
  bool isValidKey(Object? o) => o is IngredientsOfDishesRecord;
}
