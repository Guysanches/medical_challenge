import 'package:flutter/material.dart';
import 'package:medical_challenge/pages/doctor/doctor_page.dart';
import 'package:medical_challenge/pages/home/home_page.dart';
import 'package:medical_challenge/pages/spash/splash_page.dart';

class AppRoutes {
  static final cInitialRoute = '/';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/doctor':
        return MaterialPageRoute(builder: (context) => DoctorPage());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('Error Access Page'),
              ),
            ),
            body: Center(
              child: Text('Page not found'),
            ),
          );
        });
    }
  }
}
