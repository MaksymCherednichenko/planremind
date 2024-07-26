import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleStatesRecord extends FirestoreRecord {
  ModuleStatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "home" field.
  bool? _home;
  bool get home => _home ?? false;
  bool hasHome() => _home != null;

  // "car" field.
  bool? _car;
  bool get car => _car ?? false;
  bool hasCar() => _car != null;

  // "plants" field.
  bool? _plants;
  bool get plants => _plants ?? false;
  bool hasPlants() => _plants != null;

  // "health" field.
  bool? _health;
  bool get health => _health ?? false;
  bool hasHealth() => _health != null;

  // "pets" field.
  bool? _pets;
  bool get pets => _pets ?? false;
  bool hasPets() => _pets != null;

  // "sport" field.
  bool? _sport;
  bool get sport => _sport ?? false;
  bool hasSport() => _sport != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _home = snapshotData['home'] as bool?;
    _car = snapshotData['car'] as bool?;
    _plants = snapshotData['plants'] as bool?;
    _health = snapshotData['health'] as bool?;
    _pets = snapshotData['pets'] as bool?;
    _sport = snapshotData['sport'] as bool?;
    _userId = snapshotData['user_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('moduleStates')
          : FirebaseFirestore.instance.collectionGroup('moduleStates');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('moduleStates').doc(id);

  static Stream<ModuleStatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleStatesRecord.fromSnapshot(s));

  static Future<ModuleStatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModuleStatesRecord.fromSnapshot(s));

  static ModuleStatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModuleStatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleStatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleStatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleStatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleStatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleStatesRecordData({
  bool? home,
  bool? car,
  bool? plants,
  bool? health,
  bool? pets,
  bool? sport,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'home': home,
      'car': car,
      'plants': plants,
      'health': health,
      'pets': pets,
      'sport': sport,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleStatesRecordDocumentEquality
    implements Equality<ModuleStatesRecord> {
  const ModuleStatesRecordDocumentEquality();

  @override
  bool equals(ModuleStatesRecord? e1, ModuleStatesRecord? e2) {
    return e1?.home == e2?.home &&
        e1?.car == e2?.car &&
        e1?.plants == e2?.plants &&
        e1?.health == e2?.health &&
        e1?.pets == e2?.pets &&
        e1?.sport == e2?.sport &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(ModuleStatesRecord? e) => const ListEquality().hash(
      [e?.home, e?.car, e?.plants, e?.health, e?.pets, e?.sport, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is ModuleStatesRecord;
}
