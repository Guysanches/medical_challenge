import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_challenge/core/core.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.cBackGroundColor,
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: AppColors.cTextBodyColor,
            ),
          ),
        ),
        title: "Medical Challenge",
        routes: AppRoutes.cRoutes,
        initialRoute: AppRoutes.cInitialRoute);
  }
}
