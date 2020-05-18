import 'package:corona_virus_tracker_flutter_dart/models/api_response.dart';
import 'package:corona_virus_tracker_flutter_dart/models/overall_data.dart';
import 'package:corona_virus_tracker_flutter_dart/services/covid_service_os.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WorldDashboard extends StatefulWidget {
  @override
  _WorldDashboardState createState() => _WorldDashboardState();
}



class _WorldDashboardState extends State<WorldDashboard> {
  CovidService get service => GetIt.I<CovidService>();

  APIResponce<FullData> _apiResponce;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponce = await service.getCovidData();
    service.getCovidData();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Dashboard'),
      ),
      body: Center(
        child: Builder(
          builder: (_) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (_apiResponce.error) {
              return Center(child: Text(_apiResponce.errorMessage));
            }
           return Text(_apiResponce.data.cases);
          // Text('er');

          },
        ),
      ),
    );
  }
}
