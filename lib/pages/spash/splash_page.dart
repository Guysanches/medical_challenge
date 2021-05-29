import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logo,
                width: 128,
                height: 128,
              ),
              Text(
                'Medical Challenge',
                style: AppTextStyles.cHeadingTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
