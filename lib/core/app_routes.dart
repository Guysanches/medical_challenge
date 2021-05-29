import 'package:flutter/material.dart';
import 'package:medical_challenge/pages/doctor/doctor_page.dart';
import 'package:medical_challenge/pages/home/home_page.dart';
import 'package:medical_challenge/pages/spash/splash_page.dart';

class AppRoutes {
  static String cInitialRoute = '/';

  static Map<String, Widget Function(BuildContext context)> cRoutes = {
    '/': (context) => SplashPage(),
    '/Home': (context) => HomePage(),
    '/Doctors': (context) => DoctorPage()
  };
}
