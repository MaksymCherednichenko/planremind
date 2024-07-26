import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateInfoRecord extends FirestoreRecord {
  DateInfoRecord._(
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

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _shopName = snapshotData['shop_name'] as String?;
    _unit = snapshotData['unit'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _category = snapshotData['category'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dateInfo')
          : FirebaseFirestore.instance.collectionGroup('dateInfo');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dateInfo').doc(id);

  static Stream<DateInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DateInfoRecord.fromSnapshot(s));

  static Future<DateInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DateInfoRecord.fromSnapshot(s));

  static DateInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DateInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DateInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DateInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DateInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DateInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDateInfoRecordData({
  String? name,
  String? shopName,
  String? unit,
  double? quantity,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'shop_name': shopName,
      'unit': unit,
      'quantity': quantity,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class DateInfoRecordDocumentEquality implements Equality<DateInfoRecord> {
  const DateInfoRecordDocumentEquality();

  @override
  bool equals(DateInfoRecord? e1, DateInfoRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.shopName == e2?.shopName &&
        e1?.unit == e2?.unit &&
        e1?.quantity == e2?.quantity &&
        e1?.category == e2?.category;
  }

  @override
  int hash(DateInfoRecord? e) => const ListEquality()
      .hash([e?.name, e?.shopName, e?.unit, e?.quantity, e?.category]);

  @override
  bool isValidKey(Object? o) => o is DateInfoRecord;
}
