import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "type" field.
  PetsEnum? _type;
  PetsEnum? get type => _type;
  bool hasType() => _type != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "color" field.
  MyColorsEnum? _color;
  MyColorsEnum? get color => _color;
  bool hasColor() => _color != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _type = snapshotData['type'] is PetsEnum
        ? snapshotData['type']
        : deserializeEnum<PetsEnum>(snapshotData['type']);
    _breed = snapshotData['breed'] as String?;
    _color = snapshotData['color'] is MyColorsEnum
        ? snapshotData['color']
        : deserializeEnum<MyColorsEnum>(snapshotData['color']);
    _photo = snapshotData['photo'] as String?;
    _weight = castToType<double>(snapshotData['weight']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pets')
          : FirebaseFirestore.instance.collectionGroup('pets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pets').doc(id);

  static Stream<PetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsRecord.fromSnapshot(s));

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsRecord.fromSnapshot(s));

  static PetsRecord fromSnapshot(DocumentSnapshot snapshot) => PetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsRecordData({
  String? name,
  DateTime? birthday,
  PetsEnum? type,
  String? breed,
  MyColorsEnum? color,
  String? photo,
  double? weight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'birthday': birthday,
      'type': type,
      'breed': breed,
      'color': color,
      'photo': photo,
      'weight': weight,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.birthday == e2?.birthday &&
        e1?.type == e2?.type &&
        e1?.breed == e2?.breed &&
        e1?.color == e2?.color &&
        e1?.photo == e2?.photo &&
        e1?.weight == e2?.weight;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash(
      [e?.name, e?.birthday, e?.type, e?.breed, e?.color, e?.photo, e?.weight]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
