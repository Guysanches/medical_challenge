import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';

class TextSubDetailWidget extends StatelessWidget {
  final String description;

  const TextSubDetailWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.cSubDetailsTextStyle,
      softWrap: true,
    );
  }
}
