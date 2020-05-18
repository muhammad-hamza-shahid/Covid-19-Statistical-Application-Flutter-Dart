import 'dart:convert';
import 'package:corona_virus_tracker_flutter_dart/models/api_response.dart';
import 'package:corona_virus_tracker_flutter_dart/models/overall_data.dart';
import 'package:http/http.dart' as http;

class CovidService{
  static const API = 'http://api.coronastatistics.live/';
  static const headers = {'apiKey': '3d86e02a-6205-4fff-bb74-37c6f167dd63',
                          'Content-Type':'application/json'};

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
}