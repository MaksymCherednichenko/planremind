import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsCategoryAndShopRecord extends FirestoreRecord {
  SettingsCategoryAndShopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryFood" field.
  List<String>? _categoryFood;
  List<String> get categoryFood => _categoryFood ?? const [];
  bool hasCategoryFood() => _categoryFood != null;

  // "categoryHousehold" field.
  List<String>? _categoryHousehold;
  List<String> get categoryHousehold => _categoryHousehold ?? const [];
  bool hasCategoryHousehold() => _categoryHousehold != null;

  // "shops" field.
  List<String>? _shops;
  List<String> get shops => _shops ?? const [];
  bool hasShops() => _shops != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categoryFood = getDataList(snapshotData['categoryFood']);
    _categoryHousehold = getDataList(snapshotData['categoryHousehold']);
    _shops = getDataList(snapshotData['shops']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('settingsCategoryAndShop')
          : FirebaseFirestore.instance
              .collectionGroup('settingsCategoryAndShop');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('settingsCategoryAndShop').doc(id);

  static Stream<SettingsCategoryAndShopRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsCategoryAndShopRecord.fromSnapshot(s));

  static Future<SettingsCategoryAndShopRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SettingsCategoryAndShopRecord.fromSnapshot(s));

  static SettingsCategoryAndShopRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SettingsCategoryAndShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsCategoryAndShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsCategoryAndShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsCategoryAndShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsCategoryAndShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsCategoryAndShopRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SettingsCategoryAndShopRecordDocumentEquality
    implements Equality<SettingsCategoryAndShopRecord> {
  const SettingsCategoryAndShopRecordDocumentEquality();

  @override
  bool equals(
      SettingsCategoryAndShopRecord? e1, SettingsCategoryAndShopRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.categoryFood, e2?.categoryFood) &&
        listEquality.equals(e1?.categoryHousehold, e2?.categoryHousehold) &&
        listEquality.equals(e1?.shops, e2?.shops);
  }

  @override
  int hash(SettingsCategoryAndShopRecord? e) => const ListEquality()
      .hash([e?.categoryFood, e?.categoryHousehold, e?.shops]);

  @override
  bool isValidKey(Object? o) => o is SettingsCategoryAndShopRecord;
}
