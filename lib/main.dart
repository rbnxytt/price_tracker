import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:price_tracker/model/constants.dart';
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
          home: AnimatedSplashScreen(
              duration: 3000,
              splash: const FaIcon(
                FontAwesomeIcons.chartLine,
                size: 50.0,
                color: Colors.greenAccent,
              ),
              nextScreen: const HomePage(),
              splashTransition: SplashTransition.rotationTransition,
              backgroundColor: defaultBackgroundColor)),
    );
  }
}
