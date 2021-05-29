import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_challenge/core/core.dart';

class AppTextStyles {
  static final TextStyle cHeadingTextStyle = GoogleFonts.poppins(
    color: AppColors.cTextDefaultColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle cTitleTextstyle = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.cTitleTextColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle cSubTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.cTextDefaultColor,
  );
}
