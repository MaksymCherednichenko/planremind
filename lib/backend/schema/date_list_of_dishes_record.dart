import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateListOfDishesRecord extends FirestoreRecord {
  DateListOfDishesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "breakfasts" field.
  List<DocumentReference>? _breakfasts;
  List<DocumentReference> get breakfasts => _breakfasts ?? const [];
  bool hasBreakfasts() => _breakfasts != null;

  // "lunches" field.
  List<DocumentReference>? _lunches;
  List<DocumentReference> get lunches => _lunches ?? const [];
  bool hasLunches() => _lunches != null;

  // "dinners" field.
  List<DocumentReference>? _dinners;
  List<DocumentReference> get dinners => _dinners ?? const [];
  bool hasDinners() => _dinners != null;

  // "others" field.
  List<DocumentReference>? _others;
  List<DocumentReference> get others => _others ?? const [];
  bool hasOthers() => _others != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _breakfasts = getDataList(snapshotData['breakfasts']);
    _lunches = getDataList(snapshotData['lunches']);
    _dinners = getDataList(snapshotData['dinners']);
    _others = getDataList(snapshotData['others']);
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dateListOfDishes')
          : FirebaseFirestore.instance.collectionGroup('dateListOfDishes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dateListOfDishes').doc(id);

  static Stream<DateListOfDishesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DateListOfDishesRecord.fromSnapshot(s));

  static Future<DateListOfDishesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DateListOfDishesRecord.fromSnapshot(s));

  static DateListOfDishesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DateListOfDishesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DateListOfDishesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DateListOfDishesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DateListOfDishesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DateListOfDishesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDateListOfDishesRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class DateListOfDishesRecordDocumentEquality
    implements Equality<DateListOfDishesRecord> {
  const DateListOfDishesRecordDocumentEquality();

  @override
  bool equals(DateListOfDishesRecord? e1, DateListOfDishesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.breakfasts, e2?.breakfasts) &&
        listEquality.equals(e1?.lunches, e2?.lunches) &&
        listEquality.equals(e1?.dinners, e2?.dinners) &&
        listEquality.equals(e1?.others, e2?.others) &&
        e1?.date == e2?.date;
  }

  @override
  int hash(DateListOfDishesRecord? e) => const ListEquality()
      .hash([e?.breakfasts, e?.lunches, e?.dinners, e?.others, e?.date]);

  @override
  bool isValidKey(Object? o) => o is DateListOfDishesRecord;
}
