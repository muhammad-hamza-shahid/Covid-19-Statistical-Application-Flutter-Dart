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

Future<APIResponce<List<CountryWiseData>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <CountryWiseData>[];
        for (var item in jsonData) {
          notes.add(CountryWiseData.fromJson(item));
        }
        return APIResponce<List<CountryWiseData>>(
          data: notes,
        );
      }
      return APIResponce<List<CountryWiseData>>(
          error: true, errorMessage: 'An Error Occured');
    }).catchError((_) => APIResponce<List<CountryWiseData>>(
        error: true, errorMessage: 'An Error Occured'));
  }
}