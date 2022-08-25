import 'package:flutter/material.dart';
import 'package:price_tracker/widgets/city_row_widget.dart';

import 'global_data.dart';

class AppController extends ChangeNotifier {
  // ignore: prefer_final_fields
  String? _date = GlobalData.dates[0] ?? 'No Data'; // Latest date from data.
  String? _currentCity() => GlobalData
      .cities[_currentChart]; // Shows the data for corresponding city.
  int _currentChart = 0; // Index for toggling between cities.

  // List that composes the table data in the homepage.
  List<CityRowWidget> _data = [
    // Creates a list of CityRowWidgets that completes the table in the homepage.

    for (int index = 0;
        index < GlobalData.cities.length;
        index++) // It uses the static list of cities from GlobalData class.
      CityRowWidget(
        city: GlobalData.cities[index],
        currentPrice: GlobalData.priceList[GlobalData.cities[index]]![
            0], // Current price is at the beginning of the list. City name is used as the key to locate it from the Map
        previousPrice: GlobalData.priceList[GlobalData.cities[index]]![
            1], // Uses the next index to get the previous price.
      ),
  ];

  // Getter for current city selected.
  String? get currentCity => _currentCity();

  // Getter for the list of data to fill up the table.
  List<CityRowWidget> get data => _data;

  // Getter for index used for toggling between line charts.
  int get currentChart => _currentChart;

  // Getter for the latest date of the prices in the database.
  String? get latestData => _date;

  // Function to update the table data.
  void updateData(List<CityRowWidget> datalist) {
    _data = datalist;
    notifyListeners();
  }

  // Function to toggle between different charts.
  void changeChart(int index) {
    _currentChart = index;
    notifyListeners();
  }
}
