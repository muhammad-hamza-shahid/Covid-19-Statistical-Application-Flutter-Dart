import 'package:corona_virus_tracker_flutter_dart/models/api_response.dart';
import 'package:corona_virus_tracker_flutter_dart/models/country_wise_data.dart';
import 'package:corona_virus_tracker_flutter_dart/models/overall_data.dart';
import 'package:corona_virus_tracker_flutter_dart/services/covid_service_os.dart';
import 'package:corona_virus_tracker_flutter_dart/views/countrywise_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WorldDashboard extends StatefulWidget {
  @override
  _WorldDashboardState createState() => _WorldDashboardState();
}

class _WorldDashboardState extends State<WorldDashboard> {
  CovidService get service => GetIt.I<CovidService>();

  APIResponce<FullData> _apiResponceFullData;
  APIResponce<List<CountryWiseDataModel>> _apiResponceCountrywiseData;
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

    _apiResponceFullData = await service.getCovidData();
    _apiResponceCountrywiseData=await service.getCountrywiseList();

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
            if (_apiResponceFullData.error||_apiResponceCountrywiseData.error) {
              return Center(child: Text(_apiResponceFullData.errorMessage));
            }
            // Text("Total cases " +
            //     (_apiResponce.data.cases).toString() +
            //     "\nTotal Deaths " +
            //     (_apiResponce.data.deaths).toString() +
            //     "\nTotal Recovered " +
            //     (_apiResponce.data.recovered).toString());
            return ListView.separated(
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.green),
                itemBuilder: (BuildContext context,int index){
                  return ListTile(                    
                    title: Text(_apiResponceCountrywiseData.data[index].country.toString()),
                    subtitle: Text("Total cases"+_apiResponceCountrywiseData.data[index].cases.toString()+"  Total Deaths"+_apiResponceCountrywiseData.data[index].deaths.toString()),
                    onTap: (){
                      Navigator.of(context).push( MaterialPageRoute(builder: (context)  => CountryWiseDataView(countryName: _apiResponceCountrywiseData.data[index].country,)));
                    },
                  );
                },
                itemCount: _apiResponceCountrywiseData.data.length);
          },
        ),
      ),
    );
  }
}