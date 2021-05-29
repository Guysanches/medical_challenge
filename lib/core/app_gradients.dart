import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';

class AppGradients {
  static final linear = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      AppColors.cSecundaryGradientColor,
      AppColors.cPrimaryGradientColor,
    ],
  );
}
