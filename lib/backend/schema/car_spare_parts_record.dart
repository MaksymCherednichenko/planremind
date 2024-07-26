import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarSparePartsRecord extends FirestoreRecord {
  CarSparePartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car" field.
  DocumentReference? _car;
  DocumentReference? get car => _car;
  bool hasCar() => _car != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "installationMileage" field.
  int? _installationMileage;
  int get installationMileage => _installationMileage ?? 0;
  bool hasInstallationMileage() => _installationMileage != null;

  // "replaceMentmileage" field.
  int? _replaceMentmileage;
  int get replaceMentmileage => _replaceMentmileage ?? 0;
  bool hasReplaceMentmileage() => _replaceMentmileage != null;

  // "showInfo" field.
  bool? _showInfo;
  bool get showInfo => _showInfo ?? false;
  bool hasShowInfo() => _showInfo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _car = snapshotData['car'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _installationMileage = castToType<int>(snapshotData['installationMileage']);
    _replaceMentmileage = castToType<int>(snapshotData['replaceMentmileage']);
    _showInfo = snapshotData['showInfo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carSpareParts')
          : FirebaseFirestore.instance.collectionGroup('carSpareParts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carSpareParts').doc(id);

  static Stream<CarSparePartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarSparePartsRecord.fromSnapshot(s));

  static Future<CarSparePartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarSparePartsRecord.fromSnapshot(s));

  static CarSparePartsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarSparePartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarSparePartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarSparePartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarSparePartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarSparePartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarSparePartsRecordData({
  DocumentReference? car,
  String? name,
  int? installationMileage,
  int? replaceMentmileage,
  bool? showInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car': car,
      'name': name,
      'installationMileage': installationMileage,
      'replaceMentmileage': replaceMentmileage,
      'showInfo': showInfo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarSparePartsRecordDocumentEquality
    implements Equality<CarSparePartsRecord> {
  const CarSparePartsRecordDocumentEquality();

  @override
  bool equals(CarSparePartsRecord? e1, CarSparePartsRecord? e2) {
    return e1?.car == e2?.car &&
        e1?.name == e2?.name &&
        e1?.installationMileage == e2?.installationMileage &&
        e1?.replaceMentmileage == e2?.replaceMentmileage &&
        e1?.showInfo == e2?.showInfo;
  }

  @override
  int hash(CarSparePartsRecord? e) => const ListEquality().hash([
        e?.car,
        e?.name,
        e?.installationMileage,
        e?.replaceMentmileage,
        e?.showInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is CarSparePartsRecord;
}
