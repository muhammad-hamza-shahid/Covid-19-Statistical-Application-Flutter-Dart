import 'package:json_annotation/json_annotation.dart';

part 'overall_data.g.dart';

@JsonSerializable()
class FullData {
  int cases;
  int deaths;
  int recovered;
  int updated;

  FullData({this.cases, this.deaths, this.recovered, this.updated});

  factory FullData.fromJson(Map<String, dynamic> item) =>
      _$FullDataFromJson(item);
}
