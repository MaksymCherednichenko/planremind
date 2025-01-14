import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleNotificationsRecord extends FirestoreRecord {
  ModuleNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "module" field.
  String? _module;
  String get module => _module ?? '';
  bool hasModule() => _module != null;

  // "hour" field.
  int? _hour;
  int get hour => _hour ?? 0;
  bool hasHour() => _hour != null;

  // "remindindays" field.
  int? _remindindays;
  int get remindindays => _remindindays ?? 0;
  bool hasRemindindays() => _remindindays != null;

  // "dayofweek" field.
  int? _dayofweek;
  int get dayofweek => _dayofweek ?? 0;
  bool hasDayofweek() => _dayofweek != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _module = snapshotData['module'] as String?;
    _hour = castToType<int>(snapshotData['hour']);
    _remindindays = castToType<int>(snapshotData['remindindays']);
    _dayofweek = castToType<int>(snapshotData['dayofweek']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('moduleNotifications')
          : FirebaseFirestore.instance.collectionGroup('moduleNotifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('moduleNotifications').doc(id);

  static Stream<ModuleNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleNotificationsRecord.fromSnapshot(s));

  static Future<ModuleNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ModuleNotificationsRecord.fromSnapshot(s));

  static ModuleNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModuleNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleNotificationsRecordData({
  String? module,
  int? hour,
  int? remindindays,
  int? dayofweek,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'module': module,
      'hour': hour,
      'remindindays': remindindays,
      'dayofweek': dayofweek,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleNotificationsRecordDocumentEquality
    implements Equality<ModuleNotificationsRecord> {
  const ModuleNotificationsRecordDocumentEquality();

  @override
  bool equals(ModuleNotificationsRecord? e1, ModuleNotificationsRecord? e2) {
    return e1?.module == e2?.module &&
        e1?.hour == e2?.hour &&
        e1?.remindindays == e2?.remindindays &&
        e1?.dayofweek == e2?.dayofweek;
  }

  @override
  int hash(ModuleNotificationsRecord? e) => const ListEquality()
      .hash([e?.module, e?.hour, e?.remindindays, e?.dayofweek]);

  @override
  bool isValidKey(Object? o) => o is ModuleNotificationsRecord;
}
