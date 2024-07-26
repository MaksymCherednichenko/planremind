import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PushNotificationsRecord extends FirestoreRecord {
  PushNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _img = snapshotData['img'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PushNotifications');

  static Stream<PushNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PushNotificationsRecord.fromSnapshot(s));

  static Future<PushNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PushNotificationsRecord.fromSnapshot(s));

  static PushNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PushNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PushNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PushNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PushNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PushNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPushNotificationsRecordData({
  String? title,
  String? description,
  String? img,
  DocumentReference? user,
  String? type,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'img': img,
      'user': user,
      'type': type,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PushNotificationsRecordDocumentEquality
    implements Equality<PushNotificationsRecord> {
  const PushNotificationsRecordDocumentEquality();

  @override
  bool equals(PushNotificationsRecord? e1, PushNotificationsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.img == e2?.img &&
        e1?.user == e2?.user &&
        e1?.type == e2?.type &&
        e1?.date == e2?.date;
  }

  @override
  int hash(PushNotificationsRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.img, e?.user, e?.type, e?.date]);

  @override
  bool isValidKey(Object? o) => o is PushNotificationsRecord;
}
