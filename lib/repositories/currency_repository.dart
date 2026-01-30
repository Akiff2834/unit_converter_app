import '../models/exchange_rate.dart';
import '../services/api_service.dart';

/// Repository for managing currency exchange rates
/// Abstracts API access following the Repository Pattern
class CurrencyRepository {
  final ApiService _apiService;
  ExchangeRate? _cachedRates;
  DateTime? _cacheTime;
  static const Duration _cacheDuration = Duration(hours: 1);

  CurrencyRepository(this._apiService);

  /// Get exchange rates for a base currency
  /// Uses caching to reduce API calls
  Future<ExchangeRate> getExchangeRates(String baseCurrency) async {
    // Check if cache is valid
    if (_cachedRates != null &&
        _cacheTime != null &&
        _cachedRates!.baseCode == baseCurrency &&
        DateTime.now().difference(_cacheTime!) < _cacheDuration) {
      return _cachedRates!;
    }

    // Fetch fresh data
    try {
      final rates = await _apiService.getExchangeRates(baseCurrency);
      _cachedRates = rates;
      _cacheTime = DateTime.now();
      return rates;
    } catch (e) {
      // If fetch fails and we have cached data, return it
      if (_cachedRates != null && _cachedRates!.baseCode == baseCurrency) {
        return _cachedRates!;
      }
      rethrow;
    }
  }

  /// Clear the cache
  void clearCache() {
    _cachedRates = null;
    _cacheTime = null;
  }

  /// Check if cache is valid
  bool get hasCachedData => _cachedRates != null && _cacheTime != null;

  /// Get cache age
  Duration? get cacheAge {
    if (_cacheTime == null) return null;
    return DateTime.now().difference(_cacheTime!);
  }
}
