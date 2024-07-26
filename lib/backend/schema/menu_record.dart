import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "recipe" field.
  List<String>? _recipe;
  List<String> get recipe => _recipe ?? const [];
  bool hasRecipe() => _recipe != null;

  // "recipeFull" field.
  String? _recipeFull;
  String get recipeFull => _recipeFull ?? '';
  bool hasRecipeFull() => _recipeFull != null;

  // "siteLink" field.
  String? _siteLink;
  String get siteLink => _siteLink ?? '';
  bool hasSiteLink() => _siteLink != null;

  // "videoLink" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _userID = snapshotData['userID'] as String?;
    _recipe = getDataList(snapshotData['recipe']);
    _recipeFull = snapshotData['recipeFull'] as String?;
    _siteLink = snapshotData['siteLink'] as String?;
    _videoLink = snapshotData['videoLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? name,
  String? userID,
  String? recipeFull,
  String? siteLink,
  String? videoLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'userID': userID,
      'recipeFull': recipeFull,
      'siteLink': siteLink,
      'videoLink': videoLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.userID == e2?.userID &&
        listEquality.equals(e1?.recipe, e2?.recipe) &&
        e1?.recipeFull == e2?.recipeFull &&
        e1?.siteLink == e2?.siteLink &&
        e1?.videoLink == e2?.videoLink;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality().hash([
        e?.name,
        e?.userID,
        e?.recipe,
        e?.recipeFull,
        e?.siteLink,
        e?.videoLink
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
