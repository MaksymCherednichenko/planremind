import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShoppingListRecord extends FirestoreRecord {
  ShoppingListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "shop_name" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "bought" field.
  bool? _bought;
  bool get bought => _bought ?? false;
  bool hasBought() => _bought != null;

  // "categoryTag" field.
  String? _categoryTag;
  String get categoryTag => _categoryTag ?? '';
  bool hasCategoryTag() => _categoryTag != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _shopName = snapshotData['shop_name'] as String?;
    _unit = snapshotData['unit'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _bought = snapshotData['bought'] as bool?;
    _categoryTag = snapshotData['categoryTag'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Shopping_List')
          : FirebaseFirestore.instance.collectionGroup('Shopping_List');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Shopping_List').doc(id);

  static Stream<ShoppingListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShoppingListRecord.fromSnapshot(s));

  static Future<ShoppingListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShoppingListRecord.fromSnapshot(s));

  static ShoppingListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShoppingListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShoppingListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShoppingListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShoppingListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShoppingListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShoppingListRecordData({
  String? name,
  String? shopName,
  String? unit,
  double? quantity,
  bool? bought,
  String? categoryTag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'shop_name': shopName,
      'unit': unit,
      'quantity': quantity,
      'bought': bought,
      'categoryTag': categoryTag,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShoppingListRecordDocumentEquality
    implements Equality<ShoppingListRecord> {
  const ShoppingListRecordDocumentEquality();

  @override
  bool equals(ShoppingListRecord? e1, ShoppingListRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.shopName == e2?.shopName &&
        e1?.unit == e2?.unit &&
        e1?.quantity == e2?.quantity &&
        e1?.bought == e2?.bought &&
        e1?.categoryTag == e2?.categoryTag;
  }

  @override
  int hash(ShoppingListRecord? e) => const ListEquality().hash(
      [e?.name, e?.shopName, e?.unit, e?.quantity, e?.bought, e?.categoryTag]);

  @override
  bool isValidKey(Object? o) => o is ShoppingListRecord;
}
