import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersFriendsRecord extends FirestoreRecord {
  UsersFriendsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "friendCode" field.
  int? _friendCode;
  int get friendCode => _friendCode ?? 0;
  bool hasFriendCode() => _friendCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _photo = snapshotData['photo'] as String?;
    _friendCode = castToType<int>(snapshotData['friendCode']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('usersFriends')
          : FirebaseFirestore.instance.collectionGroup('usersFriends');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersFriends').doc(id);

  static Stream<UsersFriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersFriendsRecord.fromSnapshot(s));

  static Future<UsersFriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersFriendsRecord.fromSnapshot(s));

  static UsersFriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersFriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersFriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersFriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersFriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersFriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersFriendsRecordData({
  String? name,
  String? uid,
  String? photo,
  int? friendCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'uid': uid,
      'photo': photo,
      'friendCode': friendCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersFriendsRecordDocumentEquality
    implements Equality<UsersFriendsRecord> {
  const UsersFriendsRecordDocumentEquality();

  @override
  bool equals(UsersFriendsRecord? e1, UsersFriendsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.uid == e2?.uid &&
        e1?.photo == e2?.photo &&
        e1?.friendCode == e2?.friendCode;
  }

  @override
  int hash(UsersFriendsRecord? e) =>
      const ListEquality().hash([e?.name, e?.uid, e?.photo, e?.friendCode]);

  @override
  bool isValidKey(Object? o) => o is UsersFriendsRecord;
}
