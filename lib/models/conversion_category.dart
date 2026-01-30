/// Enum representing different categories of unit conversions
enum ConversionCategory {
  length,
  weight,
  temperature,
  currency,
  volume,
  area,
  speed,
  time;

  /// Display name for the category
  String get displayName {
    switch (this) {
      case ConversionCategory.length:
        return 'Length';
      case ConversionCategory.weight:
        return 'Weight';
      case ConversionCategory.temperature:
        return 'Temperature';
      case ConversionCategory.currency:
        return 'Currency';
      case ConversionCategory.volume:
        return 'Volume';
      case ConversionCategory.area:
        return 'Area';
      case ConversionCategory.speed:
        return 'Speed';
      case ConversionCategory.time:
        return 'Time';
    }
  }

  /// Icon name for the category
  String get iconName {
    switch (this) {
      case ConversionCategory.length:
        return 'straighten';
      case ConversionCategory.weight:
        return 'fitness_center';
      case ConversionCategory.temperature:
        return 'thermostat';
      case ConversionCategory.currency:
        return 'attach_money';
      case ConversionCategory.volume:
        return 'water_drop';
      case ConversionCategory.area:
        return 'crop_square';
      case ConversionCategory.speed:
        return 'speed';
      case ConversionCategory.time:
        return 'schedule';
    }
  }
}
