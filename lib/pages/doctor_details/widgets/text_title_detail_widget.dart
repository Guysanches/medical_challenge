import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';

class TextTitleDetailWidget extends StatelessWidget {
  final String title;

  const TextTitleDetailWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.cTitleDetailsTextstyle,
    );
  }
}
