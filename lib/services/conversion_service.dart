import 'dart:math';
import '../models/conversion_category.dart';
import '../models/conversion_unit.dart';
import '../models/exchange_rate.dart';

/// Service for performing unit conversions
class ConversionService {
  /// Convert a value from one unit to another
  double convert({
    required double value,
    required ConversionUnit fromUnit,
    required ConversionUnit toUnit,
    ExchangeRate? exchangeRate,
  }) {
    if (fromUnit.category != toUnit.category) {
      throw ArgumentError('Units must be from the same category');
    }

    switch (fromUnit.category) {
      case ConversionCategory.temperature:
        return _convertTemperature(value, fromUnit, toUnit);
      case ConversionCategory.currency:
        if (exchangeRate == null) {
          throw ArgumentError('Exchange rate required for currency conversion');
        }
        return _convertCurrency(value, fromUnit, toUnit, exchangeRate);
      default:
        return _convertStandard(value, fromUnit, toUnit);
    }
  }

  /// Standard conversion using conversion factors
  double _convertStandard(
    double value,
    ConversionUnit fromUnit,
    ConversionUnit toUnit,
  ) {
    // Convert to base unit first, then to target unit
    final baseValue = value * fromUnit.conversionFactor;
    final result = baseValue / toUnit.conversionFactor;
    return _roundToPrecision(result);
  }

  /// Temperature conversion with special formulas
  double _convertTemperature(
    double value,
    ConversionUnit fromUnit,
    ConversionUnit toUnit,
  ) {
    if (fromUnit.symbol == toUnit.symbol) {
      return value;
    }

    // Convert to Celsius first
    double celsius;
    switch (fromUnit.symbol) {
      case '°C':
        celsius = value;
        break;
      case '°F':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'K':
        celsius = value - 273.15;
        break;
      default:
        throw ArgumentError('Unknown temperature unit: ${fromUnit.symbol}');
    }

    // Convert from Celsius to target unit
    double result;
    switch (toUnit.symbol) {
      case '°C':
        result = celsius;
        break;
      case '°F':
        result = celsius * 9 / 5 + 32;
        break;
      case 'K':
        result = celsius + 273.15;
        break;
      default:
        throw ArgumentError('Unknown temperature unit: ${toUnit.symbol}');
    }

    return _roundToPrecision(result);
  }

  /// Currency conversion using exchange rates
  double _convertCurrency(
    double value,
    ConversionUnit fromUnit,
    ConversionUnit toUnit,
    ExchangeRate exchangeRate,
  ) {
    if (fromUnit.symbol == toUnit.symbol) {
      return value;
    }

    // If base currency matches fromUnit, direct conversion
    if (exchangeRate.baseCode == fromUnit.symbol) {
      final rate = exchangeRate.getRateFor(toUnit.symbol);
      if (rate == null) {
        throw Exception('Exchange rate not found for ${toUnit.symbol}');
      }
      return _roundToPrecision(value * rate);
    }

    // Otherwise, convert through base currency
    final fromRate = exchangeRate.getRateFor(fromUnit.symbol);
    final toRate = exchangeRate.getRateFor(toUnit.symbol);

    if (fromRate == null || toRate == null) {
      throw Exception('Exchange rates not found');
    }

    // Convert to base currency, then to target currency
    final baseValue = value / fromRate;
    final result = baseValue * toRate;
    return _roundToPrecision(result);
  }

  /// Round to reasonable precision (6 decimal places)
  double _roundToPrecision(double value, {int precision = 6}) {
    final factor = pow(10, precision);
    return (value * factor).round() / factor;
  }
}
