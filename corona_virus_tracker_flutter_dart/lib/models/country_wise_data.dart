import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'country_wise_data.g.dart';

@JsonSerializable()
class CountryWiseDataModel {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
 // Float casesPerOneMillion;
  //Float deathsPerOneMillion;

  CountryWiseDataModel(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
     // this.casesPerOneMillion,
     // this.deathsPerOneMillion
     });

  factory CountryWiseDataModel.fromJson(Map<String,dynamic> item) => _$CountryWiseDataFromJson(item);
}
