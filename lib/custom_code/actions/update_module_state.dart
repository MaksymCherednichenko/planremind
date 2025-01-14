// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<ModuleStruct>> updateModuleState(
  List<ModuleStruct> moduleList,
  DocumentReference dbref,
) async {
  DocumentSnapshot documentSnapshot = await dbref.get();
  if (documentSnapshot.exists) {
    var data = documentSnapshot.data() as Map<String, dynamic>;
    moduleList.clear();
    moduleList.add(ModuleStruct(name: ModulesEnum.Home, active: data["home"]));
    moduleList.add(ModuleStruct(name: ModulesEnum.Car, active: data["car"]));
    moduleList
        .add(ModuleStruct(name: ModulesEnum.Plants, active: data["plants"]));
    moduleList
        .add(ModuleStruct(name: ModulesEnum.Health, active: data["health"]));
    moduleList.add(ModuleStruct(name: ModulesEnum.Pets, active: data["pets"]));
    moduleList
        .add(ModuleStruct(name: ModulesEnum.Sport, active: data["sport"]));
    print(moduleList);
  }
  return moduleList;
}
