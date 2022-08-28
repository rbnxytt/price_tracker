import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';
import 'package:price_tracker/model/database.dart';
import 'package:price_tracker/widgets/city_row_widget.dart';

import 'global_data.dart';

class AppController extends ChangeNotifier {
  // ignore: prefer_final_fields
  String? _date = GlobalData.dates[0]; // Latest date from data.
  String? _currentCity() => GlobalData
      .cities[_currentChart]; // Shows the data for corresponding city.
  int _currentChart = 0; // Index for toggling between cities.
  int _previousPrice = 0; // Index of the price 1 day ago.
  int _daysAgo = 1;

  DateTime? _dateTime;

  DateTime get dateTime => _dateTime ?? DateTime.now();

  void changeDate(DateTime date) {
    _dateTime = date;
  }

  // Adds data to database.
  Future updateDatabase(List<String> data) async {
    var box = await Hive.openBox<Database>('database');
    var priceData = Database(
      date: _dateTime,
      gzPrice: double.parse(data[0]),
      szPrice: double.parse(data[1]),
      hzPrice: double.parse(data[2]),
      mmPrice: double.parse(data[3]),
      fsPrice: double.parse(data[4]),
    );
    box.add(priceData);
    notifyListeners();
  }

  // List that composes the table data in the homepage.
  List<CityRowWidget> _data() => [
        // Creates a list of CityRowWidgets that completes the table in the homepage.

        for (int index = 0;
            index < GlobalData.cities.length;
            index++) // It uses the static list of cities from GlobalData class.
          CityRowWidget(
            city: GlobalData.cities[index],
            currentPrice: GlobalData.priceList[GlobalData.cities[index]]![
                0], // Current price is at the beginning of the list. City name is used as the key to locate it from the Map
            previousPrice: GlobalData.priceList[GlobalData.cities[index]]![
                _daysAgo], // Uses the next index to get the previous price.
          ),
      ];

  // Getter for daysAgo
  int get daysAgo => _daysAgo;

  // Getter for previous price
  int get previousPrice => _previousPrice;

  // Getter for current city selected.
  String? get currentCity => _currentCity();

  // Getter for the list of data to fill up the table.
  List<CityRowWidget> get data => _data();

  // Getter for index used for toggling between line charts.
  int get currentChart => _currentChart;

  // Getter for the latest date of the prices in the database.
  String? get latestData => _date;

  // Switch previous price
  void changeDaysAgo(BuildContext context, int dayAgo, bool change) {
    if (dayAgo >= 0 && change == true && dayAgo < 7) {
      _previousPrice = dayAgo;
      _daysAgo = dayAgo + 1;
    } else if (dayAgo > 1 && change == false) {
      _previousPrice = dayAgo;
      _daysAgo = dayAgo - 1;
    }
    notifyListeners();
  }

  // Function to update the table data.
  void updateData(List<String> data) {
    for (int index = 0; index < 5; index++) {
      GlobalData.priceList[GlobalData.cities[index]]
          ?.insert(0, double.parse(data[index]));
    }
    GlobalData.dates.insert(0, DateFormat('yyyy/M/d').format(_dateTime!));
    notifyListeners();
  }

  // Function to toggle between different charts.
  void changeChart(int index) {
    _currentChart = index;
    notifyListeners();
  }
}
