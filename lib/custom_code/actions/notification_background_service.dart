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

import 'dart:io' show Platform;

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future notificationBackgroundService() async {
  // Add your function code here!

  WidgetsFlutterBinding.ensureInitialized();

  // Request permission before starting the service
  // await requestPhonePermission();
  try {
    if (Platform.isIOS || Platform.isAndroid) await initializeService();
  } catch (e) {
    print(e);
  }
}

Future<void> initializeService() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // ReceivePort receivePort = ReceivePort();
  // IsolateNameServer.removePortNameMapping('ServiceRunningPort');
  // IsolateNameServer.registerPortWithName(
  //     receivePort.sendPort, 'ServiceRunningPort');
  // receivePort.listen((message) {
  //   if (message == 'STOP') {
  //     service.stopSelf();
  //     IsolateNameServer.removePortNameMapping('ServiceRunningPort');
  //   }
  // });

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,

      // Add necessary notification details
      notificationChannelId: 'general_channel',
      initialNotificationTitle: 'Starting background process',
      initialNotificationContent: '',
      foregroundServiceNotificationId: 888,
    ),
  );
}

Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

Future<void> onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  while (true) {
    await checkDayPlanNotification();

    await Future.delayed(Duration(minutes: 60));
  }
}

Future checkDayPlanNotification() async {
  final now = DateTime.now();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (now.hour == FFAppState().TodayPlannerNotificationHour) {
    flutterLocalNotificationsPlugin.show(
      888,
      'Список завдань на сьогодні',
      'Перегляньте ваш список завдань на сьогодні, щоб не пропустити важливі події)',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'my_foreground',
          'MY FOREGROUND SERVICE',
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );
  }
  // read form local bd
  // verify time and date
  // send notifications
}

Future<void> requestPhonePermission() async {
  var status = await Permission.phone.status;
  if (!status.isGranted) {
    status = await Permission.phone.request();
    if (!status.isGranted) {
      // Optionally, you can prompt a dialog here to inform user about the necessity of the permission
    }
  }
}
