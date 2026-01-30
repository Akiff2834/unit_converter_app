// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
  baseCode: json['base'] as String,
  conversionRates: (json['rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  timeLastUpdate: (json['time_last_updated'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'base': instance.baseCode,
      'rates': instance.conversionRates,
      'time_last_updated': instance.timeLastUpdate,
    };
