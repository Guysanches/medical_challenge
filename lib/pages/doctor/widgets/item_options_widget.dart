import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';

class ItemOptionsWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  const ItemOptionsWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.cItemOptionTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
