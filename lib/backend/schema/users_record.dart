import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "notification_time" field.
  DateTime? _notificationTime;
  DateTime? get notificationTime => _notificationTime;
  bool hasNotificationTime() => _notificationTime != null;

  // "uniqueUserCode" field.
  int? _uniqueUserCode;
  int get uniqueUserCode => _uniqueUserCode ?? 0;
  bool hasUniqueUserCode() => _uniqueUserCode != null;

  // "PushNotificationServerHour" field.
  int? _pushNotificationServerHour;
  int get pushNotificationServerHour => _pushNotificationServerHour ?? 0;
  bool hasPushNotificationServerHour() => _pushNotificationServerHour != null;

  // "userLoginHistory" field.
  UserLoginHistoryStruct? _userLoginHistory;
  UserLoginHistoryStruct get userLoginHistory =>
      _userLoginHistory ?? UserLoginHistoryStruct();
  bool hasUserLoginHistory() => _userLoginHistory != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _notificationTime = snapshotData['notification_time'] as DateTime?;
    _uniqueUserCode = castToType<int>(snapshotData['uniqueUserCode']);
    _pushNotificationServerHour =
        castToType<int>(snapshotData['PushNotificationServerHour']);
    _userLoginHistory = snapshotData['userLoginHistory']
            is UserLoginHistoryStruct
        ? snapshotData['userLoginHistory']
        : UserLoginHistoryStruct.maybeFromMap(snapshotData['userLoginHistory']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? notificationTime,
  int? uniqueUserCode,
  int? pushNotificationServerHour,
  UserLoginHistoryStruct? userLoginHistory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'notification_time': notificationTime,
      'uniqueUserCode': uniqueUserCode,
      'PushNotificationServerHour': pushNotificationServerHour,
      'userLoginHistory': UserLoginHistoryStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "userLoginHistory" field.
  addUserLoginHistoryStructData(
      firestoreData, userLoginHistory, 'userLoginHistory');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.notificationTime == e2?.notificationTime &&
        e1?.uniqueUserCode == e2?.uniqueUserCode &&
        e1?.pushNotificationServerHour == e2?.pushNotificationServerHour &&
        e1?.userLoginHistory == e2?.userLoginHistory;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.notificationTime,
        e?.uniqueUserCode,
        e?.pushNotificationServerHour,
        e?.userLoginHistory
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
