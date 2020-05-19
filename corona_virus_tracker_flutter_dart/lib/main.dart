import 'package:corona_virus_tracker_flutter_dart/services/covid_service_os.dart';
import 'package:corona_virus_tracker_flutter_dart/views/overall_cases.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void setupLocator(){
  GetIt.I.registerLazySingleton(() => CovidService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
    
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WorldDashboard(),
    );
  }
}