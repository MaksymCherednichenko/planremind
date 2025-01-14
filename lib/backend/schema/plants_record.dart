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
  WateringFrequencyStruct? _wateringFrequency;
  WateringFrequencyStruct get wateringFrequency =>
      _wateringFrequency ?? WateringFrequencyStruct();
  bool hasWateringFrequency() => _wateringFrequency != null;

  // "solidChangeFrequency" field.
  SolidChangeFrequencyStruct? _solidChangeFrequency;
  SolidChangeFrequencyStruct get solidChangeFrequency =>
      _solidChangeFrequency ?? SolidChangeFrequencyStruct();
  bool hasSolidChangeFrequency() => _solidChangeFrequency != null;

  // "fertilizationFrequency" field.
  FertilizationFrequencyStruct? _fertilizationFrequency;
  FertilizationFrequencyStruct get fertilizationFrequency =>
      _fertilizationFrequency ?? FertilizationFrequencyStruct();
  bool hasFertilizationFrequency() => _fertilizationFrequency != null;

  // "lighting" field.
  PlantLightingEnum? _lighting;
  PlantLightingEnum? get lighting => _lighting;
  bool hasLighting() => _lighting != null;

  // "temperature" field.
  PlantTemperatureEnum? _temperature;
  PlantTemperatureEnum? get temperature => _temperature;
  bool hasTemperature() => _temperature != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _photo = snapshotData['photo'] as String?;
    _name = snapshotData['name'] as String?;
    _amountOfWater = castToType<int>(snapshotData['amountOfWater']);
    _wateringFrequency =
        snapshotData['wateringFrequency'] is WateringFrequencyStruct
            ? snapshotData['wateringFrequency']
            : WateringFrequencyStruct.maybeFromMap(
                snapshotData['wateringFrequency']);
    _solidChangeFrequency =
        snapshotData['solidChangeFrequency'] is SolidChangeFrequencyStruct
            ? snapshotData['solidChangeFrequency']
            : SolidChangeFrequencyStruct.maybeFromMap(
                snapshotData['solidChangeFrequency']);
    _fertilizationFrequency =
        snapshotData['fertilizationFrequency'] is FertilizationFrequencyStruct
            ? snapshotData['fertilizationFrequency']
            : FertilizationFrequencyStruct.maybeFromMap(
                snapshotData['fertilizationFrequency']);
    _lighting = snapshotData['lighting'] is PlantLightingEnum
        ? snapshotData['lighting']
        : deserializeEnum<PlantLightingEnum>(snapshotData['lighting']);
    _temperature = snapshotData['temperature'] is PlantTemperatureEnum
        ? snapshotData['temperature']
        : deserializeEnum<PlantTemperatureEnum>(snapshotData['temperature']);
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
  WateringFrequencyStruct? wateringFrequency,
  SolidChangeFrequencyStruct? solidChangeFrequency,
  FertilizationFrequencyStruct? fertilizationFrequency,
  PlantLightingEnum? lighting,
  PlantTemperatureEnum? temperature,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'name': name,
      'amountOfWater': amountOfWater,
      'wateringFrequency': WateringFrequencyStruct().toMap(),
      'solidChangeFrequency': SolidChangeFrequencyStruct().toMap(),
      'fertilizationFrequency': FertilizationFrequencyStruct().toMap(),
      'lighting': lighting,
      'temperature': temperature,
    }.withoutNulls,
  );

  // Handle nested data for "wateringFrequency" field.
  addWateringFrequencyStructData(
      firestoreData, wateringFrequency, 'wateringFrequency');

  // Handle nested data for "solidChangeFrequency" field.
  addSolidChangeFrequencyStructData(
      firestoreData, solidChangeFrequency, 'solidChangeFrequency');

  // Handle nested data for "fertilizationFrequency" field.
  addFertilizationFrequencyStructData(
      firestoreData, fertilizationFrequency, 'fertilizationFrequency');

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
        e1?.solidChangeFrequency == e2?.solidChangeFrequency &&
        e1?.fertilizationFrequency == e2?.fertilizationFrequency &&
        e1?.lighting == e2?.lighting &&
        e1?.temperature == e2?.temperature;
  }

  @override
  int hash(PlantsRecord? e) => const ListEquality().hash([
        e?.photo,
        e?.name,
        e?.amountOfWater,
        e?.wateringFrequency,
        e?.solidChangeFrequency,
        e?.fertilizationFrequency,
        e?.lighting,
        e?.temperature
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantsRecord;
}
