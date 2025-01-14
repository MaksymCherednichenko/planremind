import 'package:collection/collection.dart';

enum ModulesEnum {
  Home,
  Car,
  Plants,
  Health,
  Pets,
  Sport,
}

enum FrequencySchemeEnum {
  XTimesADay,
  EveryDay,
  EveryXDay,
  SpecificDayOfWeek,
  SpecificDayOfMonth,
  OnceAtSpecificDate,
}

enum FrequencySolidChangeEnum {
  onceAYear,
  onceEveryTwoYears,
  onceEveryThreeYears,
}

enum PlantLightingEnum {
  shadow,
  diffusedLight,
  brightDiffusedLight,
  directDiffusedLight,
}

enum PlantTemperatureEnum {
  from5to10,
  from10to15,
  from15to18,
  from18to20,
  from20to25,
}

enum MedicationDoseEnum {
  pill,
  ml,
  mg,
}

enum PetsEnum {
  cat,
  dog,
  bird,
  fish,
  rodent,
  rabbit,
}

enum MyColorsEnum {
  red,
  orange,
  yellow,
  green,
  sky,
  blue,
}

enum EventTypeEnum {
  regular,
  onetime,
}

enum DateTypesEnum {
  day,
  week,
  month,
  year,
}

enum PetsEventsEnum {
  vetvisit,
  grooming,
  shoping,
  vaccination,
  antiparaciticmedication,
}

enum RecordStateEnum {
  visible,
  deleted,
}

enum UnitsEnum {
  milimentre,
  centimetre,
  metre,
  kilometre,
  inch,
  foot,
  yard,
  mile,
  milligram,
  gram,
  kilogram,
  ounce,
  pound,
  stone,
  millilitre,
  centilitre,
  litre,
  pint,
  gallon,
  piece,
  oz,
}

enum UnitSystemsEnum {
  imperial,
  metric,
}

enum HomeStuffEnum {
  food,
  household,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ModulesEnum):
      return ModulesEnum.values.deserialize(value) as T?;
    case (FrequencySchemeEnum):
      return FrequencySchemeEnum.values.deserialize(value) as T?;
    case (FrequencySolidChangeEnum):
      return FrequencySolidChangeEnum.values.deserialize(value) as T?;
    case (PlantLightingEnum):
      return PlantLightingEnum.values.deserialize(value) as T?;
    case (PlantTemperatureEnum):
      return PlantTemperatureEnum.values.deserialize(value) as T?;
    case (MedicationDoseEnum):
      return MedicationDoseEnum.values.deserialize(value) as T?;
    case (PetsEnum):
      return PetsEnum.values.deserialize(value) as T?;
    case (MyColorsEnum):
      return MyColorsEnum.values.deserialize(value) as T?;
    case (EventTypeEnum):
      return EventTypeEnum.values.deserialize(value) as T?;
    case (DateTypesEnum):
      return DateTypesEnum.values.deserialize(value) as T?;
    case (PetsEventsEnum):
      return PetsEventsEnum.values.deserialize(value) as T?;
    case (RecordStateEnum):
      return RecordStateEnum.values.deserialize(value) as T?;
    case (UnitsEnum):
      return UnitsEnum.values.deserialize(value) as T?;
    case (UnitSystemsEnum):
      return UnitSystemsEnum.values.deserialize(value) as T?;
    case (HomeStuffEnum):
      return HomeStuffEnum.values.deserialize(value) as T?;
    default:
      return null;
  }
}
