import 'dart:convert';
import 'package:corona_virus_tracker_flutter_dart/models/api_response.dart';
import 'package:corona_virus_tracker_flutter_dart/models/country_wise_data.dart';
import 'package:corona_virus_tracker_flutter_dart/models/overall_data.dart';
import 'package:http/http.dart' as http;

class CovidService{
  static const API = 'http://api.coronastatistics.live/';
  static const headers = {'Content-Type':'application/json'};

Future<APIResponce<FullData>> getCovidData(){
  return http.get(API +'all').then((data) {
    if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponce<FullData>(
          data: FullData.fromJson(jsonData),
        );
      }
      return APIResponce<FullData>(error: true, errorMessage: 'An Error Occured');
  }).catchError((_)=>
  APIResponce<FullData>(error: true,errorMessage: 'An Error Occured'));
}

Future<APIResponce<List<CountryWiseDataModel>>> getCountrywiseList() {
    return http.get(API + 'countries').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final records = <CountryWiseDataModel>[];
        for (var item in jsonData) {
          records.add(CountryWiseDataModel.fromJson(item));
        }
        return APIResponce<List<CountryWiseDataModel>>(
          data: records,
        );
      }
      return APIResponce<List<CountryWiseDataModel>>(
          error: true, errorMessage: 'An Error Occured');
    }).catchError((_) => APIResponce<List<CountryWiseDataModel>>(
        error: true, errorMessage: 'An Error Occured'));
  }
}