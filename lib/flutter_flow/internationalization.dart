import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['uk', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ukText = '',
    String? enText = '',
  }) =>
      [ukText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Settings
  {
    '4kpeqt2p': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    '94sm86j1': {
      'uk': '  ',
      'en': '',
    },
    'mcs61zcm': {
      'uk': 'UKR',
      'en': 'UKR',
    },
    'f8o72jix': {
      'uk': 'Профіль та підписки',
      'en': 'Menu',
    },
    'dotf426g': {
      'uk': 'Категорії для Сховку',
      'en': 'Storage Categories',
    },
    's8i5pqoh': {
      'uk': 'Магазини',
      'en': 'Shops',
    },
    'aqiihlos': {
      'uk': 'Друзі',
      'en': 'Friends',
    },
    'r5sk7oja': {
      'uk': 'Модулі',
      'en': 'Modules',
    },
    'wm7q3olv': {
      'uk': 'Система виміру',
      'en': 'Одиниці виміру',
    },
    'm3ynx9bc': {
      'uk': 'Euro',
      'en': 'Euro',
    },
    'vnptuhqz': {
      'uk': 'US',
      'en': 'US',
    },
    '6ihuaggm': {
      'uk': 'Сповіщення',
      'en': 'Help center',
    },
    'e8fyqq2k': {
      'uk': 'Пройти гайд заново',
      'en': 'Help center',
    },
    'r4me0mej': {
      'uk': 'Допомога',
      'en': 'Help center',
    },
    'x12o8hkx': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // LoginPage
  {
    'fmkm4vpe': {
      'uk': 'Вхід з Google',
      'en': 'Sign in with Google',
    },
    'z0vadp7z': {
      'uk': 'Вхід з Apple',
      'en': 'Sign in with Apple',
    },
    '3krdywht': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HubPage
  {
    '320asavf': {
      'uk': 'Сьогодні',
      'en': 'Today',
    },
    'hf1ytjcl': {
      'uk': 'Дім',
      'en': 'Home',
    },
    'vkc0ptx5': {
      'uk': 'Гараж',
      'en': 'Garage',
    },
    '9dvs4lp2': {
      'uk': 'Рослини',
      'en': 'Plants',
    },
    'bwxexx4u': {
      'uk': 'Здоровʼя',
      'en': 'Health',
    },
    'i7demk40': {
      'uk': 'Улюбленці',
      'en': 'Pets',
    },
    '1h1idrun': {
      'uk': 'Спорт',
      'en': 'Sport',
    },
    '67wciw7h': {
      'uk': 'У найближчі дні',
      'en': 'Upcoming',
    },
    'q4xxo63k': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HomePlannerPage
  {
    'fah9820a': {
      'uk': 'Shopping',
      'en': 'Список покупок',
    },
    '2uxti7t7': {
      'uk': 'Planner',
      'en': 'Планер',
    },
    'xlw47m23': {
      'uk': 'Storage',
      'en': 'Сховок',
    },
    '250mxy60': {
      'uk': 'Сніданок',
      'en': 'Breakfast',
    },
    '1rel2ajb': {
      'uk': 'Обід',
      'en': 'Lunch',
    },
    'h6y2qab1': {
      'uk': 'Вечеря',
      'en': 'Dinner',
    },
    'facn0rrm': {
      'uk': 'Інше',
      'en': 'Other',
    },
    'mzsui0x9': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HomeShoppingHistory
  {
    'hww2hnse': {
      'uk': 'Shopping',
      'en': 'Shopping',
    },
    'dknmqqg4': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'x9gszhf1': {
      'uk': 'Storage',
      'en': 'Storage',
    },
    'm98ii6ez': {
      'uk': 'Поточний список',
      'en': 'Actual',
    },
    'gsynii1r': {
      'uk': 'Історія',
      'en': 'History',
    },
    'mjt9er7x': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // Settings_Notifications
  {
    '6y8vuvih': {
      'uk': 'Година, о которій надходять сповіщення про присутні події',
      'en': '',
    },
    '9lawvclt': {
      'uk': 'Оберіть час сповіщень',
      'en': 'Home',
    },
    'yt24jwsl': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '4tp145uv': {
      'uk': '05:00',
      'en': '',
    },
    '8x7xb1p7': {
      'uk': '06:00',
      'en': '',
    },
    'tjx1jvng': {
      'uk': '07:00',
      'en': '',
    },
    'g000n8bv': {
      'uk': '08:00',
      'en': '',
    },
    'jta2por3': {
      'uk': '09:00',
      'en': '',
    },
    'ta48ajxw': {
      'uk': '10:00',
      'en': '',
    },
    'gjbdoh0l': {
      'uk': '11:00',
      'en': '',
    },
    'lklfc3b4': {
      'uk': '12:00',
      'en': '',
    },
    'isnca8z2': {
      'uk': '13:00',
      'en': '',
    },
    'voe8ig9o': {
      'uk': '14:00',
      'en': '',
    },
    '6beriiu6': {
      'uk': '15:00',
      'en': '',
    },
    'i6giq53o': {
      'uk': '16:00',
      'en': '',
    },
    'm0azsprf': {
      'uk': '17:00',
      'en': '',
    },
    'qay86yu4': {
      'uk': '18:00',
      'en': '',
    },
    'rka9l64u': {
      'uk': '19:00',
      'en': '',
    },
    '6jmqefyq': {
      'uk': '20:00',
      'en': '',
    },
    'vvzp9nru': {
      'uk': 'Сповіщення',
      'en': 'Settings',
    },
    'xni6yr8o': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // Settings_Storage_HouseholdCategories
  {
    '2xht240h': {
      'uk': 'Налаштування',
      'en': '',
    },
    'q2ghpity': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    '6mzycjhj': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'ux008bwm': {
      'uk': '',
      'en': '',
    },
    'w733wy0w': {
      'uk': 'Додати категорію',
      'en': 'New category',
    },
    'v7jqtrvi': {
      'uk': '',
      'en': '',
    },
    '7cmzanly': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // Household
  {
    'lwkzfwu1': {
      'uk': 'Shopping',
      'en': 'Shopping',
    },
    'rlpk1css': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'sqf2d0un': {
      'uk': 'Storage',
      'en': 'Storage',
    },
    'j992yftb': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    'inbtnljl': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'fwi0ci0j': {
      'uk': 'All ',
      'en': 'Всі',
    },
    'nbqnvjh8': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // MealIngridients
  {
    'zinv9nzw': {
      'uk': 'Рецепт',
      'en': 'Recipe',
    },
    'ahoiw0ly': {
      'uk': 'Відмінусувати продукти',
      'en': '',
    },
    'yr9c2g40': {
      'uk': 'Meal Ingredients',
      'en': 'Інгрідієнти страви',
    },
    'k7mlaaul': {
      'uk': 'Button',
      'en': 'Button',
    },
    'dj4f7xop': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // StorageFood
  {
    'ecnzn07y': {
      'uk': 'Shopping',
      'en': 'Shopping',
    },
    'ojbxx00i': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'ub8m74d1': {
      'uk': 'Storage',
      'en': 'Storage',
    },
    'zkc22otq': {
      'uk': 'Food',
      'en': '',
    },
    'eu821lyn': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'pho9bxyg': {
      'uk': 'Зіпсовані продукти',
      'en': '',
    },
    't5pdmn3v': {
      'uk': 'All',
      'en': 'Всі продукти',
    },
    'zxx6bxto': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // Settings_help_center
  {
    'm8i3hlwj': {
      'uk': 'FAQ',
      'en': 'FAQs',
    },
    '4s058e08': {
      'uk':
          'Безкоштовний план пропонує ознайомчу версію, з рекламою та деякими обмеженнями, а саме:',
      'en':
          'The free plan offers a trial version, with ads and some limitations, namely:',
    },
    'xlml5h6x': {
      'uk': 'Обмеження кількості записів в історії покупок',
      'en': 'Limiting the number of entries in the purchase history',
    },
    'fhbyy13h': {
      'uk': 'Обмеження по функціоналу',
      'en': 'Functional limitations',
    },
    '13ffe5tx': {
      'uk':
          'Обмеження зумовлені тим, що за сховище даних та підтримку працездатності системи треба платити щомісячно. Також, оплата праці розробників та збільшення можливостей команди входить в цей список.',
      'en':
          'The limitations are due to the fact that data storage and maintenance of the system must be paid monthly. Also, paying developers and increasing the capabilities of the team is included in this list.',
    },
    'dgrsqlky': {
      'uk':
          '“Про” план знімає всі обмеження, прибирає рекламу та дає змогу покращувати продукт швидше і якісніше. Також, 10% від суми покупки ми відправимо на потреби притулків для тварин. З їх списком ви можете ознайомитись у нашому інстаграм акаунті.',
      'en':
          'The \"Pro\" plan removes all restrictions, removes ads and allows you to improve the product faster and better. Also, we will send 10% of the purchase amount to the needs of animal shelters. You can see their list on our Instagram account.',
    },
    '19b3dizq': {
      'uk': 'Де зберігаються мої дані?',
      'en': 'Where is my data stored?',
    },
    '892yw8e8': {
      'uk':
          'У хмарному середовищі Firebase від Google. Тому при зміні смартфону вам лише потрібно залогінитись тим самим акаунтом і всі записи будуть відновлені.',
      'en':
          'In the Firebase cloud environment from Google. So in case of changing device you only need to login using the same account.',
    },
    'hjyof3o0': {
      'uk': 'Чи можна видалити всі дані?',
      'en': 'Can I delete all data?',
    },
    '48mfnn87': {
      'uk': 'Так, для цього є кнопка в самому низу сторінки',
      'en': 'Yes, you can use the bottom page button for that',
    },
    '5fzz11qw': {
      'uk':
          'Ми записали інструкції по користуванню застосунком в нашому інстаграм та телеграм каналі. Нижче є посилання на них.',
      'en':
          'We have recorded instructions for using the application on our Instagram and Telegram channel. Above are the lnks on them.',
    },
    'kf0yu637': {
      'uk': 'Підтримка',
      'en': 'Contact Support',
    },
    'mp40ei30': {
      'uk': 'Напишіть нам на пошту plan.remind@gmail.com',
      'en': 'Please write to us at plan.remind@gmail.com',
    },
    'l20ofp95': {
      'uk': '@plan_remind_app at instagram',
      'en': 'plan_remind_app ',
    },
    't6h1yaa5': {
      'uk': 'Про додаток',
      'en': 'About App',
    },
    'gq3n0m30': {
      'uk':
          'Застосунок Plan Remind - цифровий помічник, який допоможе планувати певні речі та буде нагадувати про них. ',
      'en':
          'The Plan Remind application is a digital assistant that will help you plan certain things and will remind you about them.',
    },
    '01f6kbmx': {
      'uk':
          'Починаючи від планування страв на тиждень, закінчуючи нагадуваннями погасити борг. Наразі, всі модулі в розробці, щодо графіку релізів - спирайтесь на інформацію в інстаграм профілі. ',
      'en':
          'Starting from planning meals for the week, ending with reminders to pay off debt. Currently, all modules are under development, regarding the schedule of releases - rely on the information in the Instagram profile.',
    },
    'faitvbj8': {
      'uk': 'Видалити обліковий запис',
      'en': 'Remove account',
    },
  },
  // SettingsShops
  {
    'd75dhpfi': {
      'uk': 'Налаштування',
      'en': 'Settings',
    },
    '7qiz0h7d': {
      'uk': 'Список магазинів',
      'en': 'Shops',
    },
    'efg3sbcq': {
      'uk': '',
      'en': '',
    },
    'figdqx9i': {
      'uk': '',
      'en': '',
    },
    '25bcy0wx': {
      'uk': 'Назва магазину...',
      'en': 'Shop name...',
    },
    'jaywcc7d': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // WellcomePageOld
  {
    '6921wi8j': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    'w1bly02a': {
      'uk': 'UKR',
      'en': 'UKR',
    },
    'xoniorwt': {
      'uk': 'Ласкаво просимо в наш додаток!',
      'en': 'Welcome to our App!',
    },
    'hloxddyw': {
      'uk': 'Ми раді, що ви з нами. Для початку зробимо деякі налаштування.',
      'en':
          'We\'re thrilled to have you with us. To get started, let\'s do some settings. ',
    },
    'ufi5aztu': {
      'uk':
          'Давайте виберемо бажані категорії для харчового та побутового модулів.',
      'en':
          'Let\'s select your preferred categories for storage food and household modules.',
    },
    'nmhimvlu': {
      'uk':
          'Виберіть свої улюблені продуктові магазини або торгові точки. Це полегшить створення вашого списку покупок.',
      'en':
          'Choose your favorite grocery stores or product outlets. This will enhance creating your shopping list.',
    },
    '5da8l2f8': {
      'uk': 'Виберіть свої улюблені одиниці виміру.',
      'en': '',
    },
    'to85mw2x': {
      'uk': 'Let\'s start!',
      'en': 'Let\'s start!',
    },
    '6ffqz734': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SetCategoriesFood
  {
    'rd389n0d': {
      'uk': 'Продовжити',
      'en': 'Continue',
    },
    '96tjckj8': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    'p4il6mp9': {
      'uk': 'UKR',
      'en': 'UKR',
    },
    'z0z0gu5j': {
      'uk': 'Давайте виберемо бажані категорії для харчового модуля.',
      'en': 'Let\'s select your preferred categories for storage food module.',
    },
    '0pqvh70k': {
      'uk': 'Нова категорія...',
      'en': 'New category...',
    },
    'hl0qh46z': {
      'uk': '',
      'en': '',
    },
    '1le4wnlx': {
      'uk': '',
      'en': '',
    },
    'w4hp6yt4': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SetShops
  {
    '3j010kej': {
      'uk': 'Продовжити',
      'en': 'Continue',
    },
    'wjtcmskj': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    '24v602ox': {
      'uk': 'UKR',
      'en': 'UKR',
    },
    'zdgobmp4': {
      'uk':
          'Виберіть свої улюблені продуктові магазини або торгові точки. Це полегшить створення вашого списку покупок.',
      'en':
          'Choose your favorite grocery stores or product outlets. This will enhance creating your shopping list.',
    },
    'uh1to03e': {
      'uk': 'Назва магазину...',
      'en': 'Shop name...',
    },
    'tndsoff1': {
      'uk': '',
      'en': '',
    },
    'z724eg8m': {
      'uk': '',
      'en': '',
    },
    'mzd7eqsk': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SetCategoriesHousehold
  {
    's0xtl9wd': {
      'uk': 'Продовжити',
      'en': 'Continue',
    },
    '9dwtayo7': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    'xinlw90j': {
      'uk': 'UKR',
      'en': 'UKR',
    },
    '2np47ymy': {
      'uk': 'Давайте виберемо бажані категорії для побутового модуля.',
      'en':
          'Let\'s select your preferred categories for storage household module.',
    },
    'v782p8vh': {
      'uk': 'Нова категорія...',
      'en': 'New category...',
    },
    'ss65zmvx': {
      'uk': '',
      'en': '',
    },
    'u4wzkbua': {
      'uk': '',
      'en': '',
    },
    'xi2edxh0': {
      'uk': 'Home',
      'en': '',
    },
  },
  // Settings_Storage_FoodCategories
  {
    'msm8r4fn': {
      'uk': 'Налаштування',
      'en': 'Settings',
    },
    '3b3mkb2f': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    'adrzv1c2': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'duxjve90': {
      'uk': '',
      'en': '',
    },
    'zsum884p': {
      'uk': 'Додати категорію',
      'en': 'New category',
    },
    'i2jxcrb1': {
      'uk': '',
      'en': '',
    },
    '6thosw0o': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HomeCategories
  {
    'kyrfm3yn': {
      'uk': 'Кухня',
      'en': 'Kitchen',
    },
    'yb70sw9r': {
      'uk': 'Дні Народження',
      'en': 'Birthdays',
    },
    '4tswk39s': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // BirthdaysContactsPage
  {
    '9it35kpg': {
      'uk': 'Додати',
      'en': 'Add',
    },
    'pp2uiufa': {
      'uk': 'Найближчі дні народження',
      'en': 'Upcoming dates',
    },
    'wmcckhso': {
      'uk': 'Дні народження',
      'en': 'Birthdays',
    },
    '7xsfj1v8': {
      'uk': 'Home',
      'en': '',
    },
  },
  // RecipeByStepsPage
  {
    'ryke65f6': {
      'uk': 'Повний',
      'en': 'Full',
    },
    'ytjdtpzt': {
      'uk': 'Покроково',
      'en': 'By steps',
    },
    'rpm4ek59': {
      'uk': 'Посилання на сайт з рецептом',
      'en': 'Link to the site with the recipe',
    },
    '2mccwv6b': {
      'uk': 'Посилання на відео з рецептом',
      'en': 'Link to the recipe video',
    },
    'n7guhjsm': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    '38k794ag': {
      'uk': 'Рецепт',
      'en': 'Recipe',
    },
    '0p2n24wp': {
      'uk': 'Home',
      'en': '',
    },
  },
  // FriendsPage
  {
    'rlry4jie': {
      'uk': 'Друзі',
      'en': 'Friends',
    },
    'l7weqcz4': {
      'uk': 'Ваше ім\'я:',
      'en': 'Your name:',
    },
    'scnjmv68': {
      'uk': 'Поділитися своїм обліковим записом з другом',
      'en': 'Share your account with a friend',
    },
    'qon919zz': {
      'uk': 'Дні народження',
      'en': 'Add friend',
    },
    'iz9xbws1': {
      'uk': 'Додати друга',
      'en': 'Add friend',
    },
    'ibcabmde': {
      'uk': 'Мої друзі',
      'en': 'My friends',
    },
    'lqc4gnos': {
      'uk': 'Home',
      'en': '',
    },
  },
  // RecipeFullPage
  {
    '5exk8wkd': {
      'uk': 'Повний',
      'en': 'Full',
    },
    '460dylu0': {
      'uk': 'Пошагово',
      'en': 'By steps',
    },
    '9y1sm5y5': {
      'uk': 'Посилання на сайт з рецептом',
      'en': 'Link to the site with the recipe',
    },
    'ex15dqsd': {
      'uk': 'Посилання на відео з рецептом',
      'en': 'Link to the recipe video',
    },
    'wyca0khf': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'n78q5jhi': {
      'uk': 'Рецепт',
      'en': 'Recipe',
    },
    'dd4xf1xe': {
      'uk': 'Home',
      'en': '',
    },
  },
  // CarServicePlannerPage
  {
    'uh8fq1zt': {
      'uk': 'Автосервіс',
      'en': '',
    },
    '60ilb9ez': {
      'uk': 'History',
      'en': '',
    },
    'igksda1e': {
      'uk': 'Planner',
      'en': '',
    },
    'dbxvnea0': {
      'uk': 'Cars',
      'en': '',
    },
    'imsyeq13': {
      'uk': 'Сьогодні',
      'en': 'Today',
    },
    'fqjhe8t1': {
      'uk': 'Завтра',
      'en': 'Tomorrow',
    },
    '7ifivmvv': {
      'uk': 'Найближчими днями',
      'en': 'Upcoming',
    },
    '71b605ay': {
      'uk': 'Усі події',
      'en': 'Upcoming',
    },
    'rkaf1hz0': {
      'uk': 'Наразі записи відсутні',
      'en': '',
    },
    'tu55ca6z': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // CarServiceHistoryPage
  {
    'ntdcufx2': {
      'uk': 'Історія пуста',
      'en': '',
    },
    'nlw9iu1d': {
      'uk': 'Автосервіс',
      'en': '',
    },
    'vvoci361': {
      'uk': 'History',
      'en': '',
    },
    'h0xg8eny': {
      'uk': 'Planner',
      'en': '',
    },
    'xj0i5vj4': {
      'uk': 'Cars',
      'en': '',
    },
    'pel2t2a0': {
      'uk': 'Home',
      'en': '',
    },
  },
  // CarServiceInformationPage
  {
    'uytfmpqr': {
      'uk': 'VIN Код',
      'en': 'VIN code',
    },
    'xzt8styy': {
      'uk': 'Пробіг',
      'en': 'Mileage',
    },
    '0gk0z1bj': {
      'uk': 'Змінити',
      'en': '',
    },
    'pp6w629r': {
      'uk': 'Add new car',
      'en': '',
    },
    'isf4xiuj': {
      'uk': 'Видалити запис',
      'en': '',
    },
    'eyj5nape': {
      'uk': 'Список деталей порожній',
      'en': '',
    },
    'a5cmkbb4': {
      'uk': 'Для того, щоб добавити деталь, вам потрібен автомобіль',
      'en': '',
    },
    '1s04ulm1': {
      'uk': 'Автосервіс',
      'en': '',
    },
    '14br83qu': {
      'uk': 'History',
      'en': '',
    },
    'mo75osbx': {
      'uk': 'Planner',
      'en': '',
    },
    'rng5134w': {
      'uk': 'Cars',
      'en': '',
    },
    'r5ugbrcb': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SparePartsPage
  {
    'v3mxp7ju': {
      'uk': 'Запчастини',
      'en': '',
    },
    'guhajawq': {
      'uk': 'Home',
      'en': '',
    },
  },
  // PlantsPlannerPage
  {
    'zojps4qi': {
      'uk': 'Plants',
      'en': '',
    },
    'e0l9n5en': {
      'uk': 'My Plants',
      'en': '',
    },
    'fthligmm': {
      'uk': 'Planner',
      'en': '',
    },
    'c7efo504': {
      'uk': 'Today',
      'en': '',
    },
    '0h9pa4rr': {
      'uk': 'Watering',
      'en': '',
    },
    'hz5rktxk': {
      'uk': 'Fertilization',
      'en': '',
    },
    'c9dfq7mv': {
      'uk': 'Solig change',
      'en': '',
    },
    'uf6oj82u': {
      'uk': 'Tomorrow',
      'en': '',
    },
    '8da6pfz6': {
      'uk': 'Hello World',
      'en': '',
    },
    'oqo7uaqa': {
      'uk': 'Hello World',
      'en': '',
    },
    'i588zz5q': {
      'uk': 'Hello World',
      'en': '',
    },
    'jradev7j': {
      'uk': 'Hello World',
      'en': '',
    },
    'px8fcort': {
      'uk': 'Upcoming',
      'en': '',
    },
    'j0qh5m3j': {
      'uk': 'Наразі записи відсутні',
      'en': '',
    },
    '2zf5062w': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthPlannerPage
  {
    'i96u2hf6': {
      'uk': 'На сьогоднi подiй немає',
      'en': '',
    },
    'ols081o9': {
      'uk': 'Здоров\'я',
      'en': 'Health',
    },
    'cz14pkeq': {
      'uk': 'History',
      'en': '',
    },
    '9tzn45qn': {
      'uk': 'Planner',
      'en': '',
    },
    'fn7dv4m6': {
      'uk': 'Medication',
      'en': '',
    },
    'toqfag5z': {
      'uk': 'Home',
      'en': '',
    },
  },
  // PetsPlannerPage
  {
    '90lfitav': {
      'uk': 'На сьогоднi подiй немає',
      'en': '',
    },
    '85xeb4fi': {
      'uk': 'Улюбленці',
      'en': '',
    },
    '6kiv45ok': {
      'uk': 'History',
      'en': '',
    },
    '0umoppk5': {
      'uk': 'Planner',
      'en': '',
    },
    '9rxpnkej': {
      'uk': 'Pets',
      'en': '',
    },
    'qk8bgdzw': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SportsPlannerPage
  {
    '1pyfhmo0': {
      'uk': 'History',
      'en': '',
    },
    'jipha51p': {
      'uk': 'Planner',
      'en': '',
    },
    'pkgctbvk': {
      'uk': 'Home',
      'en': '',
    },
  },
  // MyPlantsPageList
  {
    'egoz7e3h': {
      'uk': 'Plants',
      'en': '',
    },
    'uehksx1x': {
      'uk': 'My Plants',
      'en': '',
    },
    'l8frloi3': {
      'uk': 'Planner',
      'en': '',
    },
    'o11bfnel': {
      'uk': 'Наразі список пустий',
      'en': '',
    },
    'yf55bmnn': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthHistoryPageEvents
  {
    'd51pzp09': {
      'uk': 'Наразі архів пустий',
      'en': '',
    },
    '7cln47t1': {
      'uk': 'Здоров\'я',
      'en': '',
    },
    'u7hbfnua': {
      'uk': 'History',
      'en': '',
    },
    '5f7o3io7': {
      'uk': 'Planner',
      'en': '',
    },
    'r5bch8g0': {
      'uk': 'Medication',
      'en': '',
    },
    'pz6z95c4': {
      'uk': 'Події',
      'en': '',
    },
    '5l4fet8o': {
      'uk': 'Ліки',
      'en': '',
    },
    '84tug3kc': {
      'uk': 'Home',
      'en': '',
    },
  },
  // AllMedicationPage
  {
    '01yqzd3x': {
      'uk': 'Здоров\'я',
      'en': '',
    },
    'bvrvvw82': {
      'uk': '',
      'en': '',
    },
    'fefi9874': {
      'uk': 'History',
      'en': '',
    },
    'ok1hoeu7': {
      'uk': 'Planner',
      'en': '',
    },
    'q8djr5ib': {
      'uk': 'Medication',
      'en': '',
    },
    'y42i8id4': {
      'uk': 'Сьогодні',
      'en': '',
    },
    'sr8218zd': {
      'uk': 'Всі ліки',
      'en': '',
    },
    'xj69o1rm': {
      'uk': 'Home',
      'en': '',
    },
  },
  // WellcomePage
  {
    'l69afhxf': {
      'uk': 'Твій найкращий цифровий помічник',
      'en': 'Your best digital assistant',
    },
    'qyzbnlrl': {
      'uk': 'Ласĸаво просимо до Plan&Remind! ',
      'en': 'Wellcome to Plan&Remind!',
    },
    'nt70wne5': {
      'uk': 'Додаток спрощує нагадування та планування щоденних справ.',
      'en': 'The application simplifies reminders and planning of daily tasks.',
    },
    'zm8mqh55': {
      'uk': 'Виберіть модулі ',
      'en': 'Select modules',
    },
    '16ybp4dx': {
      'uk': 'Виберіть потрібні модулі для подальшої роботи.',
      'en': 'Select the required modules for further work.',
    },
    'a8pmkxju': {
      'uk': 'Налаштуйте модулі ',
      'en': 'Configure modules',
    },
    'z5gd883q': {
      'uk': 'Заповніть інформацію для корректного відслідковування подій.',
      'en': 'Fill in the information for correct event tracking.',
    },
    's020d6lx': {
      'uk': 'Далі',
      'en': 'Next',
    },
    'averte5p': {
      'uk': 'Home',
      'en': '',
    },
  },
  // WellcomePageModules
  {
    'eur95gho': {
      'uk': '< Back',
      'en': '< Back',
    },
    'gy3ct8yi': {
      'uk': 'Модуль Home',
      'en': 'Home module',
    },
    'jl1v32ml': {
      'uk':
          'У цьому модулі ви можете планувати прийоми їжі, створювати списĸи поĸупоĸ та відстежувати запаси продуĸтів. Таĸож є фунĸція Birthdays для відстеження важливих дат.',
      'en':
          'In this module, you can plan meals, create shopping lists and track food stocks. There\'s also a Birthdays feature to keep track of important dates.',
    },
    '0pes7f0u': {
      'uk': '',
      'en': '',
    },
    '6ofedwro': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'j6qq5bo4': {
      'uk': 'Модуль Car service',
      'en': 'Car service module',
    },
    '9idiw1qi': {
      'uk':
          'У цьому модулі ви можете планувати обслуговування автомобіля за аĸтуальним пробігом, додавати записи про виĸонані роботи та відстежувати стан запчастин.',
      'en':
          'In this module, you can plan car maintenance based on the current mileage, add records of completed work, and track the status of spare parts.',
    },
    'jq83re6z': {
      'uk': '',
      'en': '',
    },
    'cvs9617a': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'a0f9nk9d': {
      'uk': 'Модуль Plants',
      'en': 'Plants module',
    },
    '0c4hzxyd': {
      'uk':
          'Цей модуль призначений для нагадування вам про своєчасне та належне поливання домашніх рослин.',
      'en':
          'This module is designed to remind you about timely and proper watering of houseplants.',
    },
    '4qi386mx': {
      'uk': '',
      'en': '',
    },
    'vfrq4iek': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'd9u46x6b': {
      'uk': 'Модуль Health',
      'en': 'Health module',
    },
    '2khqup67': {
      'uk':
          'Цей модуль для нотатоĸ після візиту до ліĸаря, нагадування про візити до\nстоматолога та прийом ліĸів.',
      'en':
          'This module is for notes after a visit to a doctor, reminders about visits to\ndentist and medication.',
    },
    'gmjhg2zq': {
      'uk': '',
      'en': '',
    },
    'cos2phzs': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'an75j0kk': {
      'uk': 'Модуль Pets',
      'en': 'Pets module',
    },
    'inz3ovzi': {
      'uk':
          'Цей модуль дозволяє ĸонтролювати параметри ваших домашніх улюбленців, таĸі яĸ вага, віĸ, ваĸцинації, графіĸ годування та інші',
      'en':
          'This module allows you to control the parameters of your pets, such as weight, age, vaccinations, feeding schedule and others',
    },
    've8tylek': {
      'uk': '',
      'en': '',
    },
    'bgxfeuzi': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'wba937k4': {
      'uk': 'Модуль Sport',
      'en': 'Sport module',
    },
    'ltmaukjg': {
      'uk':
          'Плануйте та відстежуйте заняття спортом, отримуйте нагадування про відвідування залу та формуйте зручний графіĸ',
      'en':
          'Plan and track sports, get gym reminders, and create a convenient schedule',
    },
    '8vs5mwai': {
      'uk': '',
      'en': '',
    },
    'd2u6iumv': {
      'uk': 'Додати +',
      'en': 'Add +',
    },
    'skyewxpn': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SettingsModules
  {
    'wgo4exuw': {
      'uk': 'Модулі',
      'en': 'Modules',
    },
    'wwpn6oqg': {
      'uk': 'Дім',
      'en': 'Home',
    },
    'w61ibmzz': {
      'uk': 'Гараж',
      'en': 'Garage',
    },
    '3sktvdg4': {
      'uk': 'Рослини',
      'en': 'Plants',
    },
    '2b0o1674': {
      'uk': 'Здоровʼя',
      'en': 'Health',
    },
    'yhy9h8la': {
      'uk': 'Улюбленці',
      'en': 'Pets',
    },
    'irgzrda4': {
      'uk': 'Спорт',
      'en': 'Sport',
    },
    'rfykjd8z': {
      'uk': 'Налаштування',
      'en': 'Settings',
    },
    'n11pqh5i': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HomeShoppingActual
  {
    '7b3i19op': {
      'uk': 'Shopping',
      'en': '',
    },
    'sbtl8jns': {
      'uk': 'Planner',
      'en': '',
    },
    'urlbnkua': {
      'uk': 'Storage',
      'en': '',
    },
    'nlwcov11': {
      'uk': 'Поточний список',
      'en': '',
    },
    'tsdg2fb4': {
      'uk': 'Історія',
      'en': '',
    },
    'mald2apg': {
      'uk': 'Нові пропозиції у скрині',
      'en': '',
    },
    '6k4cmnpp': {
      'uk': 'Виконано усе',
      'en': '',
    },
    '5ij3uo5j': {
      'uk': 'Скасувати',
      'en': '',
    },
    'db9h64vt': {
      'uk': 'Вибрати',
      'en': '',
    },
    '6tpidpvc': {
      'uk': 'Обрати все ',
      'en': '',
    },
    'ii3li55q': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // TodayMedicationPage
  {
    '68633igz': {
      'uk': 'Здоров\'я',
      'en': '',
    },
    'b87x90if': {
      'uk': 'History',
      'en': '',
    },
    'zfq2ui0v': {
      'uk': 'Planner',
      'en': '',
    },
    'cjrwigpl': {
      'uk': 'Medication',
      'en': '',
    },
    '03oz1zjj': {
      'uk': 'Сьогодні',
      'en': '',
    },
    'kjnofc5f': {
      'uk': 'Всі ліки',
      'en': '',
    },
    'mqftq2wt': {
      'uk': 'Home',
      'en': '',
    },
  },
  // recipe
  {
    '79flm69b': {
      'uk': 'Рецепт',
      'en': 'recipe',
    },
    'uqyed7c4': {
      'uk': '',
      'en': '',
    },
    '6i37tgwm': {
      'uk': 'Посилання на сайт з рецептом',
      'en': 'Link to the site with the recipe',
    },
    'ljd19j9l': {
      'uk': 'Посилання...',
      'en': 'Link...',
    },
    '2q25issc': {
      'uk': 'Посилання на відео з рецептом',
      'en': 'Link to the recipe video',
    },
    'gw4ay7iu': {
      'uk': 'Посилання...',
      'en': '',
    },
    'n0iwel69': {
      'uk': 'Основні інгедієнти',
      'en': 'Main ingredients',
    },
    'xo9nzrwo': {
      'uk': '+ Інгредієнт',
      'en': '+ Ingredient',
    },
    'qbyu4uvq': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    '6ov9ulwk': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthHistoryPageMedications
  {
    '9uuypv19': {
      'uk': 'Наразі архів пустий',
      'en': '',
    },
    'd8pdcuqb': {
      'uk': 'Здоров\'я',
      'en': '',
    },
    'p6dtlo56': {
      'uk': 'History',
      'en': '',
    },
    'okm2xulq': {
      'uk': 'Planner',
      'en': '',
    },
    'xbdq4cnw': {
      'uk': 'Medication',
      'en': '',
    },
    '05ca9wby': {
      'uk': 'Події',
      'en': '',
    },
    'ahwbe5je': {
      'uk': 'Ліки',
      'en': '',
    },
    'tbnxhq8e': {
      'uk': 'Home',
      'en': '',
    },
  },
  // PetsHistoryPage
  {
    '6nyt1ny1': {
      'uk': 'Улюбленці',
      'en': '',
    },
    'k5f4vqqs': {
      'uk': 'History',
      'en': '',
    },
    'h57516fr': {
      'uk': 'Planner',
      'en': '',
    },
    'y6qfka56': {
      'uk': 'Pets',
      'en': '',
    },
    '0j5aaf9g': {
      'uk': 'Home',
      'en': '',
    },
  },
  // PetsPetPage
  {
    'pe72nt66': {
      'uk': 'Улюбленці',
      'en': '',
    },
    'fhwf7j73': {
      'uk': 'History',
      'en': '',
    },
    'iepikk51': {
      'uk': 'Planner',
      'en': '',
    },
    'qfvj64uu': {
      'uk': 'Pets',
      'en': '',
    },
    'gezjj0j8': {
      'uk': 'Годування',
      'en': '',
    },
    'yti2npiu': {
      'uk': 'Home',
      'en': '',
    },
  },
  // SportsHistoryPage
  {
    'q1ej2p0p': {
      'uk': 'History',
      'en': '',
    },
    'x8vvr2zh': {
      'uk': 'Planner',
      'en': '',
    },
    'v0ggtre5': {
      'uk': 'Home',
      'en': '',
    },
  },
  // addNewMeal
  {
    'pobgksgg': {
      'uk': 'Додати нову страву',
      'en': 'Add a new dish',
    },
    '8uu9hrrg': {
      'uk': '',
      'en': '',
    },
    'jkmu9njs': {
      'uk': 'Назва страви',
      'en': 'The name of the dish',
    },
    'btwrnmgf': {
      'uk': 'Сніданок',
      'en': '',
    },
    'u7ny6ffc': {
      'uk': 'Обід',
      'en': '',
    },
    'qxqditcj': {
      'uk': 'Вечеря',
      'en': '',
    },
    'eqq8jzvz': {
      'uk': 'Інше',
      'en': '',
    },
    '4w8lqeow': {
      'uk': 'Інгредієнт',
      'en': 'Ingredient',
    },
    'woub5a5p': {
      'uk': 'Додати',
      'en': '',
    },
    'n8rl6eu6': {
      'uk': 'Field is required',
      'en': '',
    },
    '3ypp4810': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nu4c1bbz': {
      'uk': 'Home',
      'en': '',
    },
  },
  // AccountSettings
  {
    '96s660xm': {
      'uk': 'Інформація про акаунт ',
      'en': '',
    },
    'q7vvudq9': {
      'uk': 'Username',
      'en': '',
    },
    'jfulacto': {
      'uk': 'Email',
      'en': '',
    },
    '1l4mmft9': {
      'uk': 'Стан підписки',
      'en': '',
    },
    'qxqz94sf': {
      'uk': 'Статус',
      'en': '',
    },
    'mniqz467': {
      'uk': 'Активна',
      'en': '',
    },
    'juy69d67': {
      'uk': 'Ваша підписка активна до кінця тестового періоду',
      'en': '',
    },
    'e396gh5q': {
      'uk': 'Деталі підписки',
      'en': '',
    },
    '3e8zblpi': {
      'uk': 'Вийти з акаунту',
      'en': '',
    },
    'l2bei0yb': {
      'uk': 'Профіль та підписки',
      'en': '',
    },
  },
  // addingridientspopup
  {
    'q56fk39m': {
      'uk': 'Назва продукту *',
      'en': '',
    },
    'lrlk6zvk': {
      'uk': 'Кількість *',
      'en': '',
    },
    '2nzlbbln': {
      'uk': 'Select...',
      'en': '',
    },
    'bcvbkr79': {
      'uk': 'Search...',
      'en': '',
    },
    'n9ofupeu': {
      'uk': 'Категорія',
      'en': '',
    },
    '9xknaat5': {
      'uk': '* Обов\'язкові поля',
      'en': '',
    },
    's9hy3zmc': {
      'uk': 'Назва продукту is required',
      'en': '',
    },
    '8ve9hep4': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'glmqdb60': {
      'uk': 'Кількість is required',
      'en': '',
    },
    'e0si4rz1': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'g488qv0n': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    'ruj9jqqd': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // deleteMeal
  {
    'ozn0d3xc': {
      'uk': 'Ви впевнені, що хочете видалити страву ?',
      'en': 'Are you sure you want to delete the dish?',
    },
    '8d0sxe40': {
      'uk': 'Так',
      'en': 'Yes',
    },
    '04kb4sta': {
      'uk': 'Ні',
      'en': 'No',
    },
  },
  // addingridientspopupShopping
  {
    '8gfb397n': {
      'uk': '0',
      'en': '',
    },
    '2aqa2pr0': {
      'uk': '',
      'en': '',
    },
    'ubt0o9vz': {
      'uk': 'Search...',
      'en': '',
    },
    'swdtyqvc': {
      'uk': 'Їжа',
      'en': '',
    },
    'pfpk7aaa': {
      'uk': 'Побутове',
      'en': '',
    },
    '10adsm53': {
      'uk': 'Назва *',
      'en': '',
    },
    'tclmk8d6': {
      'uk': 'Кількість *',
      'en': '',
    },
    '56yvuxku': {
      'uk': '1',
      'en': '',
    },
    'pv8i95rp': {
      'uk': 'Оберіть',
      'en': '',
    },
    'dsclgjad': {
      'uk': 'Search...',
      'en': '',
    },
    'wqxutxm0': {
      'uk': 'Категорія',
      'en': '',
    },
    '2ln10z5h': {
      'uk': 'Option 1',
      'en': '',
    },
    'jrlmymk2': {
      'uk': 'Назва магазину',
      'en': 'Shop name',
    },
    'cht4nwwu': {
      'uk': '* Обов\'язкові поля',
      'en': '',
    },
    'zhycvxat': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    'wktplc8v': {
      'uk': 'Скасувати',
      'en': '',
    },
    'bh5ndgso': {
      'uk': 'Field is required',
      'en': '',
    },
    '9m0z3jti': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1ujf89n4': {
      'uk': 'Field is required',
      'en': '',
    },
    'p06uougz': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e63tgpp4': {
      'uk': 'Field is required',
      'en': 'Обовʼязкове поле',
    },
    's7g6lw30': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
  },
  // notFieldError
  {
    'hjttolrs': {
      'uk': 'Перевірте всі поля',
      'en': 'Check that you have filled in all the data',
    },
  },
  // EditCategoryFood
  {
    'edgbxrjm': {
      'uk': 'Редагування',
      'en': 'Edit Category',
    },
    '9h6ww385': {
      'uk': '',
      'en': '',
    },
    'smy1660v': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    '2iqzk95b': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
  },
  // EditShop
  {
    'ikrnvozy': {
      'uk': 'Редагувати',
      'en': 'Edit Shop',
    },
    '4aav85gm': {
      'uk': '',
      'en': '',
    },
    'pafhsuyi': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'v0eus9vp': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
  },
  // EditCategoryHousehold
  {
    'ufjok3cw': {
      'uk': 'Редагувати',
      'en': 'Edit Category',
    },
    'k34ja92m': {
      'uk': '',
      'en': '',
    },
    'ncg0dyvh': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'g3u98kbj': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
  },
  // setNotificationPopup
  {
    'h5vskndo': {
      'uk': 'Оберіть час',
      'en': 'Set notification time',
    },
    'kmfyv7bv': {
      'uk': 'Обрати',
      'en': 'Set notification time',
    },
  },
  // addBirthday
  {
    '77c0vqbc': {
      'uk': 'Додати день народження',
      'en': 'Add Birthday',
    },
    'e0h5brg7': {
      'uk': 'Імʼя',
      'en': 'Name',
    },
    'zuj1zuad': {
      'uk': 'Додати',
      'en': 'Add',
    },
    'edjc5wn7': {
      'uk': 'Поле обовʼязкове',
      'en': '',
    },
    'c0gu77lo': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'p7y9fjd8': {
      'uk': 'Field is required',
      'en': '',
    },
    'asaam8i0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // editBirthday
  {
    'bg1g83hf': {
      'uk': 'Редагування',
      'en': 'Edit Birthday',
    },
    'wwk2vm0y': {
      'uk': 'Name',
      'en': 'Імʼя',
    },
    'ritcealq': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    '6t2bm3am': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
    'tcu5rgah': {
      'uk': 'Field is required',
      'en': '',
    },
    '1unj8xy0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5shgbs1i': {
      'uk': 'Field is required',
      'en': '',
    },
    'eyuyq3x0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // selectLanguage
  {
    'vemqdx2a': {
      'uk': 'Будь ласка, виберіть мову',
      'en': 'Please select a language',
    },
    'tc2g68wa': {
      'uk': 'ENG',
      'en': 'ENG',
    },
    '6gr0wc1g': {
      'uk': '/',
      'en': '/',
    },
    'uvpyaga4': {
      'uk': 'UKR',
      'en': 'UKR',
    },
  },
  // addFriend
  {
    'xl7zek8p': {
      'uk': 'Введіть код друга*',
      'en': 'Enter friend code*',
    },
    't19cgrb5': {
      'uk': 'Введіть ім\'я',
      'en': 'Enter a name',
    },
    'os2rfidm': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'xqsir8t6': {
      'uk': 'Field is required',
      'en': '',
    },
    'a8g10clt': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0mvefdfm': {
      'uk': 'Field is required',
      'en': '',
    },
    '1kuykhr0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // notFoundFriend
  {
    't79spjl6': {
      'uk': 'Друга не знайдено',
      'en': 'Friend not found',
    },
  },
  // addServiceTaskPopup
  {
    'aov6xr51': {
      'uk': 'Назва',
      'en': '',
    },
    'mdsqyukv': {
      'uk': 'Місце',
      'en': '',
    },
    '1izp7b2f': {
      'uk': 'Опис',
      'en': '',
    },
    'tcb0t5pi': {
      'uk': 'Оберіть автомобіль',
      'en': '',
    },
    'v14xyggf': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'hluuull3': {
      'uk': 'Дата',
      'en': '',
    },
    'w7ju1ebp': {
      'uk': 'Зберегти',
      'en': '',
    },
    'fyv0g2oj': {
      'uk': 'Позначити як виконане',
      'en': 'Set as Done',
    },
    'v8hx8urn': {
      'uk': 'Виконано',
      'en': 'Done',
    },
    '74ncemub': {
      'uk': 'Скасувати',
      'en': '',
    },
    'mu1s390k': {
      'uk': 'Field is required',
      'en': '',
    },
    '9xib41u0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2awv8xl8': {
      'uk': 'Field is required',
      'en': '',
    },
    'l84aiqcm': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '661n7l0z': {
      'uk': 'Field is required',
      'en': '',
    },
    'ig785cc5': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '18cy0gvd': {
      'uk': 'Field is required',
      'en': '',
    },
    '4k1vtl9q': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // addCarPopup
  {
    '83wlbnd1': {
      'uk': 'Додати новий автомобіль',
      'en': '',
    },
    '1c3t4b6d': {
      'uk': 'Марка авто',
      'en': 'Car brand',
    },
    'r501hjjz': {
      'uk': 'Модель',
      'en': 'Model',
    },
    'xcd12wjy': {
      'uk': 'Рік випуску',
      'en': 'Year',
    },
    'b1esa7c0': {
      'uk': 'VIN код',
      'en': 'VIN code',
    },
    'ul5blfi1': {
      'uk': 'Актуальнний Пробіг',
      'en': 'Actual mileage',
    },
    'xq0sc0en': {
      'uk': 'Додати',
      'en': '',
    },
    '45p2dt80': {
      'uk': 'Скасувати',
      'en': '',
    },
    '2c4ns005': {
      'uk': 'Field is required',
      'en': '',
    },
    'c7sz9zix': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'tw7qca0t': {
      'uk': 'Field is required',
      'en': '',
    },
    'qkj0vs4e': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'emydreiv': {
      'uk': 'Field is required',
      'en': '',
    },
    'henbefjg': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4d12qsl0': {
      'uk': 'Field is required',
      'en': '',
    },
    'nb7lno0m': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uedb6bia': {
      'uk': 'Field is required',
      'en': '',
    },
    '3yrhaw9w': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6byytdfn': {
      'uk': 'Field is required',
      'en': '',
    },
    'h7cuivnx': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // carSparePartMileage
  {
    'h7mufkty': {
      'uk': 'Заміна',
      'en': '',
    },
    'o0sfjjk0': {
      'uk': 'Заміна через',
      'en': '',
    },
  },
  // addSparePartPopup
  {
    '9mehu0uh': {
      'uk': 'Додати нову деталь',
      'en': 'Are you sure you want to delete?',
    },
    'wgyk6pp5': {
      'uk': 'Назва',
      'en': 'Name',
    },
    'nw28tlal': {
      'uk': 'Замінити через',
      'en': '',
    },
    'hjv03mcl': {
      'uk': 'Додати',
      'en': '',
    },
    'j710sql5': {
      'uk': 'Скасувати',
      'en': '',
    },
    'm8ovx5lt': {
      'uk': 'Field is required',
      'en': '',
    },
    'rnbl9iw3': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '32gni62q': {
      'uk': 'Field is required',
      'en': '',
    },
    'p498nr1m': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5h9rdpop': {
      'uk': 'Field is required',
      'en': '',
    },
    '6enmpk4x': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // addCarMileagePopup
  {
    '15hdp6ji': {
      'uk': 'Додайте пробіг автомобіля',
      'en': 'Add car mileage',
    },
    'wd9p8248': {
      'uk': 'Додати',
      'en': '',
    },
  },
  // addNewPlantPopup
  {
    'gvzk7tdu': {
      'uk': 'Назва',
      'en': 'Name',
    },
    'pm9zoeyp': {
      'uk': 'Кількість води',
      'en': 'Amount of water',
    },
    'd1eeokzx': {
      'uk': '',
      'en': '',
    },
    'u92dvqvs': {
      'uk': 'Every X day',
      'en': '',
    },
    'ddcdhnif': {
      'uk': 'Please select...',
      'en': '',
    },
    '2ihsnqsg': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'nsv0ne01': {
      'uk': 'Частота поливу',
      'en': '',
    },
    'ncmftx1c': {
      'uk': 'Кожного дня',
      'en': 'Everyday',
    },
    'ocb9ir7l': {
      'uk': 'Повторювати через',
      'en': 'Every X days',
    },
    'pr2agijx': {
      'uk': 'Конкретні дні неділі',
      'en': 'Specific day of the week',
    },
    'sot48n9r': {
      'uk': 'Введіть кількість днів',
      'en': '',
    },
    '6zrf53h4': {
      'uk': 'Оберіть необхідні дні',
      'en': '',
    },
    'bkz6e2u6': {
      'uk': 'Пн',
      'en': 'Mon',
    },
    'th35yak3': {
      'uk': 'Вт',
      'en': 'Tue',
    },
    'rbj1h0a1': {
      'uk': 'Ср',
      'en': 'Wed',
    },
    'p553lgar': {
      'uk': 'Чт',
      'en': 'Thr',
    },
    'r3xld6ld': {
      'uk': 'Пт',
      'en': 'Fri',
    },
    'xyrti9s4': {
      'uk': 'Сб',
      'en': 'Sat',
    },
    'sod1kkz2': {
      'uk': 'Нд',
      'en': 'Sun',
    },
    'fm5ifrd3': {
      'uk': 'Вами не обрано жодного дня',
      'en': '',
    },
    'uq6li9q0': {
      'uk': 'Підживлювати через (дні)',
      'en': '',
    },
    'cv9queyr': {
      'uk': 'Every X day',
      'en': '',
    },
    '4oms8e44': {
      'uk': 'Освітлення',
      'en': '',
    },
    '2k27vfvz': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'zx8ezj22': {
      'uk': 'Освітлення',
      'en': '',
    },
    '0nzhrsed': {
      'uk': 'Тінь',
      'en': '',
    },
    'p4cjune3': {
      'uk': 'Розсіяне світло',
      'en': '',
    },
    's9j8ygut': {
      'uk': 'Яскраве розсіяне світло',
      'en': '',
    },
    'ax884523': {
      'uk': 'Пряме яскраве світло',
      'en': '',
    },
    'zsee6ps3': {
      'uk': '',
      'en': '',
    },
    'geykfr35': {
      'uk': 'Every X day',
      'en': '',
    },
    'ara75qvv': {
      'uk': 'Температура',
      'en': '',
    },
    'tmberwf1': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'anbe8a18': {
      'uk': 'Тепература',
      'en': '',
    },
    '39dropzj': {
      'uk': '5-10°C',
      'en': '',
    },
    'w0cnzdff': {
      'uk': '10-15°C',
      'en': '',
    },
    'enxyvohv': {
      'uk': '15-18°C',
      'en': '',
    },
    '31pqivcj': {
      'uk': '18-20°C',
      'en': '',
    },
    '6xxmyc9c': {
      'uk': '20-25°C',
      'en': '',
    },
    'p28llj5c': {
      'uk': '',
      'en': '',
    },
    'sq8f0vyn': {
      'uk': 'Every X day',
      'en': '',
    },
    'e6s8lby7': {
      'uk': 'Заміна грунту',
      'en': '',
    },
    'u39t8ud7': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'y08lxz97': {
      'uk': 'Заміна ґрунту',
      'en': '',
    },
    'il2pnskm': {
      'uk': 'Раз на рік',
      'en': '',
    },
    'uxwdikb6': {
      'uk': 'Раз на два роки',
      'en': '',
    },
    'y524vboz': {
      'uk': 'Раз на три роки',
      'en': '',
    },
    'tqruerss': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    '8flu07m0': {
      'uk': 'Скасувати',
      'en': '',
    },
    '2hwc5gxx': {
      'uk': 'Field is required',
      'en': '',
    },
    'p3g1nhd4': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0e77gi1t': {
      'uk': 'Field is required',
      'en': '',
    },
    'aswcby24': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4q9m7h7t': {
      'uk': 'Field is required',
      'en': '',
    },
    '30thducm': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h24iosxm': {
      'uk': 'Field is required',
      'en': '',
    },
    'bfk5e2tc': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // newEventPopup
  {
    'f5v8719l': {
      'uk': 'Назва',
      'en': '',
    },
    'q4m2mb81': {
      'uk': 'Дата та час',
      'en': '',
    },
    'g2ig1vwt': {
      'uk': 'Додаткова інформація',
      'en': '',
    },
    'vmh143s0': {
      'uk': 'Field is required',
      'en': '',
    },
    'oolz3n9w': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3gm8qy7i': {
      'uk': 'Field is required',
      'en': '',
    },
    'vw2r2m7f': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8w2bvke1': {
      'uk': 'Field is required',
      'en': '',
    },
    'rk82b609': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'olv1uxoh': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    'wcrugdcf': {
      'uk': 'Позначити як виконане',
      'en': '',
    },
    'jv7n4d1q': {
      'uk': 'Виконано',
      'en': '',
    },
    'jwz3ck0d': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // plantInfoPopup
  {
    '2n0moiro': {
      'uk': 'Редагувати',
      'en': 'Edit',
    },
    'jpckhfj9': {
      'uk': 'Моя рослина',
      'en': 'My plant',
    },
  },
  // chooseDate
  {
    'w4e84suk': {
      'uk': '',
      'en': '',
    },
    'x03s8ye3': {
      'uk': '',
      'en': '',
    },
    'z9d7ax3q': {
      'uk': '',
      'en': '',
    },
  },
  // addUnitsOfMeasurement
  {
    'k51pmoff': {
      'uk': 'Оберіть одиниці виміру',
      'en': '',
    },
    '5xhh5smx': {
      'uk': 'г',
      'en': '',
    },
    'zdxkay4t': {
      'uk': 'кг',
      'en': '',
    },
    'ilags8z0': {
      'uk': 'штука',
      'en': '',
    },
    'zqh1lf79': {
      'uk': 'л',
      'en': '',
    },
    'v5d6zrn7': {
      'uk': 'мл',
      'en': '',
    },
    'rm4pudqs': {
      'uk': 'унція',
      'en': '',
    },
    '6kbw4xro': {
      'uk': 'фунт',
      'en': '',
    },
    '23uf0mfp': {
      'uk': 'кварта',
      'en': '',
    },
    'pj5f72z3': {
      'uk': 'пінта',
      'en': '',
    },
    '7n0zcwyb': {
      'uk': 'рідка унція',
      'en': '',
    },
  },
  // DeleteConfirmationPopup
  {
    's5zxoadi': {
      'uk': 'Ви дійсно бажаєте видалити?',
      'en': 'Are you sure you want to delete?',
    },
    'thb0sz7z': {
      'uk': 'Так',
      'en': 'Yes',
    },
    '851c06rx': {
      'uk': 'Ні',
      'en': 'No',
    },
  },
  // chooseDateCopy
  {
    '3whit0mo': {
      'uk': '',
      'en': '',
    },
    'ba011qcm': {
      'uk': '',
      'en': '',
    },
    'mzn0tboc': {
      'uk': '',
      'en': '',
    },
  },
  // setShopForShoppingList
  {
    'j17wpdne': {
      'uk': 'Вибрати магазин',
      'en': 'Select a store',
    },
  },
  // MyCarPopup
  {
    'q9t2tuiu': {
      'uk': ' рік випуску',
      'en': '',
    },
    'z6w2g9sm': {
      'uk': 'VIN code',
      'en': '',
    },
    'npil8gc9': {
      'uk': 'Mileage',
      'en': '',
    },
    '0exgcyzp': {
      'uk': 'Зберегти зміни',
      'en': '',
    },
    'oe278818': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // ExpandedFloatMenu
  {
    '1tgiptdv': {
      'uk': 'Додати Авто',
      'en': 'Add a Car',
    },
    '4pfnjhkd': {
      'uk': 'Додати Запчастину',
      'en': 'Add spare part',
    },
  },
  // wateringFrequencyPopup
  {
    'zp7w1b58': {
      'uk': 'Частота поливу',
      'en': '',
    },
    'ydgcbr97': {
      'uk': 'Every X day',
      'en': '',
    },
    'wkeqkgj1': {
      'uk': 'Please select...',
      'en': '',
    },
    'mfyqppvu': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'd7k3ocwl': {
      'uk': 'Кожного дня',
      'en': 'Everyday',
    },
    'sqa9k30b': {
      'uk': 'Кожні Х днів',
      'en': 'Every X days',
    },
    'kr4hdvsc': {
      'uk': 'Конкретний день тижня',
      'en': 'Specific day of the week',
    },
    'pjagmstp': {
      'uk': 'Введіть кількість днів',
      'en': '',
    },
    'bnzce9nl': {
      'uk': 'Оберіть необхідний день неділі',
      'en': '',
    },
    '0738rh8j': {
      'uk': 'Пн',
      'en': 'Mon',
    },
    'aq3f815q': {
      'uk': 'Вт',
      'en': 'Tue',
    },
    '2qikkmdt': {
      'uk': 'Ср',
      'en': 'Wed',
    },
    '8o5f1hln': {
      'uk': 'Чт',
      'en': 'Thr',
    },
    'yjmd4lkl': {
      'uk': 'Пт',
      'en': 'Fri',
    },
    'z0j09h0p': {
      'uk': 'Сб',
      'en': 'Sat',
    },
    'rgwtj8yg': {
      'uk': 'Нд',
      'en': 'Sun',
    },
    '7k7u0wbh': {
      'uk': 'Обрати',
      'en': 'Choose',
    },
  },
  // fertilizationFrequencyPopup
  {
    '2gjwsym5': {
      'uk': 'Підживлення',
      'en': '',
    },
    'enny1sqs': {
      'uk': 'Введіть кількість днів',
      'en': '',
    },
    'hwjkkvyv': {
      'uk': 'Choose',
      'en': '',
    },
  },
  // eventActions
  {
    'tihmeo5t': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
    'hc1mep35': {
      'uk': 'Скасувати',
      'en': 'Cancel',
    },
  },
  // medicationActions
  {
    'd7npv8p2': {
      'uk': 'Видалити',
      'en': 'Delete',
    },
    'm7mwkq2n': {
      'uk': 'Скасувати',
      'en': 'Cancel',
    },
  },
  // switcherHomeShop
  {
    'nu0juiqw': {
      'uk': 'Home',
      'en': 'Home',
    },
    'se12gpd4': {
      'uk': 'Shop',
      'en': 'Shop',
    },
  },
  // StepDescr
  {
    'yj7kcc0a': {
      'uk': 'Hello World',
      'en': '',
    },
  },
  // WalkthroughCarServicePlannerAddEvent
  {
    'mzv0htg2': {
      'uk': 'Давайте створимо першу подію\nНатисніть на \"+\" ',
      'en': '',
    },
  },
  // addPetsPopup
  {
    'qcc2p33j': {
      'uk': 'Назва',
      'en': '',
    },
    'lau1k4gg': {
      'uk': 'День народження',
      'en': '',
    },
    'zz5fp2a8': {
      'uk': 'Вид',
      'en': '',
    },
    'd7kb5grl': {
      'uk': 'Search...',
      'en': '',
    },
    'xio6bb0i': {
      'uk': 'Кіт',
      'en': '',
    },
    '5poufbr0': {
      'uk': 'Пес',
      'en': '',
    },
    'wo86rnq3': {
      'uk': 'Пташка',
      'en': '',
    },
    'f2dsvcr5': {
      'uk': 'Рибка',
      'en': '',
    },
    'kdsr8u8k': {
      'uk': 'Хом\'як',
      'en': '',
    },
    'v0iynbji': {
      'uk': 'Кролик',
      'en': '',
    },
    't5fsem5l': {
      'uk': 'Порода',
      'en': '',
    },
    'kz6s7hn2': {
      'uk': 'Вага (кг)',
      'en': '',
    },
    'irr2jp8h': {
      'uk': 'Оберіть колір улюбленця',
      'en': '',
    },
    '7q4srzhm': {
      'uk': 'Зберегти',
      'en': '',
    },
    '5appvmo5': {
      'uk': 'Скасувати',
      'en': '',
    },
    's20pixxz': {
      'uk': 'Field is required',
      'en': '',
    },
    'zjgji4t2': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5h5e10dh': {
      'uk': 'Field is required',
      'en': '',
    },
    'yrj653oo': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6rlv9a4n': {
      'uk': 'Field is required',
      'en': '',
    },
    '788i7jsl': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wapc0gpu': {
      'uk': 'Field is required',
      'en': '',
    },
    '3bpeih52': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // addPetsEventPopup
  {
    '5re7wy2b': {
      'uk': 'Оберіть тип події',
      'en': '',
    },
    '1iczw8o5': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'y9rdt4od': {
      'uk': 'Регулярна подія',
      'en': '',
    },
    'art4ondh': {
      'uk': 'Одноразова подія',
      'en': '',
    },
    'l9dqi0ho': {
      'uk': 'Оберіть подію',
      'en': '',
    },
    'tfnf5fts': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'n14piiz5': {
      'uk': 'Похід до ветеринара',
      'en': '',
    },
    'vker2l1d': {
      'uk': 'Грумінг',
      'en': '',
    },
    'lxz7q9bx': {
      'uk': 'Шопінг',
      'en': '',
    },
    'qqqe82k9': {
      'uk': 'Вакцинація',
      'en': '',
    },
    'tcaoh5ha': {
      'uk': 'Прийом таблеток',
      'en': '',
    },
    'ew1luopd': {
      'uk': 'Адреса',
      'en': '',
    },
    'gsp0knm7': {
      'uk': 'Лікар',
      'en': '',
    },
    'skzx7by8': {
      'uk': 'Field is required',
      'en': '',
    },
    'muwiqgmu': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2enb0ytz': {
      'uk': 'Field is required',
      'en': '',
    },
    'chzm72x1': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '61912dxp': {
      'uk': 'Адреса',
      'en': '',
    },
    '46h6p9me': {
      'uk': 'Майстер',
      'en': '',
    },
    'i2tlnqaa': {
      'uk': 'Field is required',
      'en': '',
    },
    'h6l05f8e': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qdp4do2m': {
      'uk': 'Field is required',
      'en': '',
    },
    'h74vwbhf': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qkpuwcjl': {
      'uk': 'Field is required',
      'en': '',
    },
    '12w3dlnw': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8dgg7i94': {
      'uk': 'Магазин',
      'en': '',
    },
    'ugink8ql': {
      'uk': 'Товар',
      'en': '',
    },
    'ztnb0zry': {
      'uk': 'Field is required',
      'en': '',
    },
    'gwr7k7ks': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'z4ssh69j': {
      'uk': 'Field is required',
      'en': '',
    },
    'szpylwvr': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fvty9k7x': {
      'uk': 'Field is required',
      'en': '',
    },
    '5t7prm94': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'w8dynh89': {
      'uk': 'Адреса лікарні',
      'en': '',
    },
    'ivy2nshj': {
      'uk': 'Лікар',
      'en': '',
    },
    'hzkw1zmg': {
      'uk': 'Field is required',
      'en': '',
    },
    'j4n03cmy': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v571y7t7': {
      'uk': 'Field is required',
      'en': '',
    },
    'zd20p45f': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0qy3n1sz': {
      'uk': 'Field is required',
      'en': '',
    },
    'xilcc31v': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xkorc210': {
      'uk': 'Препарат',
      'en': '',
    },
    '96wgrxba': {
      'uk': 'Доза',
      'en': '',
    },
    'nwhf1q7b': {
      'uk': 'Select...',
      'en': '',
    },
    '04ctso78': {
      'uk': 'Search...',
      'en': '',
    },
    'u4i5vnfh': {
      'uk': 'Pill',
      'en': '',
    },
    'sqonf09f': {
      'uk': 'Ml',
      'en': '',
    },
    'h30kgu5y': {
      'uk': 'Mg',
      'en': '',
    },
    'healyro9': {
      'uk': 'Field is required',
      'en': '',
    },
    'rq3f4h37': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5j6a7f39': {
      'uk': 'Field is required',
      'en': '',
    },
    'tax2m7wp': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ny9gnleo': {
      'uk': 'Field is required',
      'en': '',
    },
    '6o1m5dln': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'r12ogxrs': {
      'uk': 'Час і дата прийому',
      'en': '',
    },
    '9d2b11cb': {
      'uk': '',
      'en': '',
    },
    '3h2m554b': {
      'uk': '',
      'en': '',
    },
    'yelzls7t': {
      'uk': 'Field is required',
      'en': '',
    },
    'kje65yk9': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jlnjvt53': {
      'uk': 'Повторювати через',
      'en': '',
    },
    '4jz48n7i': {
      'uk': 'Оберіть улюбленця',
      'en': '',
    },
    '9wqqa8yi': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'wpknaugj': {
      'uk': 'день',
      'en': '',
    },
    '5es4xvnp': {
      'uk': 'тиждень',
      'en': '',
    },
    '3aw7zo22': {
      'uk': 'місяць',
      'en': '',
    },
    'f6nd8n8e': {
      'uk': 'рік',
      'en': '',
    },
    'oe5ii45v': {
      'uk': '',
      'en': '',
    },
    'kllayq5o': {
      'uk': 'Field is required',
      'en': '',
    },
    'nwfnpn24': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lro5k15d': {
      'uk': 'Оберіть улюбленця',
      'en': '',
    },
    'zl9dx1c8': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'm3rh6fx2': {
      'uk': 'Зберегти',
      'en': '',
    },
    'i1l3qbhk': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // PetsPageExpandedFloatMenu
  {
    'a1stkqcf': {
      'uk': 'Додати улюбленця',
      'en': 'Add pet',
    },
    'hc1n38ef': {
      'uk': 'Додати час годування ',
      'en': 'Add eat time',
    },
  },
  // EventInfoPopup
  {
    'mp06mbm4': {
      'uk': 'Дата та час',
      'en': '',
    },
    '9a27ryzq': {
      'uk': 'Додаткова інформація',
      'en': '',
    },
    'f93lx5ay': {
      'uk': 'Позначити як виконане',
      'en': '',
    },
    'd5vesfag': {
      'uk': 'Виконано',
      'en': '',
    },
  },
  // PetsEventInfoPopup
  {
    '64z3mry6': {
      'uk': ' ',
      'en': '',
    },
    '09f140c6': {
      'uk': 'Оберіть подію',
      'en': '',
    },
    'xlbg103w': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'ihjs00d8': {
      'uk': 'Похід до ветеринара',
      'en': '',
    },
    'jdsuyfet': {
      'uk': 'Грумінг',
      'en': '',
    },
    'bjiaqp71': {
      'uk': 'Шопінг',
      'en': '',
    },
    'kr3h1ys7': {
      'uk': 'Вакцинація',
      'en': '',
    },
    'n3s3itzr': {
      'uk': 'Прийом таблеток',
      'en': '',
    },
    'jak2bwgd': {
      'uk': 'Адреса',
      'en': '',
    },
    '2s1mkrrv': {
      'uk': 'Лікар',
      'en': '',
    },
    '7be40w63': {
      'uk': 'Field is required',
      'en': '',
    },
    'hcq3asf8': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'byyj1jyr': {
      'uk': 'Field is required',
      'en': '',
    },
    'b0qpex27': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bt0my6py': {
      'uk': 'Field is required',
      'en': '',
    },
    '320fm8nz': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2nx6wb8k': {
      'uk': 'Адреса',
      'en': '',
    },
    'g4fjue2o': {
      'uk': 'Майстер',
      'en': '',
    },
    'sp7dajao': {
      'uk': 'Field is required',
      'en': '',
    },
    '61vcjtrc': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pp7heuju': {
      'uk': 'Field is required',
      'en': '',
    },
    'x7o88tid': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h3aubpov': {
      'uk': 'Field is required',
      'en': '',
    },
    '27m467vx': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'k5j3anol': {
      'uk': 'Магазин',
      'en': '',
    },
    'k60wec0s': {
      'uk': 'Товар',
      'en': '',
    },
    '9au0xyh5': {
      'uk': 'Field is required',
      'en': '',
    },
    '0eybmqmd': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'div6d5r1': {
      'uk': 'Field is required',
      'en': '',
    },
    'fe8gavvj': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nunyxxgo': {
      'uk': 'Field is required',
      'en': '',
    },
    'urpvw63j': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qqnwz2x8': {
      'uk': 'Адреса лікарні',
      'en': '',
    },
    '60affheu': {
      'uk': 'Лікар',
      'en': '',
    },
    'lajl3cls': {
      'uk': 'Field is required',
      'en': '',
    },
    'mcrievg6': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'miwq8oj7': {
      'uk': 'Field is required',
      'en': '',
    },
    'sab8b5e0': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'w8123syl': {
      'uk': 'Field is required',
      'en': '',
    },
    'j9zjqgh3': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pa3q5ghm': {
      'uk': 'Препарат',
      'en': '',
    },
    'wxlntnc5': {
      'uk': 'Доза',
      'en': '',
    },
    '94quhd1u': {
      'uk': 'Select...',
      'en': '',
    },
    'y4ux67xl': {
      'uk': 'Search...',
      'en': '',
    },
    '9prggtqw': {
      'uk': 'Pill',
      'en': '',
    },
    'zxer75eh': {
      'uk': 'Ml',
      'en': '',
    },
    'eocajt00': {
      'uk': 'Mg',
      'en': '',
    },
    '4by5ix0u': {
      'uk': 'Field is required',
      'en': '',
    },
    'ucobcsru': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'zvfn7jw9': {
      'uk': 'Field is required',
      'en': '',
    },
    'o0t3zgry': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wyn58v5x': {
      'uk': 'Field is required',
      'en': '',
    },
    'csd79tbw': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v4kj00xh': {
      'uk': 'Час і дата прийому',
      'en': '',
    },
    '3dzsdyok': {
      'uk': '',
      'en': '',
    },
    'jgudykk4': {
      'uk': '',
      'en': '',
    },
    'lg8tpool': {
      'uk': 'Field is required',
      'en': '',
    },
    'orsojz1r': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7afuejnw': {
      'uk': 'Повторювати через',
      'en': '',
    },
    '8ykg941c': {
      'uk': 'Оберіть улюбленця',
      'en': '',
    },
    'x9dkzwbw': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'x1cfup82': {
      'uk': 'день',
      'en': '',
    },
    'ktx81sy9': {
      'uk': 'тиждень',
      'en': '',
    },
    '2ur60egb': {
      'uk': 'місяць',
      'en': '',
    },
    'jj7c8d57': {
      'uk': 'рік',
      'en': '',
    },
    'a7ecmrqt': {
      'uk': '',
      'en': '',
    },
    'uq6xj9jh': {
      'uk': 'Field is required',
      'en': '',
    },
    'g30eiiod': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vgkd5ecg': {
      'uk': 'Позначити як виконане',
      'en': '',
    },
    'kdbmhfq7': {
      'uk': 'Виконано',
      'en': '',
    },
  },
  // carTodayTaskListComponent
  {
    'ra2ubyeu': {
      'uk': 'Гараж',
      'en': '',
    },
  },
  // plantsTodayTaskComponent
  {
    '404ozjcw': {
      'uk': 'Рослини',
      'en': '',
    },
  },
  // carTaskUpcomingComponent
  {
    'rvkur1o8': {
      'uk': 'Гараж',
      'en': '',
    },
  },
  // plantTasksUpcomingComponent
  {
    '4m95w7xc': {
      'uk': 'Рослини',
      'en': '',
    },
  },
  // healthTaskTodayComponent
  {
    'r8mv1kkn': {
      'uk': 'Здоровʼя',
      'en': '',
    },
  },
  // homeTodayComponent
  {
    'w9s3i166': {
      'uk': 'Дім',
      'en': '',
    },
    '3eintayh': {
      'uk': 'Перегляньте ваші продукти!',
      'en': '',
    },
    '3omls1w2': {
      'uk':
          'У вашому списку присутні продукти з простроченим терміном придатності',
      'en': '',
    },
  },
  // homeUpcomingComponent
  {
    'lcjdt230': {
      'uk': 'Дім',
      'en': '',
    },
    'wx3eiotp': {
      'uk': 'Перегляньте ваші продукти!',
      'en': '',
    },
    'wrgydh5b': {
      'uk':
          'У вашому списку присутні продукти, термін придатності яких закінчується',
      'en': '',
    },
  },
  // healthEventUpcomingComponent
  {
    '7x9tbb2z': {
      'uk': 'Здоровʼя',
      'en': '',
    },
  },
  // petsEventUpcomingComponent
  {
    '93mewj4b': {
      'uk': 'Улюбленці',
      'en': '',
    },
  },
  // sportEventUpcomingComponent
  {
    'g8qlhb4u': {
      'uk': 'Спорт',
      'en': '',
    },
    '9ektut38': {
      'uk': 'Hello World',
      'en': '',
    },
    'u97yhqj5': {
      'uk': 'Hello World',
      'en': '',
    },
  },
  // petsEventTodayComponent
  {
    '4rgumioj': {
      'uk': 'Улюбленці',
      'en': '',
    },
  },
  // sportTodayEventComponent
  {
    'eo97xg4y': {
      'uk': 'Спорт',
      'en': '',
    },
    'cq9tsiyz': {
      'uk': 'Hello World',
      'en': '',
    },
    '0fdmanu5': {
      'uk': 'Hello World',
      'en': '',
    },
  },
  // addNewActivity
  {
    '00wlp3jv': {
      'uk': 'Нова активність',
      'en': 'New Activity',
    },
    '1svqqznm': {
      'uk': 'Назва',
      'en': 'Title',
    },
    'mfmynyi7': {
      'uk': 'Додаткова інформація',
      'en': 'Additional information',
    },
    'lopokvlv': {
      'uk': '',
      'en': '',
    },
    '9xxucpqv': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    'cqav2jn0': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // menuSelectPopup
  {
    '5ig8w7y6': {
      'uk': 'menu',
      'en': '',
    },
    'kwpsscj6': {
      'uk': 'Сніданок',
      'en': 'Breakfast',
    },
    'oceynuyp': {
      'uk': 'Додати страву',
      'en': '',
    },
    '6fm78cam': {
      'uk': 'Обід',
      'en': 'Lunch',
    },
    'clm31nno': {
      'uk': 'Додати страву',
      'en': '',
    },
    'du5ulhd3': {
      'uk': 'Вечеря',
      'en': 'Dinner',
    },
    'nd91mcnq': {
      'uk': 'Додати страву',
      'en': '',
    },
    'y3zbz1tc': {
      'uk': 'Інше',
      'en': 'Other',
    },
    '0n6nmciy': {
      'uk': 'Додати страву',
      'en': '',
    },
  },
  // AddCarFirst
  {
    's37nd98o': {
      'uk': 'Давайте додамо першу машину\nНатисніть на \"+\" ',
      'en': '',
    },
  },
  // CarHistoryguide
  {
    'bjs4r89c': {
      'uk': 'Тут буде відображено всю історію подій',
      'en': '',
    },
  },
  // CarPlannerGuide
  {
    'e6qf91yu': {
      'uk': 'Давайте додамо першу подію',
      'en': '',
    },
  },
  // PlantsAddFirstGuide
  {
    '8vhbb0d1': {
      'uk': 'Давайте додамо першу рослину',
      'en': '',
    },
  },
  // PetsFirstPet
  {
    'wavj9t17': {
      'uk': 'Давайте додамо вашого улюбленця',
      'en': '',
    },
  },
  // PetsHistoryGuide
  {
    'dppi0htj': {
      'uk': 'Тут буде вся історія подій',
      'en': '',
    },
  },
  // PetsPlannerGuide
  {
    'z00c12sx': {
      'uk': 'Давайте додамо першу подію',
      'en': '',
    },
  },
  // SubscriptionOptions
  {
    'tqa9ep4n': {
      'uk': 'Розблокуйте повний доступ',
      'en': '',
    },
    '3r9boloc': {
      'uk':
          'Отримайте доступ до функцій застосунка терміном на 1 місяць або 1 рік. Підтримайте команду розробки.',
      'en': '',
    },
    '3vni1jf2': {
      'uk': 'Monthly Plan',
      'en': '',
    },
    'w71nvpuf': {
      'uk': '\$1 USD',
      'en': '',
    },
    'j1rnhc93': {
      'uk': 'Щомісячно',
      'en': '',
    },
    'zouozkhe': {
      'uk': 'Підписатись на місяць',
      'en': '',
    },
    'k2e9ivmv': {
      'uk': 'Yearly Plan',
      'en': '',
    },
    'lle2olx2': {
      'uk': '\$10 USD',
      'en': '',
    },
    'sh1xjojn': {
      'uk': 'Save 17%',
      'en': '',
    },
    'ndmw645i': {
      'uk': 'Щороку',
      'en': '',
    },
    'xcjpf4en': {
      'uk': 'Підписатись на рік',
      'en': '',
    },
    'c5d8xy3t': {
      'uk': 'Ви можете скасувати підписку у будь-який час',
      'en': '',
    },
  },
  // HubPageFirst
  {
    'uvzt7jw6': {
      'uk':
          'Вітаємо у Хабі. Тут відображені всі обрані Вами модулі у попередньому кроці.',
      'en': '',
    },
  },
  // HomeFirst
  {
    'w20eyxnl': {
      'uk': 'Давайте перейдемо до вашого першого модулю ',
      'en': '',
    },
  },
  // HomeTabs
  {
    'zpesighu': {
      'uk':
          'Модуль містить 3 вкладки - Шопінг(список покупок), Планер та Вдома.',
      'en': '',
    },
  },
  // HomeShopping
  {
    'dvg0wchu': {
      'uk':
          'Список покупок це вкладка де Ви можете формувати список того, що хочете купити на основі запланованих страв та їх інгредієнтів або ж самостійно.',
      'en': '',
    },
  },
  // HomePlannerDescr
  {
    'j89p46to': {
      'uk':
          'Планер - це вкладка, де можна планувати приготування страв по дням. Додавши страву один раз - планувати її кожного разу коли забажаєте і отримувати список покупок базовано на інгредієнтах страви і тих, що є вдома.',
      'en': '',
    },
  },
  // HomeAtHomeDescr
  {
    'k5pw030l': {
      'uk':
          'Вдома - це вкладка, в якій Ви можете відслідковувати продукти які є в наявності для приготувань(вдома :)) \nМожна додавати вручну так само як і вони будуть заповнюватись автоматично після покупок та відміток в Шопінгу.',
      'en': '',
    },
  },
  // HomeAskToAdd
  {
    'pyqpyg7t': {
      'uk': 'Давайте спробуємо додати пару нових страв та запланувати їх.',
      'en': '',
    },
  },
  // CarFirstEnter
  {
    'ydh4lio7': {
      'uk': 'Модуль Гараж містить 3 вкладки - Історія, Планер та Авто.',
      'en': '',
    },
  },
  // CarFirstEnterHistory
  {
    'ipube76a': {
      'uk': 'В Історії зберігаються всі виконані роботи по автомобілю.',
      'en': '',
    },
  },
  // CarFirstEnterPlanner
  {
    'gmvta1je': {
      'uk': 'В Планері можна додати події про які треба нагадати.',
      'en': '',
    },
  },
  // CarFirstEnterCar
  {
    '2t7tulgo': {
      'uk':
          'В Авто можна додати автомобіль, його запчастини та їх стан, аби відслідковувати приблизний стан зношеності відповідно до пробігу.',
      'en': '',
    },
  },
  // PlantFirstEnterPlants
  {
    'e1n7vecl': {
      'uk':
          'Вкладка \"Рослини\" - тут можна додати свої домашні рослини, задати частоту їх поливу.',
      'en': '',
    },
  },
  // PlantsFirstEnterPlaner
  {
    'whyqnv5w': {
      'uk':
          'В \"Планері\" можна побачити перелік тих рослин, що потребують поливу сьогодні або в найближчі дні. ',
      'en': '',
    },
  },
  // HealthFirstEnterDescr
  {
    'h6057sht': {
      'uk': 'Модуль \"Здоровʼя\" містить 3 вкладки - Історія, Планер та Ліки.',
      'en': '',
    },
  },
  // HealthFirstEnterHistory
  {
    '38adw90z': {
      'uk':
          'В Історії можна побачити або додати відвідування лікарів, внести нотатки до візиту та переглянути ліки які приймались раніше.',
      'en': '',
    },
  },
  // HealthFirstEnterPlanner
  {
    'qg5qk35q': {
      'uk':
          'У Планері можна задати бажані візити до лікарів або процедури які треба виконати. Можна зробити повторювані події наприклад \"Відвідати стоматолога з частотою нагадувань 3 міс\"',
      'en': '',
    },
  },
  // HealthFirstEnterMedications
  {
    'bvglt8wa': {
      'uk':
          'У вкладці \"Ліки\" можна додавати прийоми ліків з певною частотою і отримувати нагадування на визначений час. ',
      'en': '',
    },
  },
  // viewActivity
  {
    'kl66acul': {
      'uk': 'Огляд події',
      'en': 'New Activity',
    },
    'ebo8ply0': {
      'uk': 'Назва',
      'en': 'Title',
    },
    'rr315w9g': {
      'uk': 'Додаткова інформація',
      'en': 'Additional information',
    },
    'a5utk2hh': {
      'uk': '',
      'en': '',
    },
    'e9c6smbq': {
      'uk': 'Ок',
      'en': 'Add',
    },
  },
  // PetsFirstEnterPlanner
  {
    'gglsk6qd': {
      'uk':
          'Модуль Улюбленці має 3 вкладки. Історія, Планер та сторінка улюбленця.',
      'en': '',
    },
  },
  // PetsFirstEnterHistory
  {
    'c09dc14l': {
      'uk':
          'В Історії Ви можете знайти події що відбулись, побачити дату, нотатки.',
      'en': '',
    },
  },
  // PetsFirstEnterPet
  {
    'ybsojqwb': {
      'uk':
          'На сторінці Pet Ви можете додати улюбленця, ввести деякі параметри та години годування(поки просто інформативно)',
      'en': '',
    },
  },
  // PetsFirstEnterNavigate
  {
    'q0swkbuc': {
      'uk': 'Пропонуємо перейти у вкладку улюбленця і додати його до списку',
      'en': '',
    },
  },
  // PetsFirstEnterPlanner2
  {
    '7t7i9f71': {
      'uk': 'Планер - місце де показуватимуться додані події.',
      'en': '',
    },
  },
  // PetAddNewPet
  {
    'ps8mwphh': {
      'uk': 'Натисніть + та введіть інформацію про свого друга',
      'en': '',
    },
  },
  // HubPageSwipe
  {
    'qkf8xotk': {
      'uk':
          'Якщо свайпнути вліво то побачите екран, на якому будуть відображатись події на найближчі сім днів. Якщо вправо - події на сьогодні.',
      'en': '',
    },
  },
  // newMedicationPopup
  {
    'frz2hbly': {
      'uk': 'Назва',
      'en': '',
    },
    'xad312wv': {
      'uk': 'Please select...',
      'en': '',
    },
    'kaalkcac': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'cc44969w': {
      'uk': 'Частота споживання',
      'en': '',
    },
    'hk6otuq5': {
      'uk': 'Щодня',
      'en': '',
    },
    's0aao7un': {
      'uk': 'Повторювати через',
      'en': '',
    },
    'dbm0ebc1': {
      'uk': 'Конкретні дні тижня',
      'en': '',
    },
    'q4vqwsvn': {
      'uk': 'Одноразово',
      'en': '',
    },
    'pxal9fef': {
      'uk': 'Кількість днів',
      'en': '',
    },
    'mv3c1hp6': {
      'uk': 'Дата одноразового прийому',
      'en': '',
    },
    'kiqnhe2q': {
      'uk': 'Оберіть необхідні дні',
      'en': '',
    },
    'uyvpm4qx': {
      'uk': 'Пн',
      'en': '',
    },
    'yxpg6uft': {
      'uk': 'Вт',
      'en': '',
    },
    'u0bmxn7r': {
      'uk': 'Ср',
      'en': '',
    },
    'uwmk399g': {
      'uk': 'Чт',
      'en': '',
    },
    'ybaopjkg': {
      'uk': 'Пт',
      'en': '',
    },
    'uy9e7xd0': {
      'uk': 'Сб',
      'en': '',
    },
    'yt0akl57': {
      'uk': 'Нд',
      'en': '',
    },
    'qc0itxy8': {
      'uk': 'Вами не обрано жодного дня',
      'en': '',
    },
    'u6hchaam': {
      'uk': 'Час прийому',
      'en': '',
    },
    'qxq83hhv': {
      'uk': 'Обрані вами години не повинні \nповторюватись',
      'en': '',
    },
    'rscb7vkz': {
      'uk': 'Кількість днів лікування',
      'en': '',
    },
    'y21f8h9x': {
      'uk': 'Доза',
      'en': '',
    },
    'stk219br': {
      'uk': 'Select...',
      'en': '',
    },
    'toee3ijp': {
      'uk': 'Search...',
      'en': '',
    },
    'm3qx2gxa': {
      'uk': 'Табл',
      'en': '',
    },
    'uv5bpehx': {
      'uk': 'Мл',
      'en': '',
    },
    '2jzcr2t8': {
      'uk': 'Мг',
      'en': '',
    },
    'har16712': {
      'uk': 'Надходження сповіщень',
      'en': '',
    },
    'wiqh8b0n': {
      'uk': 'Field is required',
      'en': '',
    },
    'wissevdu': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e69tjyhr': {
      'uk': 'Field is required',
      'en': '',
    },
    'w0zvkpd8': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'czqzq4jl': {
      'uk': 'Field is required',
      'en': '',
    },
    'qmvy7flb': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'g3ln7f2w': {
      'uk': 'Field is required',
      'en': '',
    },
    '4ufiyin5': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qkoofji1': {
      'uk': 'Field is required',
      'en': '',
    },
    'ubrpeuia': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ubxauo3x': {
      'uk': 'Зберегти',
      'en': '',
    },
    'ku4ieipa': {
      'uk': 'Скасувати',
      'en': '',
    },
  },
  // addStorageStuff
  {
    '4pwb9i1q': {
      'uk': '0',
      'en': '',
    },
    'hqynnouo': {
      'uk': '',
      'en': '',
    },
    's56xofhc': {
      'uk': 'Search...',
      'en': '',
    },
    'rgxjkwh0': {
      'uk': 'Їжа',
      'en': '',
    },
    '9535uy1v': {
      'uk': 'Побутове',
      'en': '',
    },
    'iliggb9z': {
      'uk': 'Назва *',
      'en': '',
    },
    'lqx338vm': {
      'uk': 'У вас вже використовується така назва',
      'en': '',
    },
    'cyz95oow': {
      'uk': 'Кількість *',
      'en': '',
    },
    'cpusfghb': {
      'uk': '1',
      'en': '',
    },
    '4c13kr42': {
      'uk': 'Оберіть',
      'en': '',
    },
    't9bnmigx': {
      'uk': 'Search...',
      'en': '',
    },
    'r6zwsiwk': {
      'uk': 'Категорія',
      'en': '',
    },
    '99mtbjni': {
      'uk': 'Спожити до',
      'en': 'Shop name',
    },
    'wfpol1ae': {
      'uk': '* Обов\'язкові поля',
      'en': '',
    },
    'mfu3of61': {
      'uk': 'Зберегти',
      'en': 'Add',
    },
    'z5r1m1rv': {
      'uk': 'Скасувати',
      'en': '',
    },
    '9ihiohjv': {
      'uk': 'Field is required',
      'en': '',
    },
    'k9h3b3aq': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nxkzc8a6': {
      'uk': 'Field is required',
      'en': '',
    },
    'pcofv4ok': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    't8gpmbru': {
      'uk': 'Категорія is required',
      'en': '',
    },
    'njaxhcat': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3rkohdld': {
      'uk': 'Field is required',
      'en': 'Обовʼязкове поле',
    },
    'z0p869cr': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
  },
  // shareShopListForUserPopup
  {
    'pzwwzo3d': {
      'uk': 'Надіслати список',
      'en': '',
    },
    'hgyb8oab': {
      'uk': 'Додати друга',
      'en': '',
    },
    '0dv6ps24': {
      'uk': 'Надіслати',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'b6x1ydwz': {
      'uk': 'Button',
      'en': 'No',
    },
    '2pffxn0y': {
      'uk': 'Hello World',
      'en': 'Set notification time',
    },
    '8nb51qsc': {
      'uk':
          'Для того щоб сфотографувати щось, цей додаток потребує доступ до камери',
      'en':
          'In order to take a picture, this app requires permission to access the camera',
    },
    'zunagtu1': {
      'uk':
          'Для того щоб додати фото, цей додаток потребує доступу до бібліотеки ',
      'en':
          'In order to upload data, this app requires permission to access the photo library',
    },
    '3mx9ufkc': {
      'uk': 'Чи можемо ми відправляти Вам сповіщення ? ',
      'en': 'Can we send you notifications  ?',
    },
    'gvjlt99a': {
      'uk': 'backgroundNotificationPermissions',
      'en': '',
    },
    '3uzxv5p6': {
      'uk': '',
      'en': '',
    },
    'ndigzxwa': {
      'uk': '',
      'en': '',
    },
    'a23098h6': {
      'uk': '',
      'en': '',
    },
    'nsl6tk9p': {
      'uk': '',
      'en': '',
    },
    'ncleswd5': {
      'uk': '',
      'en': '',
    },
    'g3rcisbr': {
      'uk': '',
      'en': '',
    },
    'qgid2via': {
      'uk': '',
      'en': '',
    },
    'gjomxevi': {
      'uk': '',
      'en': '',
    },
    'v40bx200': {
      'uk': '',
      'en': '',
    },
    '939ihfyf': {
      'uk': '',
      'en': '',
    },
    '928gay34': {
      'uk': '',
      'en': '',
    },
    'dno1llnf': {
      'uk': '',
      'en': '',
    },
    'v5pt9a81': {
      'uk': '',
      'en': '',
    },
    '5zxwuhwq': {
      'uk': '',
      'en': '',
    },
    'kh0kdvux': {
      'uk': '',
      'en': '',
    },
    '5qf8xhq2': {
      'uk': '',
      'en': '',
    },
    'rwdibaak': {
      'uk': 'Оберіть джерело',
      'en': 'Choose source',
    },
    '0m88o10m': {
      'uk': 'Галерея',
      'en': 'Gallery',
    },
    '4h5eiitz': {
      'uk': '',
      'en': '',
    },
    'kj7z73w2': {
      'uk': '',
      'en': '',
    },
    '59093hxw': {
      'uk': 'Камера',
      'en': 'Camera',
    },
    'm4klgz4d': {
      'uk': '',
      'en': '',
    },
    'rmn3gpn7': {
      'uk': '',
      'en': '',
    },
    'gv27rhxe': {
      'uk': '',
      'en': '',
    },
    '8i2jwpd2': {
      'uk': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
