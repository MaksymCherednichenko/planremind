import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemIngredientsRecord extends FirestoreRecord {
  MenuItemIngredientsRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _inStock = snapshotData['inStock'] as bool?;
    _unit = snapshotData['unit'] as String?;
    _removeToShopList = snapshotData['removeToShopList'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menuItemIngredients')
          : FirebaseFirestore.instance.collectionGroup('menuItemIngredients');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menuItemIngredients').doc(id);

  static Stream<MenuItemIngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemIngredientsRecord.fromSnapshot(s));

  static Future<MenuItemIngredientsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MenuItemIngredientsRecord.fromSnapshot(s));

  static MenuItemIngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemIngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemIngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemIngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuItemIngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemIngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemIngredientsRecordData({
  String? name,
  double? quantity,
  bool? inStock,
  String? unit,
  String? removeToShopList,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'inStock': inStock,
      'unit': unit,
      'removeToShopList': removeToShopList,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemIngredientsRecordDocumentEquality
    implements Equality<MenuItemIngredientsRecord> {
  const MenuItemIngredientsRecordDocumentEquality();

  @override
  bool equals(MenuItemIngredientsRecord? e1, MenuItemIngredientsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.quantity == e2?.quantity &&
        e1?.inStock == e2?.inStock &&
        e1?.unit == e2?.unit &&
        e1?.removeToShopList == e2?.removeToShopList;
  }

  @override
  int hash(MenuItemIngredientsRecord? e) => const ListEquality()
      .hash([e?.name, e?.quantity, e?.inStock, e?.unit, e?.removeToShopList]);

  @override
  bool isValidKey(Object? o) => o is MenuItemIngredientsRecord;
}
