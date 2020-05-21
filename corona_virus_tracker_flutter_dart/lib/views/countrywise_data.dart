import 'package:flutter/material.dart';

class CountryWiseDataView extends StatefulWidget {

  final String countryName;
  CountryWiseDataView({this.countryName});
  @override
  _CountryWiseDataViewState createState() => _CountryWiseDataViewState();
}

class _CountryWiseDataViewState extends State<CountryWiseDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.countryName,),
      
    ));
  }
}