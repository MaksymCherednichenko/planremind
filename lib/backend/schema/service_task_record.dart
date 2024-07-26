import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceTaskRecord extends FirestoreRecord {
  ServiceTaskRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _place = snapshotData['place'] as String?;
    _description = snapshotData['description'] as String?;
    _mileage = castToType<int>(snapshotData['mileage']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('serviceTask')
          : FirebaseFirestore.instance.collectionGroup('serviceTask');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('serviceTask').doc(id);

  static Stream<ServiceTaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceTaskRecord.fromSnapshot(s));

  static Future<ServiceTaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceTaskRecord.fromSnapshot(s));

  static ServiceTaskRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceTaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceTaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceTaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceTaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceTaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceTaskRecordData({
  String? title,
  String? place,
  String? description,
  int? mileage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'place': place,
      'description': description,
      'mileage': mileage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceTaskRecordDocumentEquality implements Equality<ServiceTaskRecord> {
  const ServiceTaskRecordDocumentEquality();

  @override
  bool equals(ServiceTaskRecord? e1, ServiceTaskRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.place == e2?.place &&
        e1?.description == e2?.description &&
        e1?.mileage == e2?.mileage;
  }

  @override
  int hash(ServiceTaskRecord? e) => const ListEquality()
      .hash([e?.title, e?.place, e?.description, e?.mileage]);

  @override
  bool isValidKey(Object? o) => o is ServiceTaskRecord;
}
