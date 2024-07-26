import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _currentUserRef =
          (await secureStorage.getString('ff_currentUserRef'))?.ref ??
              _currentUserRef;
    });
    await _safeInitAsync(() async {
      _userID = await secureStorage.getString('ff_userID') ?? _userID;
    });
    await _safeInitAsync(() async {
      _colorButton =
          await secureStorage.getString('ff_colorButton') ?? _colorButton;
    });
    await _safeInitAsync(() async {
      _category = await secureStorage.getStringList('ff_category') ?? _category;
    });
    await _safeInitAsync(() async {
      _categoryHousehold =
          await secureStorage.getStringList('ff_categoryHousehold') ??
              _categoryHousehold;
    });
    await _safeInitAsync(() async {
      _namesOfShops =
          await secureStorage.getStringList('ff_namesOfShops') ?? _namesOfShops;
    });
    await _safeInitAsync(() async {
      _sortListFromShopsNames =
          await secureStorage.getStringList('ff_sortListFromShopsNames') ??
              _sortListFromShopsNames;
    });
    await _safeInitAsync(() async {
      _visitWellcomePageCount =
          await secureStorage.getInt('ff_visitWellcomePageCount') ??
              _visitWellcomePageCount;
    });
    await _safeInitAsync(() async {
      _hasCar = await secureStorage.getBool('ff_hasCar') ?? _hasCar;
    });
    await _safeInitAsync(() async {
      _lastDaySetMileage =
          await secureStorage.read(key: 'ff_lastDaySetMileage') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_lastDaySetMileage'))!)
              : _lastDaySetMileage;
    });
    await _safeInitAsync(() async {
      _units = await secureStorage.getStringList('ff_units') ?? _units;
    });
    await _safeInitAsync(() async {
      _setUserUnits =
          await secureStorage.getString('ff_setUserUnits') ?? _setUserUnits;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _currentUserRef;
  DocumentReference? get currentUserRef => _currentUserRef;
  set currentUserRef(DocumentReference? value) {
    _currentUserRef = value;
    value != null
        ? secureStorage.setString('ff_currentUserRef', value.path)
        : secureStorage.remove('ff_currentUserRef');
  }

  void deleteCurrentUserRef() {
    secureStorage.delete(key: 'ff_currentUserRef');
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
    secureStorage.setString('ff_userID', value);
  }

  void deleteUserID() {
    secureStorage.delete(key: 'ff_userID');
  }

  String _colorButton = 'green';
  String get colorButton => _colorButton;
  set colorButton(String value) {
    _colorButton = value;
    secureStorage.setString('ff_colorButton', value);
  }

  void deleteColorButton() {
    secureStorage.delete(key: 'ff_colorButton');
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  DateTime? _choosedDate;
  DateTime? get choosedDate => _choosedDate;
  set choosedDate(DateTime? value) {
    _choosedDate = value;
  }

  String _tag = '';
  String get tag => _tag;
  set tag(String value) {
    _tag = value;
  }

  String _unit = '';
  String get unit => _unit;
  set unit(String value) {
    _unit = value;
  }

  int _setQuantityInt = 0;
  int get setQuantityInt => _setQuantityInt;
  set setQuantityInt(int value) {
    _setQuantityInt = value;
  }

  double _setQuantityDouble = 0.0;
  double get setQuantityDouble => _setQuantityDouble;
  set setQuantityDouble(double value) {
    _setQuantityDouble = value;
  }

  double _setQuantity = 0.0;
  double get setQuantity => _setQuantity;
  set setQuantity(double value) {
    _setQuantity = value;
  }

  int _indexMain = 0;
  int get indexMain => _indexMain;
  set indexMain(int value) {
    _indexMain = value;
  }

  int _indeSec = 0;
  int get indeSec => _indeSec;
  set indeSec(int value) {
    _indeSec = value;
  }

  int _clickOnAddToList = 0;
  int get clickOnAddToList => _clickOnAddToList;
  set clickOnAddToList(int value) {
    _clickOnAddToList = value;
  }

  bool _isDateRange = false;
  bool get isDateRange => _isDateRange;
  set isDateRange(bool value) {
    _isDateRange = value;
  }

  DateTime? _chooseSecDate;
  DateTime? get chooseSecDate => _chooseSecDate;
  set chooseSecDate(DateTime? value) {
    _chooseSecDate = value;
  }

  List<DateTime> _dateRange = [];
  List<DateTime> get dateRange => _dateRange;
  set dateRange(List<DateTime> value) {
    _dateRange = value;
  }

  void addToDateRange(DateTime value) {
    dateRange.add(value);
  }

  void removeFromDateRange(DateTime value) {
    dateRange.remove(value);
  }

  void removeAtIndexFromDateRange(int index) {
    dateRange.removeAt(index);
  }

  void updateDateRangeAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    dateRange[index] = updateFn(_dateRange[index]);
  }

  void insertAtIndexInDateRange(int index, DateTime value) {
    dateRange.insert(index, value);
  }

  List<String> _category = [];
  List<String> get category => _category;
  set category(List<String> value) {
    _category = value;
    secureStorage.setStringList('ff_category', value);
  }

  void deleteCategory() {
    secureStorage.delete(key: 'ff_category');
  }

  void addToCategory(String value) {
    category.add(value);
    secureStorage.setStringList('ff_category', _category);
  }

  void removeFromCategory(String value) {
    category.remove(value);
    secureStorage.setStringList('ff_category', _category);
  }

  void removeAtIndexFromCategory(int index) {
    category.removeAt(index);
    secureStorage.setStringList('ff_category', _category);
  }

  void updateCategoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    category[index] = updateFn(_category[index]);
    secureStorage.setStringList('ff_category', _category);
  }

  void insertAtIndexInCategory(int index, String value) {
    category.insert(index, value);
    secureStorage.setStringList('ff_category', _category);
  }

  List<String> _categoryHousehold = [];
  List<String> get categoryHousehold => _categoryHousehold;
  set categoryHousehold(List<String> value) {
    _categoryHousehold = value;
    secureStorage.setStringList('ff_categoryHousehold', value);
  }

  void deleteCategoryHousehold() {
    secureStorage.delete(key: 'ff_categoryHousehold');
  }

  void addToCategoryHousehold(String value) {
    categoryHousehold.add(value);
    secureStorage.setStringList('ff_categoryHousehold', _categoryHousehold);
  }

  void removeFromCategoryHousehold(String value) {
    categoryHousehold.remove(value);
    secureStorage.setStringList('ff_categoryHousehold', _categoryHousehold);
  }

  void removeAtIndexFromCategoryHousehold(int index) {
    categoryHousehold.removeAt(index);
    secureStorage.setStringList('ff_categoryHousehold', _categoryHousehold);
  }

  void updateCategoryHouseholdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryHousehold[index] = updateFn(_categoryHousehold[index]);
    secureStorage.setStringList('ff_categoryHousehold', _categoryHousehold);
  }

  void insertAtIndexInCategoryHousehold(int index, String value) {
    categoryHousehold.insert(index, value);
    secureStorage.setStringList('ff_categoryHousehold', _categoryHousehold);
  }

  List<String> _namesOfShops = [];
  List<String> get namesOfShops => _namesOfShops;
  set namesOfShops(List<String> value) {
    _namesOfShops = value;
    secureStorage.setStringList('ff_namesOfShops', value);
  }

  void deleteNamesOfShops() {
    secureStorage.delete(key: 'ff_namesOfShops');
  }

  void addToNamesOfShops(String value) {
    namesOfShops.add(value);
    secureStorage.setStringList('ff_namesOfShops', _namesOfShops);
  }

  void removeFromNamesOfShops(String value) {
    namesOfShops.remove(value);
    secureStorage.setStringList('ff_namesOfShops', _namesOfShops);
  }

  void removeAtIndexFromNamesOfShops(int index) {
    namesOfShops.removeAt(index);
    secureStorage.setStringList('ff_namesOfShops', _namesOfShops);
  }

  void updateNamesOfShopsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    namesOfShops[index] = updateFn(_namesOfShops[index]);
    secureStorage.setStringList('ff_namesOfShops', _namesOfShops);
  }

  void insertAtIndexInNamesOfShops(int index, String value) {
    namesOfShops.insert(index, value);
    secureStorage.setStringList('ff_namesOfShops', _namesOfShops);
  }

  List<String> _sortListFromShopsNames = [];
  List<String> get sortListFromShopsNames => _sortListFromShopsNames;
  set sortListFromShopsNames(List<String> value) {
    _sortListFromShopsNames = value;
    secureStorage.setStringList('ff_sortListFromShopsNames', value);
  }

  void deleteSortListFromShopsNames() {
    secureStorage.delete(key: 'ff_sortListFromShopsNames');
  }

  void addToSortListFromShopsNames(String value) {
    sortListFromShopsNames.add(value);
    secureStorage.setStringList(
        'ff_sortListFromShopsNames', _sortListFromShopsNames);
  }

  void removeFromSortListFromShopsNames(String value) {
    sortListFromShopsNames.remove(value);
    secureStorage.setStringList(
        'ff_sortListFromShopsNames', _sortListFromShopsNames);
  }

  void removeAtIndexFromSortListFromShopsNames(int index) {
    sortListFromShopsNames.removeAt(index);
    secureStorage.setStringList(
        'ff_sortListFromShopsNames', _sortListFromShopsNames);
  }

  void updateSortListFromShopsNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sortListFromShopsNames[index] = updateFn(_sortListFromShopsNames[index]);
    secureStorage.setStringList(
        'ff_sortListFromShopsNames', _sortListFromShopsNames);
  }

  void insertAtIndexInSortListFromShopsNames(int index, String value) {
    sortListFromShopsNames.insert(index, value);
    secureStorage.setStringList(
        'ff_sortListFromShopsNames', _sortListFromShopsNames);
  }

  List<DateTime> _curentMonthsYear = [];
  List<DateTime> get curentMonthsYear => _curentMonthsYear;
  set curentMonthsYear(List<DateTime> value) {
    _curentMonthsYear = value;
  }

  void addToCurentMonthsYear(DateTime value) {
    curentMonthsYear.add(value);
  }

  void removeFromCurentMonthsYear(DateTime value) {
    curentMonthsYear.remove(value);
  }

  void removeAtIndexFromCurentMonthsYear(int index) {
    curentMonthsYear.removeAt(index);
  }

  void updateCurentMonthsYearAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    curentMonthsYear[index] = updateFn(_curentMonthsYear[index]);
  }

  void insertAtIndexInCurentMonthsYear(int index, DateTime value) {
    curentMonthsYear.insert(index, value);
  }

  int _visitWellcomePageCount = 0;
  int get visitWellcomePageCount => _visitWellcomePageCount;
  set visitWellcomePageCount(int value) {
    _visitWellcomePageCount = value;
    secureStorage.setInt('ff_visitWellcomePageCount', value);
  }

  void deleteVisitWellcomePageCount() {
    secureStorage.delete(key: 'ff_visitWellcomePageCount');
  }

  List<String> _recipeSteps = [];
  List<String> get recipeSteps => _recipeSteps;
  set recipeSteps(List<String> value) {
    _recipeSteps = value;
  }

  void addToRecipeSteps(String value) {
    recipeSteps.add(value);
  }

  void removeFromRecipeSteps(String value) {
    recipeSteps.remove(value);
  }

  void removeAtIndexFromRecipeSteps(int index) {
    recipeSteps.removeAt(index);
  }

  void updateRecipeStepsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    recipeSteps[index] = updateFn(_recipeSteps[index]);
  }

  void insertAtIndexInRecipeSteps(int index, String value) {
    recipeSteps.insert(index, value);
  }

  List<int> _nums = [];
  List<int> get nums => _nums;
  set nums(List<int> value) {
    _nums = value;
  }

  void addToNums(int value) {
    nums.add(value);
  }

  void removeFromNums(int value) {
    nums.remove(value);
  }

  void removeAtIndexFromNums(int index) {
    nums.removeAt(index);
  }

  void updateNumsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    nums[index] = updateFn(_nums[index]);
  }

  void insertAtIndexInNums(int index, int value) {
    nums.insert(index, value);
  }

  bool _hasCar = false;
  bool get hasCar => _hasCar;
  set hasCar(bool value) {
    _hasCar = value;
    secureStorage.setBool('ff_hasCar', value);
  }

  void deleteHasCar() {
    secureStorage.delete(key: 'ff_hasCar');
  }

  DateTime? _lastDaySetMileage;
  DateTime? get lastDaySetMileage => _lastDaySetMileage;
  set lastDaySetMileage(DateTime? value) {
    _lastDaySetMileage = value;
    value != null
        ? secureStorage.setInt(
            'ff_lastDaySetMileage', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastDaySetMileage');
  }

  void deleteLastDaySetMileage() {
    secureStorage.delete(key: 'ff_lastDaySetMileage');
  }

  int _day = 0;
  int get day => _day;
  set day(int value) {
    _day = value;
  }

  int _month = 0;
  int get month => _month;
  set month(int value) {
    _month = value;
  }

  int _year = 0;
  int get year => _year;
  set year(int value) {
    _year = value;
  }

  List<String> _units = ['g', 'kg', 'piece', 'l', 'ml'];
  List<String> get units => _units;
  set units(List<String> value) {
    _units = value;
    secureStorage.setStringList('ff_units', value);
  }

  void deleteUnits() {
    secureStorage.delete(key: 'ff_units');
  }

  void addToUnits(String value) {
    units.add(value);
    secureStorage.setStringList('ff_units', _units);
  }

  void removeFromUnits(String value) {
    units.remove(value);
    secureStorage.setStringList('ff_units', _units);
  }

  void removeAtIndexFromUnits(int index) {
    units.removeAt(index);
    secureStorage.setStringList('ff_units', _units);
  }

  void updateUnitsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    units[index] = updateFn(_units[index]);
    secureStorage.setStringList('ff_units', _units);
  }

  void insertAtIndexInUnits(int index, String value) {
    units.insert(index, value);
    secureStorage.setStringList('ff_units', _units);
  }

  List<ModuleStruct> _moduleStates = [
    ModuleStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Home\",\"active\":\"false\"}')),
    ModuleStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Car\",\"active\":\"false\"}')),
    ModuleStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Plants\",\"active\":\"false\"}')),
    ModuleStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Pets\",\"active\":\"false\"}')),
    ModuleStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Sport\",\"active\":\"false\"}'))
  ];
  List<ModuleStruct> get moduleStates => _moduleStates;
  set moduleStates(List<ModuleStruct> value) {
    _moduleStates = value;
  }

  void addToModuleStates(ModuleStruct value) {
    moduleStates.add(value);
  }

  void removeFromModuleStates(ModuleStruct value) {
    moduleStates.remove(value);
  }

  void removeAtIndexFromModuleStates(int index) {
    moduleStates.removeAt(index);
  }

  void updateModuleStatesAtIndex(
    int index,
    ModuleStruct Function(ModuleStruct) updateFn,
  ) {
    moduleStates[index] = updateFn(_moduleStates[index]);
  }

  void insertAtIndexInModuleStates(int index, ModuleStruct value) {
    moduleStates.insert(index, value);
  }

  DocumentReference? _modulesDocRef;
  DocumentReference? get modulesDocRef => _modulesDocRef;
  set modulesDocRef(DocumentReference? value) {
    _modulesDocRef = value;
  }

  String _setUserUnits = 'Euro';
  String get setUserUnits => _setUserUnits;
  set setUserUnits(String value) {
    _setUserUnits = value;
    secureStorage.setString('ff_setUserUnits', value);
  }

  void deleteSetUserUnits() {
    secureStorage.delete(key: 'ff_setUserUnits');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
