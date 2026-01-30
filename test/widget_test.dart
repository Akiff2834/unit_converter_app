// Unit Converter App - Model Tests
// Tests for currency exchange rate model

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter_app/models/exchange_rate.dart';
import 'package:unit_converter_app/models/conversion_category.dart';

void main() {
  group('Currency Exchange Rate Tests', () {
    test('ExchangeRate parses API JSON correctly', () {
      // Sample JSON response from API
      final json = {
        'base': 'USD',
        'rates': {
          'EUR': 0.85,
          'GBP': 0.73,
          'TRY': 27.5,
        },
        'time_last_updated': 1234567890,
      };

      final exchangeRate = ExchangeRate.fromJson(json);

      expect(exchangeRate.baseCode, 'USD');
      expect(exchangeRate.conversionRates['EUR'], 0.85);
      expect(exchangeRate.conversionRates['TRY'], 27.5);
      expect(exchangeRate.getRateFor('GBP'), 0.73);
    });

    test('ConversionCategory has correct display names', () {
      expect(ConversionCategory.currency.displayName, 'Currency');
      expect(ConversionCategory.length.displayName, 'Length');
      expect(ConversionCategory.temperature.displayName, 'Temperature');
    });
  });
}
