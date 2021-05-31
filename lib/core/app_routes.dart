import 'package:flutter/material.dart';
import 'package:medical_challenge/pages/doctor/doctor_page.dart';
import 'package:medical_challenge/pages/doctor_details/doctor_details_page.dart';
import 'package:medical_challenge/pages/doctor_form/doctor_form.dart';
import 'package:medical_challenge/pages/home/home_page.dart';
import 'package:medical_challenge/pages/spash/splash_page.dart';
import 'package:medical_challenge/shared/models/doctor_model.dart';

class Details {
  final DoctorModel item;

  Details(this.item);
}

class FormArg {
  final String id;

  FormArg(this.id);
}

class AppRoutes {
  static final cInitialRoute = '/';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/doctor':
        return MaterialPageRoute(builder: (context) => DoctorPage());
      case '/doctordetails':
        return MaterialPageRoute(builder: (context) {
          Details cData = args as Details;
          return DoctorDetailsPage(item: cData.item);
        });
      case '/doctorform':
        return MaterialPageRoute(builder: (context) {
          FormArg cData = args as FormArg;
          return DoctorForm(id: cData.id);
        });
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
