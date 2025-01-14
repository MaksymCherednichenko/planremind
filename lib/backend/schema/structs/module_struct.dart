// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleStruct extends FFFirebaseStruct {
  ModuleStruct({
    ModulesEnum? name,
    bool? active,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _active = active,
        super(firestoreUtilData);

  // "name" field.
  ModulesEnum? _name;
  ModulesEnum get name => _name ?? ModulesEnum.Home;
  set name(ModulesEnum? val) => _name = val;

  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static ModuleStruct fromMap(Map<String, dynamic> data) => ModuleStruct(
        name: data['name'] is ModulesEnum
            ? data['name']
            : deserializeEnum<ModulesEnum>(data['name']),
        active: data['active'] as bool?,
      );

  static ModuleStruct? maybeFromMap(dynamic data) =>
      data is Map ? ModuleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name?.serialize(),
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.Enum,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ModuleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ModuleStruct(
        name: deserializeParam<ModulesEnum>(
          data['name'],
          ParamType.Enum,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ModuleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModuleStruct &&
        name == other.name &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([name, active]);
}

ModuleStruct createModuleStruct({
  ModulesEnum? name,
  bool? active,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModuleStruct(
      name: name,
      active: active,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModuleStruct? updateModuleStruct(
  ModuleStruct? module, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    module
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModuleStructData(
  Map<String, dynamic> firestoreData,
  ModuleStruct? module,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (module == null) {
    return;
  }
  if (module.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && module.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moduleData = getModuleFirestoreData(module, forFieldValue);
  final nestedData = moduleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = module.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModuleFirestoreData(
  ModuleStruct? module, [
  bool forFieldValue = false,
]) {
  if (module == null) {
    return {};
  }
  final firestoreData = mapToFirestore(module.toMap());

  // Add any Firestore field values
  module.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModuleListFirestoreData(
  List<ModuleStruct>? modules,
) =>
    modules?.map((e) => getModuleFirestoreData(e, true)).toList() ?? [];
