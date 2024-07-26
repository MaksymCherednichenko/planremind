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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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
      'uk': 'Рецепти',
      'en': 'Menu',
    },
    'dotf426g': {
      'uk': 'Категорії товарів',
      'en': 'Storage Categories',
    },
    's8i5pqoh': {
      'uk': 'Список магазинів',
      'en': 'Shops',
    },
    'aqiihlos': {
      'uk': 'Друзі',
      'en': 'Friends',
    },
    'r5sk7oja': {
      'uk': 'Modules',
      'en': 'Help Center',
    },
    'wm7q3olv': {
      'uk': 'Одиниці виміру',
      'en': '',
    },
    'm3ynx9bc': {
      'uk': 'Euro',
      'en': 'Euro',
    },
    'vnptuhqz': {
      'uk': 'US',
      'en': 'Select a store',
    },
    '6ihuaggm': {
      'uk': 'Help Center',
      'en': '',
    },
    'x12o8hkx': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // LoginPage
  {
    'fmkm4vpe': {
      'uk': 'Sign in with Google',
      'en': 'Sign in with Google',
    },
    'z0vadp7z': {
      'uk': 'Sign in with Apple',
      'en': 'Sign in with Apple',
    },
    '3krdywht': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HubPage
  {
    'ii3li55q': {
      'uk': 'Home',
      'en': '',
    },
    'wf3zrvcr': {
      'uk': 'Car Service',
      'en': '',
    },
    'gq551s7l': {
      'uk': 'Plants',
      'en': '',
    },
    '0x4mdkzs': {
      'uk': 'Health',
      'en': '',
    },
    '2wabq28u': {
      'uk': 'Pets',
      'en': '',
    },
    'r4bs96wt': {
      'uk': 'Sport',
      'en': '',
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
      'en': 'Shopping',
    },
    '2uxti7t7': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'xlw47m23': {
      'uk': 'Storage',
      'en': 'Storage',
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
    'fqvk97u3': {
      'uk': 'Виходить термін',
      'en': 'Upcoming',
    },
    'ormc4x80': {
      'uk': 'Home',
      'en': 'Home',
    },
    'mzsui0x9': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // AddMealForPlannerPage
  {
    '9oijar81': {
      'uk': 'Додати страву',
      'en': 'Add a meal',
    },
    'p4a6hhem': {
      'uk': 'Button',
      'en': 'Button',
    },
    'pzx0q4ri': {
      'uk': 'Назва',
      'en': 'Name',
    },
    'vghxvaz0': {
      'uk': 'Інгредієнт',
      'en': 'Ingredient',
    },
    '25cuicol': {
      'uk': 'Проміжок дат',
      'en': 'Date range',
    },
    'ldkeap1b': {
      'uk': 'Сніданок',
      'en': 'Breakfast',
    },
    'dgefvyj2': {
      'uk': 'Обід',
      'en': 'Lunch',
    },
    'lez9arqj': {
      'uk': 'Вечеря',
      'en': 'Dinner',
    },
    'f0x4u85m': {
      'uk': 'Інше',
      'en': 'Other',
    },
    '2nqq997t': {
      'uk': 'Додати рецепт',
      'en': 'Add a recipe',
    },
    'kc9tfw40': {
      'uk': 'Додати',
      'en': 'Add',
    },
    '9b14ehge': {
      'uk': 'Please enter a name',
      'en': 'Будь ласка введіть назву',
    },
    'lb4r3r62': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Будь ласка оберіть варіант зі списку',
    },
    'hkowi7u3': {
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
  // HomeShoppingActual
  {
    't63gma71': {
      'uk': 'Shopping',
      'en': 'Shopping',
    },
    '1z01i2jb': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'j2e8qmsz': {
      'uk': 'Storage',
      'en': 'Storage',
    },
    'wdwvnmuq': {
      'uk': 'Поточний список',
      'en': 'Actual',
    },
    'aixiys2i': {
      'uk': 'Історія',
      'en': 'History',
    },
    'k4i5ux94': {
      'uk': 'Сортувати по категоріям',
      'en': 'Sort by categories',
    },
    'm3y37i0j': {
      'uk': 'Все',
      'en': 'All',
    },
    'ctgd4508': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    'eaz5e3eb': {
      'uk': 'Побутове',
      'en': 'Household',
    },
    'v6pckmv2': {
      'uk': 'Сортувати по магазинам',
      'en': 'Sort by stores',
    },
    'm62wgjbg': {
      'uk': 'В історію',
      'en': 'Move to history',
    },
    'fdoo8lpk': {
      'uk': 'Вибрати все',
      'en': 'Select all',
    },
    '1t126lbs': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // Settings_Notifications
  {
    'cgik6w8b': {
      'uk': 'Notifications',
      'en': 'Сповіщення',
    },
    'bu0u7yza': {
      'uk': 'Option 1',
      'en': 'Option 1',
    },
    '9lawvclt': {
      'uk': 'Home',
      'en': 'Home',
    },
    'yt24jwsl': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '4wg4r2no': {
      'uk': 'Set notification time',
      'en': 'Обрати',
    },
    'vvzp9nru': {
      'uk': 'Settings',
      'en': 'Налаштування',
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
    'v7jqtrvi': {
      'uk': '',
      'en': '',
    },
    'ux008bwm': {
      'uk': 'Додати категорію',
      'en': 'New category...',
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
      'uk': 'Food',
      'en': 'Їжа',
    },
    'inbtnljl': {
      'uk': 'Household',
      'en': 'Побутові',
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
      'en': 'Їжа',
    },
    'eu821lyn': {
      'uk': 'Household',
      'en': 'Побутові',
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
      'uk': 'FAQs',
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
    'uhetf1um': {
      'uk': 'Я не розумію як користуватись застосунком.',
      'en': 'I don\'t understand how to use the application.',
    },
    '5fzz11qw': {
      'uk':
          'Ми записали інструкції по користуванню застосунком в нашому інстаграм та телеграм каналі. Нижче є посилання на них.',
      'en':
          'We have recorded instructions for using the application on our Instagram and Telegram channel. Above are the lnks on them.',
    },
    'kf0yu637': {
      'uk': 'Contact Support',
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
      'uk': 'About App',
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
    'w6qjm06n': {
      'uk': 'Tutorials',
      'en': 'Tutorials',
    },
    '95htra8c': {
      'uk': 'Tutorials',
      'en': '',
    },
    'faitvbj8': {
      'uk': 'Видалити обліковий запис',
      'en': 'Remove account',
    },
    '0d2npccs': {
      'uk': 'Налаштування',
      'en': 'Settings',
    },
  },
  // SettingsShops
  {
    'd75dhpfi': {
      'uk': 'Налаштування',
      'en': 'Settings',
    },
    '7qiz0h7d': {
      'uk': 'Shops',
      'en': 'Список магазинів',
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
  // Menu
  {
    '3gu498bx': {
      'uk': 'Меню',
      'en': 'Menu',
    },
    'ipx53x5c': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // CreateItemInMenu
  {
    'soukpnst': {
      'uk': 'Додати нову страву',
      'en': 'Add a new meal',
    },
    'h8za9l3f': {
      'uk': 'Назва',
      'en': 'Name',
    },
    '6wjk3bms': {
      'uk': 'Інгредієнт',
      'en': 'Ingredient',
    },
    'bduo0ju1': {
      'uk': 'Додати рецепт',
      'en': 'Add a recipe',
    },
    '7ai47qpu': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'z3nm8kzw': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    'tal5pzm2': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pcv9t3yp': {
      'uk': 'Меню',
      'en': 'Menu',
    },
    'zq9kyzus': {
      'uk': 'Button',
      'en': 'Button',
    },
    'yi02sgog': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // MenuAddToPlan
  {
    'ypgknqj2': {
      'uk': 'Ingridient',
      'en': 'Інгрідієнт',
    },
    '7mpd2klg': {
      'uk': 'Рецепт',
      'en': 'Recipe',
    },
    '3uwn55vj': {
      'uk': 'Add to plan',
      'en': 'Додати до плану',
    },
    'kptsxgdy': {
      'uk': 'Меню',
      'en': 'Menu',
    },
    'ltdvl5jj': {
      'uk': 'Button',
      'en': 'Button',
    },
    'oqixzrgs': {
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
    'i2jxcrb1': {
      'uk': '',
      'en': '',
    },
    'duxjve90': {
      'uk': 'Додати категорію',
      'en': 'New category...',
    },
    '6thosw0o': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // HomeCategories
  {
    'kyrfm3yn': {
      'uk': 'Kitchen',
      'en': 'Kitchen',
    },
    'yb70sw9r': {
      'uk': 'Birthdays',
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
      'uk': 'Upcoming',
      'en': 'Найближчі дні народження',
    },
    'wmcckhso': {
      'uk': 'Birthdays',
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
    'l7weqcz4': {
      'uk': 'Ваше ім\'я:',
      'en': 'Your name:',
    },
    'scnjmv68': {
      'uk': 'Поділитися своїм обліковим записом з другом',
      'en': 'Share your account with a friend',
    },
    'qon919zz': {
      'uk': 'Додати друга',
      'en': 'Add friend',
    },
    'ibcabmde': {
      'uk': 'Мої друзі',
      'en': 'My friends',
    },
    'sh4s7ega': {
      'uk': 'Друзі',
      'en': 'Friends',
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
    'sgdpqk3z': {
      'uk': 'Автосервіс',
      'en': 'Vehicle service',
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
      'uk': 'Information',
      'en': '',
    },
    'i90izz9d': {
      'uk': 'На обрану дату немає подій',
      'en': '',
    },
    'cnynrq5m': {
      'uk': 'Заплановані події',
      'en': '',
    },
    'b6x1ydwz': {
      'uk': 'Button',
      'en': 'No',
    },
    'tu55ca6z': {
      'uk': 'Home',
      'en': 'Home',
    },
  },
  // CarServiceHistoryPage
  {
    '36brf3kb': {
      'uk': 'History',
      'en': 'History',
    },
    'jobe2x3d': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'g8jn0hs3': {
      'uk': 'Information',
      'en': 'Information',
    },
    'f1u84pij': {
      'uk': 'Автосервіс',
      'en': 'Vehicle service',
    },
    'pel2t2a0': {
      'uk': 'Home',
      'en': '',
    },
  },
  // CarServiceInformationPage
  {
    'twf4runv': {
      'uk': 'History',
      'en': 'History',
    },
    'c47mvbkx': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    't8f8sfmm': {
      'uk': 'Information',
      'en': 'Information',
    },
    'qawrkgv4': {
      'uk': 'Моя машина',
      'en': 'My car',
    },
    'j9t5z0gk': {
      'uk': 'Запчастини',
      'en': 'Spare parts',
    },
    'a0cxb4ln': {
      'uk': 'Автосервіс',
      'en': 'Vehicle service',
    },
    'r5ugbrcb': {
      'uk': 'Home',
      'en': '',
    },
  },
  // MyCarPage
  {
    'eqnj6cdl': {
      'uk': 'Моя машина',
      'en': 'My car',
    },
    'oru4pvt2': {
      'uk': ' рік випуску',
      'en': '',
    },
    'p26mausp': {
      'uk': 'VIN code',
      'en': 'VIN code',
    },
    'c9q9o1mb': {
      'uk': 'Mileage',
      'en': '',
    },
    'owdm7yba': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    '6hqiwq1w': {
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
    'bb25ymrm': {
      'uk': 'My plants',
      'en': 'My plants',
    },
    'rbyay931': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    'kb22etia': {
      'uk': 'Заплановані події',
      'en': 'Upcoming',
    },
    'j5zx4wot': {
      'uk': 'Рослини',
      'en': 'Plants',
    },
    '2zf5062w': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthPlannerPage
  {
    'cz14pkeq': {
      'uk': 'History',
      'en': '',
    },
    '9tzn45qn': {
      'uk': 'Planner',
      'en': '',
    },
    'fn7dv4m6': {
      'uk': 'Information',
      'en': '',
    },
    'cnynrq5m': {
      'uk': 'Заплановані події',
      'en': '',
    },
    'ols081o9': {
      'uk': 'Здоров\'я',
      'en': 'Health',
    },
    'toqfag5z': {
      'uk': 'Home',
      'en': '',
    },
  },
  // PetsPlannerPage
  {
    'iv5pd1u3': {
      'uk': 'History',
      'en': '',
    },
    'xawnto2m': {
      'uk': 'Planner',
      'en': '',
    },
    'vtogz4fo': {
      'uk': 'Information',
      'en': '',
    },
    'xzp7f4u8': {
      'uk': 'Заплановані події',
      'en': '',
    },
    'xwllt4gb': {
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
    'b0mcl9ix': {
      'uk': 'Information',
      'en': '',
    },
    '86g9g8nj': {
      'uk': 'Заплановані події',
      'en': '',
    },
    '8y4xscor': {
      'uk': 'Sports',
      'en': '',
    },
    'pkgctbvk': {
      'uk': 'Home',
      'en': '',
    },
  },
  // MyPlantsPageGrid
  {
    't4eb7djb': {
      'uk': 'My plants',
      'en': 'My plants',
    },
    'pigmnprn': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    '31nmn6id': {
      'uk': 'Рослини',
      'en': 'Plants',
    },
    'n77zompm': {
      'uk': 'Home',
      'en': '',
    },
  },
  // MyPlantsPageList
  {
    'mvc1sw9x': {
      'uk': 'My plants',
      'en': 'My plants',
    },
    '7v6o0ezx': {
      'uk': 'Planner',
      'en': 'Planner',
    },
    '66750enz': {
      'uk': 'Рослини',
      'en': 'Plants',
    },
    'yf55bmnn': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthHistoryPage
  {
    '0ytv7o1f': {
      'uk': 'History',
      'en': '',
    },
    '9iys252w': {
      'uk': 'Planner',
      'en': '',
    },
    'ygt58vv5': {
      'uk': 'Information',
      'en': '',
    },
    'ltjczawv': {
      'uk': 'Hello World',
      'en': '',
    },
    'qprac007': {
      'uk': 'Hello World',
      'en': '',
    },
    'd3vf3hrq': {
      'uk': 'Hello World',
      'en': '',
    },
    '7cln47t1': {
      'uk': 'Здоров\'я',
      'en': '',
    },
    '84tug3kc': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HealthInformationPage
  {
    'e5x7f20u': {
      'uk': 'History',
      'en': '',
    },
    'jr15kz27': {
      'uk': 'Planner',
      'en': '',
    },
    'j9eppe54': {
      'uk': 'Information',
      'en': '',
    },
    'ilqlbi9p': {
      'uk': 'Моя медична карта',
      'en': 'My medical card',
    },
    'ywnfmky2': {
      'uk': '',
      'en': '',
    },
    '9ct43s2m': {
      'uk': 'Мої ліки',
      'en': '',
    },
    'thjyih1r': {
      'uk': '',
      'en': '',
    },
    '01yqzd3x': {
      'uk': 'Здоров\'я',
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
      'uk': 'Modules',
      'en': '',
    },
    'wwpn6oqg': {
      'uk': 'Home',
      'en': '',
    },
    'w61ibmzz': {
      'uk': 'Car',
      'en': '',
    },
    '3sktvdg4': {
      'uk': 'Plants',
      'en': '',
    },
    '2b0o1674': {
      'uk': 'Health',
      'en': '',
    },
    'yhy9h8la': {
      'uk': 'Pets',
      'en': '',
    },
    'irgzrda4': {
      'uk': 'Sport',
      'en': '',
    },
    'rfykjd8z': {
      'uk': 'Налаштування',
      'en': '',
    },
    'n11pqh5i': {
      'uk': 'Home',
      'en': '',
    },
  },
  // HomeShoppingActualCopy
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
    'gzhtxnft': {
      'uk': 'В історію',
      'en': '',
    },
    'b72tksvn': {
      'uk': 'Вибрати все',
      'en': '',
    },
    'ii3li55q': {
      'uk': 'Home',
      'en': '',
    },
  },
  // Calendar_popup
  {
    'nifdpk9b': {
      'uk': 'Choose a date',
      'en': 'Оберіть дату',
    },
    'qt439pau': {
      'uk': 'Choose',
      'en': 'Обрати',
    },
  },
  // addingridientspopup
  {
    'avhahze2': {
      'uk': 'Додати інгредієнти',
      'en': 'Add ingridients',
    },
    'q56fk39m': {
      'uk': 'Назва',
      'en': 'Name',
    },
    '99weeg34': {
      'uk': 'Маю це вдома',
      'en': 'I have it at home',
    },
    'g488qv0n': {
      'uk': 'Додати',
      'en': 'Add',
    },
    '56l6ewt4': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    '2qxfi55v': {
      'uk': 'Field is required',
      'en': 'Обовʼязкове поле',
    },
    '5wzxvh1m': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
  },
  // MST2
  {
    '66iy46vm': {
      'uk':
          'Sorry, but currently this module is under development. It is going to be available soon. Stay tuned!',
      'en':
          'Вибачте, але наразі цей модуль у розробці. Він дуже скоро буде доступний для користування. Слідкуйте за новинами! ',
    },
    '68t3eh4i': {
      'uk': 'Go back',
      'en': 'Назад',
    },
  },
  // AddItemStorageFood
  {
    '5k8bilzj': {
      'uk': 'Add Item',
      'en': 'Додати',
    },
    'o52nu8ma': {
      'uk': '',
      'en': '',
    },
    'm5mrp35b': {
      'uk': 'Category',
      'en': 'Категорія',
    },
    '766fe0ao': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'ahykxczv': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'h72iauws': {
      'uk': 'Add',
      'en': 'Додати',
    },
    'x3kgmpuy': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    'txhv6ekr': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
    'osyyt98t': {
      'uk': 'Field is required',
      'en': 'Обовʼязкове поле',
    },
    'ros4ntfa': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
  },
  // editingridientspopup
  {
    'eorckk0k': {
      'uk': 'Редагування',
      'en': 'Edit ingridient',
    },
    'ti5ic8ic': {
      'uk': 'Name',
      'en': 'Назва',
    },
    '5eh02cc8': {
      'uk': 'Маю це вдома',
      'en': 'I have it at home',
    },
    '9jolfibk': {
      'uk': 'Зберегти',
      'en': 'Save',
    },
    'ttr784yp': {
      'uk': 'Видалити',
      'en': 'Delete',
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
    'mlq1lemq': {
      'uk': 'Add item',
      'en': 'Додати',
    },
    '3uvss4ji': {
      'uk': 'Виберіть категорію (обов\'язково)',
      'en': 'Choose category (required)',
    },
    'atmucw4o': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    'qg0w4nb1': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'n9omhaoc': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'jrlmymk2': {
      'uk': 'Назва магазину',
      'en': 'Shop name',
    },
    'zhycvxat': {
      'uk': 'Додати',
      'en': 'Add',
    },
    'qriytoz1': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    'ppeussnb': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
    },
    'kn5uex3e': {
      'uk': 'Field is required',
      'en': 'Обовʼязкове поле',
    },
    'b33ols0c': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Оберіть опцію зі списку',
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
  // editingridientspopupShopping
  {
    '4mdgsiq6': {
      'uk': 'Edit item',
      'en': 'Редагування',
    },
    '0h31jphx': {
      'uk': 'Виберіть категорію (обов\'язково)',
      'en': 'Choose category (required)',
    },
    'ggme409s': {
      'uk': 'Їжа',
      'en': 'Food',
    },
    '2s6n5x1f': {
      'uk': 'Побутові',
      'en': 'Household',
    },
    'fe4k9c8v': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'a91artj7': {
      'uk': 'Shop name',
      'en': 'Назва магазину',
    },
    '8shfq9za': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    'xugw4jjd': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
  },
  // deleteOrAddToShoppingList
  {
    'oo6sx37j': {
      'uk': 'Додати до списку покупок чи видалити?',
      'en': 'Add to shopping list or remove?',
    },
    '5a21wms2': {
      'uk': 'Add to list',
      'en': 'До списку',
    },
    'cwmhipz1': {
      'uk': 'Remove',
      'en': 'Видалити',
    },
  },
  // editItemStorageFood
  {
    'dglcnn9m': {
      'uk': 'Edit Item',
      'en': 'Редагування',
    },
    's6f7vn6m': {
      'uk': 'Category',
      'en': 'Категорія',
    },
    '2blgmbry': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '64t722l3': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'jgc8h2vb': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    'pgjbz0tx': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
    'dskcc5x7': {
      'uk': 'Введіть назву',
      'en': '',
    },
    'mjj4ys1v': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ax1bo7g5': {
      'uk': 'Field is required',
      'en': '',
    },
    '5hhqrbub': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // AddItemHousehold
  {
    'w20g3btr': {
      'uk': 'Add Item',
      'en': 'Додати',
    },
    'm05sntdr': {
      'uk': '',
      'en': '',
    },
    'dtmrc0cg': {
      'uk': 'Category',
      'en': 'Категорія',
    },
    'iwky96rl': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '5zhf0k0n': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'xu6vuxzq': {
      'uk': 'Add',
      'en': 'Додати',
    },
    'le9phul3': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    'x1vm86ch': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8j9p2wyi': {
      'uk': 'Field is required',
      'en': 'Field is required',
    },
    'peiivbzn': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // editItemHousehold
  {
    'b4g1jhdg': {
      'uk': 'Edit Item',
      'en': 'Редагувати',
    },
    'g1djl29i': {
      'uk': 'Category',
      'en': 'Категорія',
    },
    '5y9j8u3s': {
      'uk': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'imwol8nc': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'v62ipaar': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    '4wpo2wsd': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
    '7q5u8o8i': {
      'uk': 'Введіть назву',
      'en': '',
    },
    'fk6vf1mo': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '318cmude': {
      'uk': 'Field is required',
      'en': '',
    },
    '44csp5qe': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
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
      'uk': 'Edit Category',
      'en': 'Редагування',
    },
    '9h6ww385': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'smy1660v': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    '2iqzk95b': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
  },
  // EditShop
  {
    'ikrnvozy': {
      'uk': 'Edit Shop',
      'en': 'Редагувати',
    },
    '4aav85gm': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'pafhsuyi': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    'v0eus9vp': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
  },
  // editingridientspopupMenu
  {
    '2egjgcni': {
      'uk': 'Редагувати',
      'en': 'Edit ingridient',
    },
    'aqh32xk2': {
      'uk': 'Name',
      'en': 'Назва',
    },
    'suwx5810': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    '9q0emc6f': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
  },
  // addMenuToPlanPopup
  {
    'vshdl7tr': {
      'uk': 'Проміжок дат',
      'en': 'Date range',
    },
    'shl6gc0k': {
      'uk': 'Сніданок',
      'en': 'Breakfast',
    },
    'amak5n4u': {
      'uk': 'Обід',
      'en': 'Lunch',
    },
    'nfzpiijv': {
      'uk': 'Вечеря',
      'en': 'Dinner',
    },
    'f8qmjixs': {
      'uk': 'Інше',
      'en': 'Other',
    },
    'yileuecv': {
      'uk': 'Додати',
      'en': 'Add',
    },
  },
  // EditCategoryHousehold
  {
    'ufjok3cw': {
      'uk': 'Edit Category',
      'en': 'Редагувати',
    },
    'k34ja92m': {
      'uk': 'Name',
      'en': 'Навза',
    },
    'ncg0dyvh': {
      'uk': 'Save',
      'en': 'Зберегти',
    },
    'g3u98kbj': {
      'uk': 'Delete',
      'en': 'Видалити',
    },
  },
  // deleteHistory
  {
    '5n2qe8q1': {
      'uk': 'Ви впевнені, що хочете видалити?',
      'en': 'Are you sure that you want to delete?',
    },
    '3yu0u5zp': {
      'uk': 'Yes',
      'en': 'Так',
    },
    'k3tri10l': {
      'uk': 'No',
      'en': 'Ні',
    },
  },
  // totalSum
  {
    'zlrvi890': {
      'uk': 'Загальна сума',
      'en': 'Total sum',
    },
  },
  // addingridientspopupMenu
  {
    '1l91d4ca': {
      'uk': 'Додати інгредієнт',
      'en': 'Add ingridients',
    },
    'kk324goy': {
      'uk': 'Назва',
      'en': 'Name',
    },
    '0mpkdkhw': {
      'uk': 'Додати',
      'en': 'Add',
    },
    '93n6hfgr': {
      'uk': 'Please enter a name',
      'en': 'Введіть назву',
    },
    'v7qzgr8o': {
      'uk': 'Field is required',
      'en': 'Field is required',
    },
    'yhse1odq': {
      'uk': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // setNotificationPopup
  {
    '2pffxn0y': {
      'uk': 'Set notification time',
      'en': 'Set notification time',
    },
    'kmfyv7bv': {
      'uk': 'Set notification time',
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
      'uk': 'Name',
      'en': 'Імʼя',
    },
    'zuj1zuad': {
      'uk': 'Add',
      'en': 'Додати',
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
      'en': 'Зберегти',
    },
    '6t2bm3am': {
      'uk': 'Видалити',
      'en': 'Видалити',
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
  // deleteAccount
  {
    'q9bt0wrb': {
      'uk': 'Ви впевнені, що хочете видалити?',
      'en': 'Ви впевнені, що хочете видалити ?',
    },
    'iuvnb3c3': {
      'uk': 'Yes',
      'en': 'Так',
    },
    '8ba5obb1': {
      'uk': 'No',
      'en': 'Ні',
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
  // notFieldCategory
  {
    'xnfx9cnh': {
      'uk': 'Категорія не вибрана',
      'en': 'Category not selected',
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
  // shareShopingListTo
  {
    'wfiz4n9e': {
      'uk': 'Поділитися',
      'en': 'Share',
    },
    '7tsu3xv3': {
      'uk': 'Відправити',
      'en': 'Send',
    },
  },
  // addServiceTaskPopup
  {
    'vz65ah4p': {
      'uk': 'Новий запис',
      'en': '',
    },
    'ei8i5o0y': {
      'uk': 'Назва',
      'en': 'Title',
    },
    'lty5p5cb': {
      'uk': 'Місце',
      'en': 'Place',
    },
    'ckaqzxra': {
      'uk': 'Опис',
      'en': 'Description',
    },
    'hjt93poi': {
      'uk': 'Дата',
      'en': '',
    },
    'wd9p8248': {
      'uk': 'Додати',
      'en': '',
    },
    'pahk93dx': {
      'uk': 'Field is required',
      'en': '',
    },
    '3ifdcnd5': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dz072gm7': {
      'uk': 'Field is required',
      'en': '',
    },
    'dgbmyhhw': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4s2x40ay': {
      'uk': 'Field is required',
      'en': '',
    },
    'j84jtqpm': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // serviceTaskInfoPopup
  {
    'ks71qmem': {
      'uk': 'Місце',
      'en': 'Place',
    },
    'gnwkay1q': {
      'uk': 'Опис',
      'en': 'Description',
    },
    'z8n60pm0': {
      'uk': 'Дата',
      'en': '',
    },
    'm8zb8s8l': {
      'uk': 'Видалити',
      'en': '',
    },
  },
  // addCarPopup
  {
    'irsu59v7': {
      'uk': 'Додати новий автомобіль',
      'en': 'Add new car',
    },
    '3yqy939i': {
      'uk': 'Car brand',
      'en': 'Car brand',
    },
    'cd54u1vv': {
      'uk': 'Model',
      'en': 'Model',
    },
    '1ysfk5iu': {
      'uk': 'Model year',
      'en': 'Model year',
    },
    '3jqwa39u': {
      'uk': 'VIN code',
      'en': 'VIN code',
    },
    '9nrmte7t': {
      'uk': 'Mileage',
      'en': '',
    },
    '7xkc6vrz': {
      'uk': 'Додати',
      'en': 'Add',
    },
    'knb62h8n': {
      'uk': 'Field is required',
      'en': '',
    },
    '8ve9hep4': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yygt9hq0': {
      'uk': 'Field is required',
      'en': '',
    },
    'e0si4rz1': {
      'uk': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vlcp7mij': {
      'uk': 'Field is required',
      'en': '',
    },
    '418iggit': {
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
  },
  // carSparePartMileage
  {
    'nqnby8he': {
      'uk': 'Заміна',
      'en': '',
    },
    '55qf5czo': {
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
    'wbojl1sf': {
      'uk': 'Пробіг авто при встановленні',
      'en': '',
    },
    'nw28tlal': {
      'uk': 'Пробіг на заміну',
      'en': '',
    },
    'hjv03mcl': {
      'uk': 'Додати',
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
  // chooseCarPopup
  {
    'z4i7qj3r': {
      'uk': 'Виберіть автомобіль',
      'en': 'Choose the car',
    },
    'tl50ndyp': {
      'uk': 'Продовжити',
      'en': 'No',
    },
  },
  // addNewPlantPopup
  {
    '6imvsrea': {
      'uk': 'Додайте нову рослину',
      'en': 'Add new plant',
    },
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
    'h1t9gnxc': {
      'uk': '',
      'en': '',
    },
    'zuuyt48x': {
      'uk': '',
      'en': '',
    },
    'mnm39lje': {
      'uk': '',
      'en': '',
    },
    'tqruerss': {
      'uk': 'Додати',
      'en': 'Add',
    },
    'vug32xsy': {
      'uk': 'Кожен день',
      'en': 'Every day',
    },
    'vuxtw3u0': {
      'uk': 'Кожні два дні',
      'en': 'Every two days',
    },
    't7jjfaha': {
      'uk': 'Двічі на тиждень',
      'en': 'Twice a week',
    },
    'qetrsvvq': {
      'uk': 'Раз на тиждень',
      'en': 'Once a week',
    },
    'akkljpsh': {
      'uk': 'Пряме яскраве світло',
      'en': '',
    },
    'u3tme48e': {
      'uk': 'Яскраве розсіяне світло',
      'en': '',
    },
    'x8a7j84q': {
      'uk': 'Розсіяне світло',
      'en': '',
    },
    'd9q7c8do': {
      'uk': 'Тінь',
      'en': '',
    },
    'vplp3m4r': {
      'uk': '20-25°C',
      'en': '',
    },
    'reec4l9p': {
      'uk': '18-20°C',
      'en': '',
    },
    'ipp1535o': {
      'uk': '15-18°C',
      'en': '',
    },
    '2o58tdah': {
      'uk': '10-15°C',
      'en': '',
    },
  },
  // newEventPopup
  {
    '90wg3b7g': {
      'uk': 'Нова подія',
      'en': 'New event',
    },
    'f5v8719l': {
      'uk': 'Назва',
      'en': '',
    },
    'g2ig1vwt': {
      'uk': 'Додаткова інформація',
      'en': '',
    },
    'qqqigaa1': {
      'uk': '',
      'en': '',
    },
    '56yvuxku': {
      'uk': '1',
      'en': '',
    },
    'rotm90a2': {
      'uk': '2',
      'en': '',
    },
    '5lsj6g8f': {
      'uk': '3',
      'en': '',
    },
    '6b7ymrfj': {
      'uk': '4',
      'en': '',
    },
    'apy9vcsv': {
      'uk': '5',
      'en': '',
    },
    'ighcy6s5': {
      'uk': '6',
      'en': '',
    },
    'czy34qgu': {
      'uk': '7',
      'en': '',
    },
    'av7t2l7m': {
      'uk': '8',
      'en': '',
    },
    'mcwv8fk8': {
      'uk': '9',
      'en': '',
    },
    'b2gionnd': {
      'uk': '10',
      'en': '',
    },
    '82g2hpl1': {
      'uk': '11',
      'en': '',
    },
    'gp9tcylz': {
      'uk': '12',
      'en': '',
    },
    '7xezcx4u': {
      'uk': '13',
      'en': '',
    },
    'p6mrylf0': {
      'uk': '14',
      'en': '',
    },
    'ji1t44wb': {
      'uk': '15',
      'en': '',
    },
    'ij0z6drc': {
      'uk': '16',
      'en': '',
    },
    'kiok14jk': {
      'uk': '17',
      'en': '',
    },
    'fqlhmooa': {
      'uk': '18',
      'en': '',
    },
    'qgp8wlxx': {
      'uk': '19',
      'en': '',
    },
    '57p38v9z': {
      'uk': '20',
      'en': '',
    },
    'ixsp2nka': {
      'uk': '21',
      'en': '',
    },
    'ftjtj40a': {
      'uk': '22',
      'en': '',
    },
    'h70yiqhm': {
      'uk': '23',
      'en': '',
    },
    'x113seec': {
      'uk': '24',
      'en': '',
    },
    'gjm4e7dl': {
      'uk': '25',
      'en': '',
    },
    'fwtw85hy': {
      'uk': '26',
      'en': '',
    },
    '2jlcu6a3': {
      'uk': '27',
      'en': '',
    },
    'i7zqorbi': {
      'uk': '28',
      'en': '',
    },
    'l1agxqt7': {
      'uk': '29',
      'en': '',
    },
    'uu3iuz1b': {
      'uk': '30',
      'en': '',
    },
    'bpml10fs': {
      'uk': '31',
      'en': '',
    },
    'd8jzv21h': {
      'uk': 'День',
      'en': '',
    },
    '8vdtkb5p': {
      'uk': '',
      'en': '',
    },
    'zqyhazl3': {
      'uk': '1',
      'en': '',
    },
    'ures7hh4': {
      'uk': '2',
      'en': '',
    },
    '4cy6kjiv': {
      'uk': '3',
      'en': '',
    },
    'fguklyl1': {
      'uk': '4',
      'en': '',
    },
    'z7jh3o0l': {
      'uk': '5',
      'en': '',
    },
    '518m7jao': {
      'uk': '6',
      'en': '',
    },
    'onzlizm3': {
      'uk': '7',
      'en': '',
    },
    '441fa6um': {
      'uk': '8',
      'en': '',
    },
    'n962qlit': {
      'uk': '9',
      'en': '',
    },
    '9j0ifp1b': {
      'uk': '10',
      'en': '',
    },
    'seuwgdj3': {
      'uk': '11',
      'en': '',
    },
    'r3jtbsjz': {
      'uk': '12',
      'en': '',
    },
    'qxoyts81': {
      'uk': 'Місяць',
      'en': '',
    },
    'aj5yooqz': {
      'uk': 'Search for an item...',
      'en': '',
    },
    'vecyetgm': {
      'uk': '2020',
      'en': '',
    },
    'a0zap7vz': {
      'uk': '2021',
      'en': '',
    },
    '753ndceg': {
      'uk': '2022',
      'en': '',
    },
    'o5gkuawv': {
      'uk': '2023',
      'en': '',
    },
    '87hplv5c': {
      'uk': '2024',
      'en': '',
    },
    '0600m2k4': {
      'uk': '2025',
      'en': '',
    },
    'x4vpj6om': {
      'uk': 'Рік',
      'en': '',
    },
    'aeudgs1o': {
      'uk': 'Search for an item...',
      'en': '',
    },
    '8ynlfv48': {
      'uk': '',
      'en': '',
    },
    'x3z47lez': {
      'uk': 'Час',
      'en': 'Time',
    },
    'olv1uxoh': {
      'uk': 'Додати',
      'en': 'Add',
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
  // editPlantPopup
  {
    'ty0e1h4h': {
      'uk': 'Відредагуйте рослину',
      'en': '',
    },
    'xzvjzj6t': {
      'uk': 'Назва',
      'en': '',
    },
    'vltyqyh2': {
      'uk': 'Кількість води',
      'en': '',
    },
    'jya35bl1': {
      'uk': '',
      'en': '',
    },
    'lb20beie': {
      'uk': '',
      'en': '',
    },
    'dwztl1sx': {
      'uk': '',
      'en': '',
    },
    'bw5jki8h': {
      'uk': 'Зберегти',
      'en': '',
    },
    'og9texh2': {
      'uk': 'Кожен день',
      'en': '',
    },
    'utqyisru': {
      'uk': 'Кожні два дні',
      'en': '',
    },
    '0svuec4n': {
      'uk': 'Двічі на тиждень',
      'en': '',
    },
    '24a29mon': {
      'uk': 'Раз на тиждень',
      'en': '',
    },
    '1n9eiiyu': {
      'uk': 'Пряме яскраве світло',
      'en': '',
    },
    'y2zfadi6': {
      'uk': 'Яскраве розсіяне світло',
      'en': '',
    },
    '3t3yrz1n': {
      'uk': 'Розсіяне світло',
      'en': '',
    },
    'xg44j5sa': {
      'uk': 'Тінь',
      'en': '',
    },
    'cibfgdm0': {
      'uk': '20-25°C',
      'en': '',
    },
    '7jnhs6cn': {
      'uk': '18-20°C',
      'en': '',
    },
    'zacod5qh': {
      'uk': '15-18°C',
      'en': '',
    },
    '093ehwyi': {
      'uk': '10-15°C',
      'en': '',
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
  // delete
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
    'vnptuhqz': {
      'uk': 'Вибрати магазин',
      'en': 'Select a store',
    },
  },
  // Miscellaneous
  {
    '8nb51qsc': {
      'uk': '',
      'en': '',
    },
    'zunagtu1': {
      'uk': '',
      'en': '',
    },
    '3mx9ufkc': {
      'uk': 'Can we send you notifications?',
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
      'uk': '',
      'en': '',
    },
    '0m88o10m': {
      'uk': '',
      'en': '',
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
      'uk': '',
      'en': '',
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
