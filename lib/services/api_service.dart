import 'package:dio/dio.dart';
import '../models/exchange_rate.dart';

/// Service for fetching currency exchange rates from API
class ApiService {
  final Dio _dio;
  static const String _baseUrl = 'https://api.exchangerate-api.com/v4/latest';

  ApiService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

  /// Fetch exchange rates for a specific base currency
  Future<ExchangeRate> getExchangeRates(String baseCurrency) async {
    try {
      final response = await _dio.get('$_baseUrl/$baseCurrency');

      if (response.statusCode == 200) {
        return ExchangeRate.fromJson(response.data);
      } else {
        throw Exception('Failed to load exchange rates: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Connection timeout. Please check your internet connection.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection. Please check your network.');
      } else {
        throw Exception('Failed to fetch exchange rates: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Fetch exchange rates with caching support
  Future<ExchangeRate> getExchangeRatesWithCache(
    String baseCurrency, {
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    // For now, just fetch directly. Can add caching logic later
    return getExchangeRates(baseCurrency);
  }
}
