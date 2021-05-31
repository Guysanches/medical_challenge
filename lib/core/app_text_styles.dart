import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_challenge/core/core.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class AppTextStyles {
  static final TextStyle cHeadingTextStyle = GoogleFonts.poppins(
    color: AppColors.cTextDefaultColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle cTitleTextstyle = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.cTextDarkColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle cTitleDetailsTextstyle = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.cTextDarkColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle cSubDetailsTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.cTextDarkColor,
  );
  static final TextStyle cSubTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.cTextDarkColor,
  );

  static final TextStyle cFirstCaracterTextStyle = GoogleFonts.poppins(
    fontSize: 28,
    color: AppColors.cTextDefaultColor,
  );

  static final TextStyle cItemOptionTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.cTextDefaultColor,
  );

  static final TextStyle cButtonTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.cTextDefaultColor,
  );
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
