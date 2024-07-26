import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantsRecord extends FirestoreRecord {
  PlantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amountOfWater" field.
  int? _amountOfWater;
  int get amountOfWater => _amountOfWater ?? 0;
  bool hasAmountOfWater() => _amountOfWater != null;

  // "wateringFrequency" field.
  String? _wateringFrequency;
  String get wateringFrequency => _wateringFrequency ?? '';
  bool hasWateringFrequency() => _wateringFrequency != null;

  // "lighting" field.
  String? _lighting;
  String get lighting => _lighting ?? '';
  bool hasLighting() => _lighting != null;

  // "temperature" field.
  String? _temperature;
  String get temperature => _temperature ?? '';
  bool hasTemperature() => _temperature != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _photo = snapshotData['photo'] as String?;
    _name = snapshotData['name'] as String?;
    _amountOfWater = castToType<int>(snapshotData['amountOfWater']);
    _wateringFrequency = snapshotData['wateringFrequency'] as String?;
    _lighting = snapshotData['lighting'] as String?;
    _temperature = snapshotData['temperature'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('plants')
          : FirebaseFirestore.instance.collectionGroup('plants');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('plants').doc(id);

  static Stream<PlantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantsRecord.fromSnapshot(s));

  static Future<PlantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantsRecord.fromSnapshot(s));

  static PlantsRecord fromSnapshot(DocumentSnapshot snapshot) => PlantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantsRecordData({
  String? photo,
  String? name,
  int? amountOfWater,
  String? wateringFrequency,
  String? lighting,
  String? temperature,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'name': name,
      'amountOfWater': amountOfWater,
      'wateringFrequency': wateringFrequency,
      'lighting': lighting,
      'temperature': temperature,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantsRecordDocumentEquality implements Equality<PlantsRecord> {
  const PlantsRecordDocumentEquality();

  @override
  bool equals(PlantsRecord? e1, PlantsRecord? e2) {
    return e1?.photo == e2?.photo &&
        e1?.name == e2?.name &&
        e1?.amountOfWater == e2?.amountOfWater &&
        e1?.wateringFrequency == e2?.wateringFrequency &&
        e1?.lighting == e2?.lighting &&
        e1?.temperature == e2?.temperature;
  }

  @override
  int hash(PlantsRecord? e) => const ListEquality().hash([
        e?.photo,
        e?.name,
        e?.amountOfWater,
        e?.wateringFrequency,
        e?.lighting,
        e?.temperature
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantsRecord;
}
