import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future loadAndUpdateModuleStates(BuildContext context) async {
  ModuleStatesRecord? moduleStatesIsExist;
  ModuleStatesRecord? moduleStatesVarCreated;
  List<ModuleStruct>? moduleList;

  moduleStatesIsExist = await queryModuleStatesRecordOnce(
    queryBuilder: (moduleStatesRecord) => moduleStatesRecord.where(
      'user_id',
      isEqualTo: FFAppState().userID,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if ((moduleStatesIsExist != null) != true) {
    var moduleStatesRecordReference =
        ModuleStatesRecord.createDoc(FFAppState().currentUserRef!);
    await moduleStatesRecordReference.set(createModuleStatesRecordData(
      home: false,
      car: false,
      plants: false,
      health: false,
      pets: false,
      sport: false,
      userId: FFAppState().userID,
    ));
    moduleStatesVarCreated = ModuleStatesRecord.getDocumentFromData(
        createModuleStatesRecordData(
          home: false,
          car: false,
          plants: false,
          health: false,
          pets: false,
          sport: false,
          userId: FFAppState().userID,
        ),
        moduleStatesRecordReference);
  }
  moduleList = await actions.updateModuleState(
    FFAppState().moduleStates.toList(),
    moduleStatesIsExist!.reference,
  );
  FFAppState().moduleStates = moduleList!.toList().cast<ModuleStruct>();
  FFAppState().modulesDocRef = moduleStatesIsExist?.reference;
}

Future<bool?> canDisableModule(
  BuildContext context, {
  ModuleStruct? module,
}) async {
  List<ModuleStruct>? updatedStateList;

  updatedStateList = await actions.setModuleState(
    FFAppState().moduleStates.toList(),
    module!,
  );
  if (functions.hasActiveModules(updatedStateList!.toList())) {
    return true;
  }

  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('Попередження'),
        content: Text('Принаймі один модуль мусить бути увімкненим'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
  return false;
}

Future<bool?> updateModuleState(
  BuildContext context, {
  ModuleStruct? module,
}) async {
  List<ModuleStruct>? updatedModuleStates;
  bool? canDisable;
  List<ModuleStruct>? updatedModuleStates2;

  if (module!.active) {
    updatedModuleStates = await actions.setModuleState(
      FFAppState().moduleStates.toList(),
      ModuleStruct(
        name: module?.name,
        active: module?.active,
      ),
    );
    FFAppState().moduleStates =
        updatedModuleStates!.toList().cast<ModuleStruct>();

    await FFAppState().modulesDocRef!.update(createModuleStatesRecordData(
          home: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Home),
          car: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Car),
          plants: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Plants),
          health: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Health),
          pets: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Pets),
          sport: functions.getModuleState(
              FFAppState().moduleStates.toList(), Module.Sport),
        ));
  } else {
    canDisable = await action_blocks.canDisableModule(
      context,
      module: ModuleStruct(
        name: module?.name,
        active: false,
      ),
    );
    if (canDisable!) {
      updatedModuleStates2 = await actions.setModuleState(
        FFAppState().moduleStates.toList(),
        ModuleStruct(
          name: module?.name,
          active: module?.active,
        ),
      );
      FFAppState().moduleStates =
          updatedModuleStates2!.toList().cast<ModuleStruct>();

      await FFAppState().modulesDocRef!.update(createModuleStatesRecordData(
            home: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Home),
            car: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Car),
            plants: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Plants),
            health: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Health),
            pets: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Pets),
            sport: functions.getModuleState(
                FFAppState().moduleStates.toList(), Module.Sport),
          ));
    } else {
      return false;
    }
  }

  return true;
}
