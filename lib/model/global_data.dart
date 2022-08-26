import 'package:flutter/material.dart';
import 'package:price_tracker/widgets/custom_line_chart.dart';

class GlobalData {
// Create a key for the home page scaffold.
  static final GlobalKey<ScaffoldState> key = GlobalKey();

  static final List<String> cities = [
    'Guangzhou',
    'Shenzhen',
    'Huizhou',
    'Maoming',
    'Foshan',
  ];

  static List<String?> dates = [
    '2022/8/18',
    '2022/8/17',
    '2022/8/16',
    '2022/8/15',
    '2022/8/14',
    '2022/8/13',
    '2022/8/12',
    '2022/8/11',
    '2022/8/10',
    '2022/8/9',
    '2022/8/8',
    '2022/8/7',
    '2022/8/6',
    '2022/8/5',
    '2022/8/4',
  ];

  static Map<String, List<double>> priceList = {
    'Guangzhou': [
      11.85,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.8,
      11.92,
    ],
    'Shenzhen': [
      12,
      12,
      11.75,
      11.75,
      11.75,
      11.75,
      11.75,
      11.75,
      11.5,
      11.5,
      11.5,
      11.5,
      11.5,
      11.5,
      11.5,
    ],
    'Huizhou': [
      11.7,
      11.7,
      11.7,
      11.7,
      11.8,
      11.8,
      12,
      11.9,
      11.6,
      12,
      12.0,
      12.0,
      12.0,
      11.6,
      11.05,
    ],
    'Maoming': [
      11.8,
      11.84,
      11.8,
      11.775,
      11.75,
      11.7,
      10.85,
      11.66,
      11.81,
      11.8,
      12,
      12,
      12.1,
      12.1,
      11.8,
    ],
    'Foshan': [
      11.81,
      11.76,
      11.8,
      11.84,
      11.85,
      11.88,
      11.89,
      11.9,
      11.86,
      12.06,
      12.12,
      12.13,
      12.1,
      11.93,
      11.85,
    ]
  };

  static double priceAverage() {
    return 12.1;
  }

  static List<CustomLineChart> charts = [
    for (String city in cities)
      CustomLineChart(
        price: priceList[city],
        city: city,
      )
  ];
}
