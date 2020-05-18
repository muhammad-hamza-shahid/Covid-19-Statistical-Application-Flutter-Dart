// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullData _$FullDataFromJson(Map<String, dynamic> json) {
  return FullData(
    cases: json['cases'] as String,
    deaths: json['deaths'] as String,
    recovered: json['recovered'] as String,
    updated: json['updated'] as String,
  );
}

Map<String, dynamic> _$FullDataToJson(FullData instance) => <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'updated': instance.updated,
    };
