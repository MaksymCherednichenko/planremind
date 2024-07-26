import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarsRecord extends FirestoreRecord {
  CarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "VINCode" field.
  String? _vINCode;
  String get vINCode => _vINCode ?? '';
  bool hasVINCode() => _vINCode != null;

  // "engineType" field.
  String? _engineType;
  String get engineType => _engineType ?? '';
  bool hasEngineType() => _engineType != null;

  // "bodyClass" field.
  String? _bodyClass;
  String get bodyClass => _bodyClass ?? '';
  bool hasBodyClass() => _bodyClass != null;

  // "mileage" field.
  int? _mileage;
  int get mileage => _mileage ?? 0;
  bool hasMileage() => _mileage != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _brand = snapshotData['brand'] as String?;
    _model = snapshotData['model'] as String?;
    _year = castToType<int>(snapshotData['year']);
    _vINCode = snapshotData['VINCode'] as String?;
    _engineType = snapshotData['engineType'] as String?;
    _bodyClass = snapshotData['bodyClass'] as String?;
    _mileage = castToType<int>(snapshotData['mileage']);
    _photo = snapshotData['photo'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cars')
          : FirebaseFirestore.instance.collectionGroup('cars');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cars').doc(id);

  static Stream<CarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarsRecord.fromSnapshot(s));

  static Future<CarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarsRecord.fromSnapshot(s));

  static CarsRecord fromSnapshot(DocumentSnapshot snapshot) => CarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarsRecordData({
  String? brand,
  String? model,
  int? year,
  String? vINCode,
  String? engineType,
  String? bodyClass,
  int? mileage,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'brand': brand,
      'model': model,
      'year': year,
      'VINCode': vINCode,
      'engineType': engineType,
      'bodyClass': bodyClass,
      'mileage': mileage,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarsRecordDocumentEquality implements Equality<CarsRecord> {
  const CarsRecordDocumentEquality();

  @override
  bool equals(CarsRecord? e1, CarsRecord? e2) {
    return e1?.brand == e2?.brand &&
        e1?.model == e2?.model &&
        e1?.year == e2?.year &&
        e1?.vINCode == e2?.vINCode &&
        e1?.engineType == e2?.engineType &&
        e1?.bodyClass == e2?.bodyClass &&
        e1?.mileage == e2?.mileage &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(CarsRecord? e) => const ListEquality().hash([
        e?.brand,
        e?.model,
        e?.year,
        e?.vINCode,
        e?.engineType,
        e?.bodyClass,
        e?.mileage,
        e?.photo
      ]);

  @override
  bool isValidKey(Object? o) => o is CarsRecord;
}
