import 'package:flutter/material.dart';
import 'package:price_tracker/widgets/city_row_widget.dart';

import 'global_data.dart';

class AppController extends ChangeNotifier {
  // ignore: prefer_final_fields
  String? _date = GlobalData.dates[0] ?? 'No Data';
  String? _currentCity() => GlobalData.cities[_currentChart];
  int _currentChart = 0;

  List<CityRowWidget> _data = [
    for (int index = 0; index < GlobalData.cities.length; index++)
      CityRowWidget(
        city: GlobalData.cities[index],
        currentPrice: GlobalData.priceList[GlobalData.cities[index]]![0],
        previousPrice: GlobalData.priceList[GlobalData.cities[index]]![1],
      ),
  ];

  String? get currentCity => _currentCity();

  List<CityRowWidget> get data => _data;
  int get currentChart => _currentChart;
  String? get latestData => _date;

  void updateData(List<CityRowWidget> datalist) {
    _data = datalist;
    notifyListeners();
  }

  void changeChart(int index) {
    _currentChart = index;
    notifyListeners();
  }
}
