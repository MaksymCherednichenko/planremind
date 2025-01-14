import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarServiceTaskRecord extends FirestoreRecord {
  CarServiceTaskRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "mileage" field.
  int? _mileage;
  int get mileage => _mileage ?? 0;
  bool hasMileage() => _mileage != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "car" field.
  DocumentReference? _car;
  DocumentReference? get car => _car;
  bool hasCar() => _car != null;

  // "recordState" field.
  RecordStateEnum? _recordState;
  RecordStateEnum? get recordState => _recordState;
  bool hasRecordState() => _recordState != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _place = snapshotData['place'] as String?;
    _description = snapshotData['description'] as String?;
    _mileage = castToType<int>(snapshotData['mileage']);
    _date = snapshotData['date'] as DateTime?;
    _car = snapshotData['car'] as DocumentReference?;
    _recordState = snapshotData['recordState'] is RecordStateEnum
        ? snapshotData['recordState']
        : deserializeEnum<RecordStateEnum>(snapshotData['recordState']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carServiceTask')
          : FirebaseFirestore.instance.collectionGroup('carServiceTask');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carServiceTask').doc(id);

  static Stream<CarServiceTaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarServiceTaskRecord.fromSnapshot(s));

  static Future<CarServiceTaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarServiceTaskRecord.fromSnapshot(s));

  static CarServiceTaskRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarServiceTaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarServiceTaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarServiceTaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarServiceTaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarServiceTaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarServiceTaskRecordData({
  String? title,
  String? place,
  String? description,
  int? mileage,
  DateTime? date,
  DocumentReference? car,
  RecordStateEnum? recordState,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'place': place,
      'description': description,
      'mileage': mileage,
      'date': date,
      'car': car,
      'recordState': recordState,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarServiceTaskRecordDocumentEquality
    implements Equality<CarServiceTaskRecord> {
  const CarServiceTaskRecordDocumentEquality();

  @override
  bool equals(CarServiceTaskRecord? e1, CarServiceTaskRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.place == e2?.place &&
        e1?.description == e2?.description &&
        e1?.mileage == e2?.mileage &&
        e1?.date == e2?.date &&
        e1?.car == e2?.car &&
        e1?.recordState == e2?.recordState;
  }

  @override
  int hash(CarServiceTaskRecord? e) => const ListEquality().hash([
        e?.title,
        e?.place,
        e?.description,
        e?.mileage,
        e?.date,
        e?.car,
        e?.recordState
      ]);

  @override
  bool isValidKey(Object? o) => o is CarServiceTaskRecord;
}
