import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HubPageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HubPageWidget() : LoginPageWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'HubPage',
          path: '/hubPage',
          builder: (context, params) => HubPageWidget(),
        ),
        FFRoute(
          name: 'HomePlannerPage',
          path: '/homePlannerPage',
          builder: (context, params) => HomePlannerPageWidget(),
        ),
        FFRoute(
          name: 'AddMealForPlannerPage',
          path: '/addMealForPlannerPage',
          builder: (context, params) => AddMealForPlannerPageWidget(
            listOfDishesRef: params.getParam(
              'listOfDishesRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['listOfDishes'],
            ),
          ),
        ),
        FFRoute(
          name: 'HomeShoppingHistory',
          path: '/homeShoppingHistory',
          builder: (context, params) => HomeShoppingHistoryWidget(),
        ),
        FFRoute(
          name: 'HomeShoppingActual',
          path: '/homeShoppingActual',
          builder: (context, params) => HomeShoppingActualWidget(),
        ),
        FFRoute(
          name: 'Settings_Notifications',
          path: '/settingsNotifications',
          builder: (context, params) => SettingsNotificationsWidget(),
        ),
        FFRoute(
          name: 'Settings_Storage_HouseholdCategories',
          path: '/settingsStorageHouseholdCategories',
          builder: (context, params) =>
              SettingsStorageHouseholdCategoriesWidget(),
        ),
        FFRoute(
          name: 'Household',
          path: '/household',
          builder: (context, params) => HouseholdWidget(),
        ),
        FFRoute(
          name: 'MealIngridients',
          path: '/mealIngridients',
          builder: (context, params) => MealIngridientsWidget(
            choosedMeal: params.getParam(
              'choosedMeal',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['listOfDishes'],
            ),
          ),
        ),
        FFRoute(
          name: 'StorageFood',
          path: '/storageFood',
          builder: (context, params) => StorageFoodWidget(),
        ),
        FFRoute(
          name: 'Settings_help_center',
          path: '/settingsHelpCenter',
          builder: (context, params) => SettingsHelpCenterWidget(),
        ),
        FFRoute(
          name: 'SettingsShops',
          path: '/settingsShops',
          builder: (context, params) => SettingsShopsWidget(),
        ),
        FFRoute(
          name: 'Menu',
          path: '/menu',
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: 'CreateItemInMenu',
          path: '/createItemInMenu',
          builder: (context, params) => CreateItemInMenuWidget(
            newItemInMenu: params.getParam(
              'newItemInMenu',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['menu'],
            ),
          ),
        ),
        FFRoute(
          name: 'MenuAddToPlan',
          path: '/menuAddToPlan',
          builder: (context, params) => MenuAddToPlanWidget(
            itemInMenu: params.getParam(
              'itemInMenu',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['menu'],
            ),
          ),
        ),
        FFRoute(
          name: 'WellcomePageOld',
          path: '/wellcomePageOld',
          builder: (context, params) => WellcomePageOldWidget(),
        ),
        FFRoute(
          name: 'SetCategoriesFood',
          path: '/setCategoriesFood',
          asyncParams: {
            'setCategoryFood': getDoc(['users', 'settingsCategoryAndShop'],
                SettingsCategoryAndShopRecord.fromSnapshot),
          },
          builder: (context, params) => SetCategoriesFoodWidget(
            setCategoryFood: params.getParam(
              'setCategoryFood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SetShops',
          path: '/setShops',
          asyncParams: {
            'setShop': getDoc(['users', 'settingsCategoryAndShop'],
                SettingsCategoryAndShopRecord.fromSnapshot),
          },
          builder: (context, params) => SetShopsWidget(
            setShop: params.getParam(
              'setShop',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SetCategoriesHousehold',
          path: '/setCategoriesHousehold',
          asyncParams: {
            'setCategoryHousehold': getDoc(['users', 'settingsCategoryAndShop'],
                SettingsCategoryAndShopRecord.fromSnapshot),
          },
          builder: (context, params) => SetCategoriesHouseholdWidget(
            setCategoryHousehold: params.getParam(
              'setCategoryHousehold',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Settings_Storage_FoodCategories',
          path: '/settingsStorageFoodCategories',
          builder: (context, params) => SettingsStorageFoodCategoriesWidget(),
        ),
        FFRoute(
          name: 'HomeCategories',
          path: '/homeCategories',
          builder: (context, params) => HomeCategoriesWidget(),
        ),
        FFRoute(
          name: 'BirthdaysContactsPage',
          path: '/birthdaysContactsPage',
          builder: (context, params) => BirthdaysContactsPageWidget(),
        ),
        FFRoute(
          name: 'RecipeByStepsPage',
          path: '/recipeByStepsPage',
          asyncParams: {
            'mealDocFromPlanner':
                getDoc(['listOfDishes'], ListOfDishesRecord.fromSnapshot),
            'manuDoc': getDoc(['menu'], MenuRecord.fromSnapshot),
          },
          builder: (context, params) => RecipeByStepsPageWidget(
            mealDocFromPlanner: params.getParam(
              'mealDocFromPlanner',
              ParamType.Document,
            ),
            manuDoc: params.getParam(
              'manuDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'FriendsPage',
          path: '/friendsPage',
          builder: (context, params) => FriendsPageWidget(),
        ),
        FFRoute(
          name: 'RecipeFullPage',
          path: '/recipeFullPage',
          asyncParams: {
            'mealDocFromPlanner':
                getDoc(['listOfDishes'], ListOfDishesRecord.fromSnapshot),
            'manuDoc': getDoc(['menu'], MenuRecord.fromSnapshot),
          },
          builder: (context, params) => RecipeFullPageWidget(
            mealDocFromPlanner: params.getParam(
              'mealDocFromPlanner',
              ParamType.Document,
            ),
            manuDoc: params.getParam(
              'manuDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'CarServicePlannerPage',
          path: '/carServicePlannerPage',
          builder: (context, params) => CarServicePlannerPageWidget(),
        ),
        FFRoute(
          name: 'CarServiceHistoryPage',
          path: '/carServiceHistoryPage',
          builder: (context, params) => CarServiceHistoryPageWidget(),
        ),
        FFRoute(
          name: 'CarServiceInformationPage',
          path: '/carServiceInformationPage',
          builder: (context, params) => CarServiceInformationPageWidget(),
        ),
        FFRoute(
          name: 'MyCarPage',
          path: '/myCarPage',
          asyncParams: {
            'car': getDoc(['users', 'cars'], CarsRecord.fromSnapshot),
          },
          builder: (context, params) => MyCarPageWidget(
            car: params.getParam(
              'car',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SparePartsPage',
          path: '/sparePartsPage',
          asyncParams: {
            'car': getDoc(['users', 'cars'], CarsRecord.fromSnapshot),
          },
          builder: (context, params) => SparePartsPageWidget(
            car: params.getParam(
              'car',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PlantsPlannerPage',
          path: '/plantsPlannerPage',
          builder: (context, params) => PlantsPlannerPageWidget(),
        ),
        FFRoute(
          name: 'HealthPlannerPage',
          path: '/healthPlannerPage',
          builder: (context, params) => HealthPlannerPageWidget(),
        ),
        FFRoute(
          name: 'PetsPlannerPage',
          path: '/petsPlannerPage',
          builder: (context, params) => PetsPlannerPageWidget(),
        ),
        FFRoute(
          name: 'SportsPlannerPage',
          path: '/sportsPlannerPage',
          builder: (context, params) => SportsPlannerPageWidget(),
        ),
        FFRoute(
          name: 'MyPlantsPageGrid',
          path: '/myPlantsPageGrid',
          builder: (context, params) => MyPlantsPageGridWidget(),
        ),
        FFRoute(
          name: 'MyPlantsPageList',
          path: '/myPlantsPageList',
          builder: (context, params) => MyPlantsPageListWidget(),
        ),
        FFRoute(
          name: 'HealthHistoryPage',
          path: '/healthHistoryPage',
          builder: (context, params) => HealthHistoryPageWidget(),
        ),
        FFRoute(
          name: 'HealthInformationPage',
          path: '/healthInformationPage',
          builder: (context, params) => HealthInformationPageWidget(),
        ),
        FFRoute(
          name: 'WellcomePage',
          path: '/wellcomePage',
          builder: (context, params) => WellcomePageWidget(),
        ),
        FFRoute(
          name: 'WellcomePageModules',
          path: '/wellcomePageModules',
          builder: (context, params) => WellcomePageModulesWidget(
            homebtn: params.getParam(
              'homebtn',
              ParamType.Color,
            ),
            modules: params.getParam(
              'modules',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users', 'moduleStates'],
            ),
          ),
        ),
        FFRoute(
          name: 'SettingsModules',
          path: '/settingsModules',
          builder: (context, params) => SettingsModulesWidget(),
        ),
        FFRoute(
          name: 'HomeShoppingActualCopy',
          path: '/homeShoppingActualCopy',
          builder: (context, params) => HomeShoppingActualCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/ezgif.com-video-to-gif-converter.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
