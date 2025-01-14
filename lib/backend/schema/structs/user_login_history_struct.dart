// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLoginHistoryStruct extends FFFirebaseStruct {
  UserLoginHistoryStruct({
    bool? userLogginedEver,
    bool? homeModuleOpened,
    bool? carModuleOpened,
    bool? plantModuleOpened,
    bool? healthModuleOpened,
    bool? petsModuleOpened,
    bool? sportModuleOpened,
    bool? petModulePetPageOpened,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userLogginedEver = userLogginedEver,
        _homeModuleOpened = homeModuleOpened,
        _carModuleOpened = carModuleOpened,
        _plantModuleOpened = plantModuleOpened,
        _healthModuleOpened = healthModuleOpened,
        _petsModuleOpened = petsModuleOpened,
        _sportModuleOpened = sportModuleOpened,
        _petModulePetPageOpened = petModulePetPageOpened,
        super(firestoreUtilData);

  // "userLogginedEver" field.
  bool? _userLogginedEver;
  bool get userLogginedEver => _userLogginedEver ?? false;
  set userLogginedEver(bool? val) => _userLogginedEver = val;

  bool hasUserLogginedEver() => _userLogginedEver != null;

  // "HomeModuleOpened" field.
  bool? _homeModuleOpened;
  bool get homeModuleOpened => _homeModuleOpened ?? false;
  set homeModuleOpened(bool? val) => _homeModuleOpened = val;

  bool hasHomeModuleOpened() => _homeModuleOpened != null;

  // "CarModuleOpened" field.
  bool? _carModuleOpened;
  bool get carModuleOpened => _carModuleOpened ?? false;
  set carModuleOpened(bool? val) => _carModuleOpened = val;

  bool hasCarModuleOpened() => _carModuleOpened != null;

  // "PlantModuleOpened" field.
  bool? _plantModuleOpened;
  bool get plantModuleOpened => _plantModuleOpened ?? false;
  set plantModuleOpened(bool? val) => _plantModuleOpened = val;

  bool hasPlantModuleOpened() => _plantModuleOpened != null;

  // "HealthModuleOpened" field.
  bool? _healthModuleOpened;
  bool get healthModuleOpened => _healthModuleOpened ?? false;
  set healthModuleOpened(bool? val) => _healthModuleOpened = val;

  bool hasHealthModuleOpened() => _healthModuleOpened != null;

  // "PetsModuleOpened" field.
  bool? _petsModuleOpened;
  bool get petsModuleOpened => _petsModuleOpened ?? false;
  set petsModuleOpened(bool? val) => _petsModuleOpened = val;

  bool hasPetsModuleOpened() => _petsModuleOpened != null;

  // "SportModuleOpened" field.
  bool? _sportModuleOpened;
  bool get sportModuleOpened => _sportModuleOpened ?? false;
  set sportModuleOpened(bool? val) => _sportModuleOpened = val;

  bool hasSportModuleOpened() => _sportModuleOpened != null;

  // "PetModulePetPageOpened" field.
  bool? _petModulePetPageOpened;
  bool get petModulePetPageOpened => _petModulePetPageOpened ?? false;
  set petModulePetPageOpened(bool? val) => _petModulePetPageOpened = val;

  bool hasPetModulePetPageOpened() => _petModulePetPageOpened != null;

  static UserLoginHistoryStruct fromMap(Map<String, dynamic> data) =>
      UserLoginHistoryStruct(
        userLogginedEver: data['userLogginedEver'] as bool?,
        homeModuleOpened: data['HomeModuleOpened'] as bool?,
        carModuleOpened: data['CarModuleOpened'] as bool?,
        plantModuleOpened: data['PlantModuleOpened'] as bool?,
        healthModuleOpened: data['HealthModuleOpened'] as bool?,
        petsModuleOpened: data['PetsModuleOpened'] as bool?,
        sportModuleOpened: data['SportModuleOpened'] as bool?,
        petModulePetPageOpened: data['PetModulePetPageOpened'] as bool?,
      );

  static UserLoginHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLoginHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userLogginedEver': _userLogginedEver,
        'HomeModuleOpened': _homeModuleOpened,
        'CarModuleOpened': _carModuleOpened,
        'PlantModuleOpened': _plantModuleOpened,
        'HealthModuleOpened': _healthModuleOpened,
        'PetsModuleOpened': _petsModuleOpened,
        'SportModuleOpened': _sportModuleOpened,
        'PetModulePetPageOpened': _petModulePetPageOpened,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userLogginedEver': serializeParam(
          _userLogginedEver,
          ParamType.bool,
        ),
        'HomeModuleOpened': serializeParam(
          _homeModuleOpened,
          ParamType.bool,
        ),
        'CarModuleOpened': serializeParam(
          _carModuleOpened,
          ParamType.bool,
        ),
        'PlantModuleOpened': serializeParam(
          _plantModuleOpened,
          ParamType.bool,
        ),
        'HealthModuleOpened': serializeParam(
          _healthModuleOpened,
          ParamType.bool,
        ),
        'PetsModuleOpened': serializeParam(
          _petsModuleOpened,
          ParamType.bool,
        ),
        'SportModuleOpened': serializeParam(
          _sportModuleOpened,
          ParamType.bool,
        ),
        'PetModulePetPageOpened': serializeParam(
          _petModulePetPageOpened,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserLoginHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserLoginHistoryStruct(
        userLogginedEver: deserializeParam(
          data['userLogginedEver'],
          ParamType.bool,
          false,
        ),
        homeModuleOpened: deserializeParam(
          data['HomeModuleOpened'],
          ParamType.bool,
          false,
        ),
        carModuleOpened: deserializeParam(
          data['CarModuleOpened'],
          ParamType.bool,
          false,
        ),
        plantModuleOpened: deserializeParam(
          data['PlantModuleOpened'],
          ParamType.bool,
          false,
        ),
        healthModuleOpened: deserializeParam(
          data['HealthModuleOpened'],
          ParamType.bool,
          false,
        ),
        petsModuleOpened: deserializeParam(
          data['PetsModuleOpened'],
          ParamType.bool,
          false,
        ),
        sportModuleOpened: deserializeParam(
          data['SportModuleOpened'],
          ParamType.bool,
          false,
        ),
        petModulePetPageOpened: deserializeParam(
          data['PetModulePetPageOpened'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserLoginHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLoginHistoryStruct &&
        userLogginedEver == other.userLogginedEver &&
        homeModuleOpened == other.homeModuleOpened &&
        carModuleOpened == other.carModuleOpened &&
        plantModuleOpened == other.plantModuleOpened &&
        healthModuleOpened == other.healthModuleOpened &&
        petsModuleOpened == other.petsModuleOpened &&
        sportModuleOpened == other.sportModuleOpened &&
        petModulePetPageOpened == other.petModulePetPageOpened;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userLogginedEver,
        homeModuleOpened,
        carModuleOpened,
        plantModuleOpened,
        healthModuleOpened,
        petsModuleOpened,
        sportModuleOpened,
        petModulePetPageOpened
      ]);
}

UserLoginHistoryStruct createUserLoginHistoryStruct({
  bool? userLogginedEver,
  bool? homeModuleOpened,
  bool? carModuleOpened,
  bool? plantModuleOpened,
  bool? healthModuleOpened,
  bool? petsModuleOpened,
  bool? sportModuleOpened,
  bool? petModulePetPageOpened,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLoginHistoryStruct(
      userLogginedEver: userLogginedEver,
      homeModuleOpened: homeModuleOpened,
      carModuleOpened: carModuleOpened,
      plantModuleOpened: plantModuleOpened,
      healthModuleOpened: healthModuleOpened,
      petsModuleOpened: petsModuleOpened,
      sportModuleOpened: sportModuleOpened,
      petModulePetPageOpened: petModulePetPageOpened,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLoginHistoryStruct? updateUserLoginHistoryStruct(
  UserLoginHistoryStruct? userLoginHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLoginHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLoginHistoryStructData(
  Map<String, dynamic> firestoreData,
  UserLoginHistoryStruct? userLoginHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLoginHistory == null) {
    return;
  }
  if (userLoginHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLoginHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLoginHistoryData =
      getUserLoginHistoryFirestoreData(userLoginHistory, forFieldValue);
  final nestedData =
      userLoginHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userLoginHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLoginHistoryFirestoreData(
  UserLoginHistoryStruct? userLoginHistory, [
  bool forFieldValue = false,
]) {
  if (userLoginHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLoginHistory.toMap());

  // Add any Firestore field values
  userLoginHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLoginHistoryListFirestoreData(
  List<UserLoginHistoryStruct>? userLoginHistorys,
) =>
    userLoginHistorys
        ?.map((e) => getUserLoginHistoryFirestoreData(e, true))
        .toList() ??
    [];
