import 'package:json_annotation/json_annotation.dart';

part 'country_wise_data.g.dart';

@JsonSerializable()
class CountryWiseData {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;

  CountryWiseData(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion});

  factory CountryWiseData.fromJson(Map<String,dynamic> item) => _$CountryWiseDataFromJson(item);
}
