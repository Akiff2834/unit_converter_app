import 'conversion_category.dart';

/// Represents a unit of measurement within a category
class ConversionUnit {
  final String name;
  final String symbol;
  final ConversionCategory category;
  final double conversionFactor; // Factor to convert to base unit

  const ConversionUnit({
    required this.name,
    required this.symbol,
    required this.category,
    required this.conversionFactor,
  });

  @override
  String toString() => '$name ($symbol)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionUnit &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          symbol == other.symbol &&
          category == other.category;

  @override
  int get hashCode => name.hashCode ^ symbol.hashCode ^ category.hashCode;
}

/// Predefined units for each category
class ConversionUnits {
  // Length units (base: meter)
  static const lengthUnits = [
    ConversionUnit(
        name: 'Meter', symbol: 'm', category: ConversionCategory.length, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Kilometer', symbol: 'km', category: ConversionCategory.length, conversionFactor: 1000.0),
    ConversionUnit(
        name: 'Centimeter', symbol: 'cm', category: ConversionCategory.length, conversionFactor: 0.01),
    ConversionUnit(
        name: 'Millimeter', symbol: 'mm', category: ConversionCategory.length, conversionFactor: 0.001),
    ConversionUnit(
        name: 'Mile', symbol: 'mi', category: ConversionCategory.length, conversionFactor: 1609.34),
    ConversionUnit(
        name: 'Yard', symbol: 'yd', category: ConversionCategory.length, conversionFactor: 0.9144),
    ConversionUnit(
        name: 'Foot', symbol: 'ft', category: ConversionCategory.length, conversionFactor: 0.3048),
    ConversionUnit(
        name: 'Inch', symbol: 'in', category: ConversionCategory.length, conversionFactor: 0.0254),
  ];

  // Weight units (base: kilogram)
  static const weightUnits = [
    ConversionUnit(
        name: 'Kilogram', symbol: 'kg', category: ConversionCategory.weight, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Gram', symbol: 'g', category: ConversionCategory.weight, conversionFactor: 0.001),
    ConversionUnit(
        name: 'Milligram', symbol: 'mg', category: ConversionCategory.weight, conversionFactor: 0.000001),
    ConversionUnit(
        name: 'Pound', symbol: 'lb', category: ConversionCategory.weight, conversionFactor: 0.453592),
    ConversionUnit(
        name: 'Ounce', symbol: 'oz', category: ConversionCategory.weight, conversionFactor: 0.0283495),
    ConversionUnit(
        name: 'Ton', symbol: 't', category: ConversionCategory.weight, conversionFactor: 1000.0),
  ];

  // Temperature units (special handling - no conversion factor)
  static const temperatureUnits = [
    ConversionUnit(
        name: 'Celsius', symbol: '°C', category: ConversionCategory.temperature, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Fahrenheit', symbol: '°F', category: ConversionCategory.temperature, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Kelvin', symbol: 'K', category: ConversionCategory.temperature, conversionFactor: 1.0),
  ];

  // Currency units (conversion via API)
  static const currencyUnits = [
    ConversionUnit(
        name: 'US Dollar', symbol: 'USD', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Euro', symbol: 'EUR', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'British Pound', symbol: 'GBP', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Turkish Lira', symbol: 'TRY', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Japanese Yen', symbol: 'JPY', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Swiss Franc', symbol: 'CHF', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Canadian Dollar', symbol: 'CAD', category: ConversionCategory.currency, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Australian Dollar', symbol: 'AUD', category: ConversionCategory.currency, conversionFactor: 1.0),
  ];

  // Volume units (base: liter)
  static const volumeUnits = [
    ConversionUnit(
        name: 'Liter', symbol: 'L', category: ConversionCategory.volume, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Milliliter', symbol: 'mL', category: ConversionCategory.volume, conversionFactor: 0.001),
    ConversionUnit(
        name: 'Cubic Meter', symbol: 'm³', category: ConversionCategory.volume, conversionFactor: 1000.0),
    ConversionUnit(
        name: 'Gallon (US)', symbol: 'gal', category: ConversionCategory.volume, conversionFactor: 3.78541),
    ConversionUnit(
        name: 'Quart (US)', symbol: 'qt', category: ConversionCategory.volume, conversionFactor: 0.946353),
    ConversionUnit(
        name: 'Cup (US)', symbol: 'cup', category: ConversionCategory.volume, conversionFactor: 0.236588),
  ];

  // Area units (base: square meter)
  static const areaUnits = [
    ConversionUnit(
        name: 'Square Meter', symbol: 'm²', category: ConversionCategory.area, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Square Kilometer', symbol: 'km²', category: ConversionCategory.area, conversionFactor: 1000000.0),
    ConversionUnit(
        name: 'Square Centimeter', symbol: 'cm²', category: ConversionCategory.area, conversionFactor: 0.0001),
    ConversionUnit(
        name: 'Hectare', symbol: 'ha', category: ConversionCategory.area, conversionFactor: 10000.0),
    ConversionUnit(
        name: 'Acre', symbol: 'ac', category: ConversionCategory.area, conversionFactor: 4046.86),
    ConversionUnit(
        name: 'Square Mile', symbol: 'mi²', category: ConversionCategory.area, conversionFactor: 2589988.11),
    ConversionUnit(
        name: 'Square Foot', symbol: 'ft²', category: ConversionCategory.area, conversionFactor: 0.092903),
  ];

  // Speed units (base: meters per second)
  static const speedUnits = [
    ConversionUnit(
        name: 'Meters per Second', symbol: 'm/s', category: ConversionCategory.speed, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Kilometers per Hour', symbol: 'km/h', category: ConversionCategory.speed, conversionFactor: 0.277778),
    ConversionUnit(
        name: 'Miles per Hour', symbol: 'mph', category: ConversionCategory.speed, conversionFactor: 0.44704),
    ConversionUnit(
        name: 'Knots', symbol: 'kn', category: ConversionCategory.speed, conversionFactor: 0.514444),
    ConversionUnit(
        name: 'Feet per Second', symbol: 'ft/s', category: ConversionCategory.speed, conversionFactor: 0.3048),
  ];

  // Time units (base: second)
  static const timeUnits = [
    ConversionUnit(
        name: 'Second', symbol: 's', category: ConversionCategory.time, conversionFactor: 1.0),
    ConversionUnit(
        name: 'Minute', symbol: 'min', category: ConversionCategory.time, conversionFactor: 60.0),
    ConversionUnit(
        name: 'Hour', symbol: 'h', category: ConversionCategory.time, conversionFactor: 3600.0),
    ConversionUnit(
        name: 'Day', symbol: 'd', category: ConversionCategory.time, conversionFactor: 86400.0),
    ConversionUnit(
        name: 'Week', symbol: 'wk', category: ConversionCategory.time, conversionFactor: 604800.0),
    ConversionUnit(
        name: 'Month', symbol: 'mo', category: ConversionCategory.time, conversionFactor: 2629800.0),
    ConversionUnit(
        name: 'Year', symbol: 'yr', category: ConversionCategory.time, conversionFactor: 31557600.0),
  ];

  /// Get units for a specific category
  static List<ConversionUnit> getUnitsForCategory(ConversionCategory category) {
    switch (category) {
      case ConversionCategory.length:
        return lengthUnits;
      case ConversionCategory.weight:
        return weightUnits;
      case ConversionCategory.temperature:
        return temperatureUnits;
      case ConversionCategory.currency:
        return currencyUnits;
      case ConversionCategory.volume:
        return volumeUnits;
      case ConversionCategory.area:
        return areaUnits;
      case ConversionCategory.speed:
        return speedUnits;
      case ConversionCategory.time:
        return timeUnits;
    }
  }
}
