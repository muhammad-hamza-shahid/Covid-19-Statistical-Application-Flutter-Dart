// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullData _$FullDataFromJson(Map<String, dynamic> json) {
  return FullData(
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recovered: json['recovered'] as int,
    updated: json['updated'] as int,
  );
}

Map<String, dynamic> _$FullDataToJson(FullData instance) => <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'updated': instance.updated,
    };
