import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medical_challenge/core/core.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function onTap;

  CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 50,
          child: TextButton(
            child: Text(widget.title, style: AppTextStyles.cButtonTextStyle),
            onPressed: () => widget.onTap(),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(AppColors.cSecundaryGradientColor),
            ),
          ),
        ),
      ),
    );
  }
}
