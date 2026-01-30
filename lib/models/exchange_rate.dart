import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate.g.dart';

/// Model for exchange rate API response
@JsonSerializable()
class ExchangeRate {
  @JsonKey(name: 'base')
  final String baseCode;

  @JsonKey(name: 'rates')
  final Map<String, double> conversionRates;

  @JsonKey(name: 'time_last_updated')
  final int? timeLastUpdate;

  ExchangeRate({
    required this.baseCode,
    required this.conversionRates,
    this.timeLastUpdate,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);

  /// Get exchange rate for a specific currency
  double? getRateFor(String currencyCode) {
    return conversionRates[currencyCode];
  }
}
