import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:price_tracker/model/constants.dart';
import 'package:price_tracker/model/database.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/app_controller.dart';
import 'view/home_page.dart';

void main() async {
  // Allows for async code in the main method
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(DatabaseAdapter());
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
          home: AnimatedSplashScreen(
            nextScreen: const SplashScreen(),
            duration: 1250,
            splash: const FaIcon(
              FontAwesomeIcons.piggyBank,
              size: 50.0,
              color: Colors.greenAccent,
            ),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: defaultBackgroundColor,
          )),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 1500,
        splash: const FaIcon(
          FontAwesomeIcons.chartLine,
          size: 50.0,
          color: Colors.greenAccent,
        ),
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: defaultBackgroundColor);
  }
}
