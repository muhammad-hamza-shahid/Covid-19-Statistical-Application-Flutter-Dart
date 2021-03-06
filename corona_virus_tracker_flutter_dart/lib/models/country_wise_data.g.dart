// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_wise_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryWiseDataModel _$CountryWiseDataFromJson(Map<String, dynamic> json) {
  return CountryWiseDataModel(
    country: json['country'] as String,
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    //casesPerOneMillion: json['casesPerOneMillion'] as Float,
    //deathsPerOneMillion: json['deathsPerOneMillion'] as Float,
  );
}

Map<String, dynamic> _$CountryWiseDataToJson(CountryWiseDataModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
     // 'casesPerOneMillion': instance.casesPerOneMillion,
      //'deathsPerOneMillion': instance.deathsPerOneMillion,
    };
