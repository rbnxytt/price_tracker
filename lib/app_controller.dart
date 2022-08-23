import 'package:flutter/material.dart';
import 'package:price_tracker/widgets/city_row_widget.dart';

class AppController extends ChangeNotifier {
  List<CityRowWidget> _data = const [
    CityRowWidget(
      city: 'Guangzhou',
      currentPrice: 10.5,
      previousPrice: 12.1,
    ),
    CityRowWidget(
      city: 'Shenzhen',
      currentPrice: 13.5,
      previousPrice: 12.1,
    ),
    CityRowWidget(
      city: 'Huizhou',
      currentPrice: 15.5,
      previousPrice: 13.1,
    ),
    CityRowWidget(
      city: 'Maoming',
      currentPrice: 13.5,
      previousPrice: 12.2,
    ),
    CityRowWidget(
      city: 'Foshan',
      currentPrice: 11.5,
      previousPrice: 12.2,
    ),
  ];

  List<CityRowWidget> get data => _data;

  void updateData(List<CityRowWidget> datalist) {
    _data = datalist;
    notifyListeners();
  }
}
