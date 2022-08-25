import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/app_controller.dart';
import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Live Price Tracker',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
