import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/ezgif.com-video-to-gif-converter.gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Settings': ParameterData.none(),
  'LoginPage': ParameterData.none(),
  'HubPage': ParameterData.none(),
  'HomePlannerPage': ParameterData.none(),
  'AddMealForPlannerPage': (data) async => ParameterData(
        allParams: {
          'listOfDishesRef':
              getParameter<DocumentReference>(data, 'listOfDishesRef'),
        },
      ),
  'HomeShoppingHistory': ParameterData.none(),
  'HomeShoppingActual': ParameterData.none(),
  'Settings_Notifications': ParameterData.none(),
  'Settings_Storage_HouseholdCategories': ParameterData.none(),
  'Household': ParameterData.none(),
  'MealIngridients': (data) async => ParameterData(
        allParams: {
          'choosedMeal': getParameter<DocumentReference>(data, 'choosedMeal'),
        },
      ),
  'StorageFood': ParameterData.none(),
  'Settings_help_center': ParameterData.none(),
  'SettingsShops': ParameterData.none(),
  'Menu': ParameterData.none(),
  'CreateItemInMenu': (data) async => ParameterData(
        allParams: {
          'newItemInMenu':
              getParameter<DocumentReference>(data, 'newItemInMenu'),
        },
      ),
  'MenuAddToPlan': (data) async => ParameterData(
        allParams: {
          'itemInMenu': getParameter<DocumentReference>(data, 'itemInMenu'),
        },
      ),
  'WellcomePageOld': ParameterData.none(),
  'SetCategoriesFood': (data) async => ParameterData(
        allParams: {
          'setCategoryFood':
              await getDocumentParameter<SettingsCategoryAndShopRecord>(
                  data,
                  'setCategoryFood',
                  SettingsCategoryAndShopRecord.fromSnapshot),
        },
      ),
  'SetShops': (data) async => ParameterData(
        allParams: {
          'setShop': await getDocumentParameter<SettingsCategoryAndShopRecord>(
              data, 'setShop', SettingsCategoryAndShopRecord.fromSnapshot),
        },
      ),
  'SetCategoriesHousehold': (data) async => ParameterData(
        allParams: {
          'setCategoryHousehold':
              await getDocumentParameter<SettingsCategoryAndShopRecord>(
                  data,
                  'setCategoryHousehold',
                  SettingsCategoryAndShopRecord.fromSnapshot),
        },
      ),
  'Settings_Storage_FoodCategories': ParameterData.none(),
  'HomeCategories': ParameterData.none(),
  'BirthdaysContactsPage': ParameterData.none(),
  'RecipeByStepsPage': (data) async => ParameterData(
        allParams: {
          'mealDocFromPlanner': await getDocumentParameter<ListOfDishesRecord>(
              data, 'mealDocFromPlanner', ListOfDishesRecord.fromSnapshot),
          'manuDoc': await getDocumentParameter<MenuRecord>(
              data, 'manuDoc', MenuRecord.fromSnapshot),
        },
      ),
  'FriendsPage': ParameterData.none(),
  'RecipeFullPage': (data) async => ParameterData(
        allParams: {
          'mealDocFromPlanner': await getDocumentParameter<ListOfDishesRecord>(
              data, 'mealDocFromPlanner', ListOfDishesRecord.fromSnapshot),
          'manuDoc': await getDocumentParameter<MenuRecord>(
              data, 'manuDoc', MenuRecord.fromSnapshot),
        },
      ),
  'CarServicePlannerPage': ParameterData.none(),
  'CarServiceHistoryPage': ParameterData.none(),
  'CarServiceInformationPage': ParameterData.none(),
  'MyCarPage': (data) async => ParameterData(
        allParams: {
          'car': await getDocumentParameter<CarsRecord>(
              data, 'car', CarsRecord.fromSnapshot),
        },
      ),
  'SparePartsPage': (data) async => ParameterData(
        allParams: {
          'car': await getDocumentParameter<CarsRecord>(
              data, 'car', CarsRecord.fromSnapshot),
        },
      ),
  'PlantsPlannerPage': ParameterData.none(),
  'HealthPlannerPage': ParameterData.none(),
  'PetsPlannerPage': ParameterData.none(),
  'SportsPlannerPage': ParameterData.none(),
  'MyPlantsPageGrid': ParameterData.none(),
  'MyPlantsPageList': ParameterData.none(),
  'HealthHistoryPage': ParameterData.none(),
  'HealthInformationPage': ParameterData.none(),
  'WellcomePage': ParameterData.none(),
  'WellcomePageModules': (data) async => ParameterData(
        allParams: {
          'homebtn': getParameter<Color>(data, 'homebtn'),
          'modules': getParameter<DocumentReference>(data, 'modules'),
        },
      ),
  'SettingsModules': ParameterData.none(),
  'HomeShoppingActualCopy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
