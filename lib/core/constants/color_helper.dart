import 'package:flutter/material.dart';

class ColorHelper {

  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);
  static const backWhiteColor = Color(0xffF9F9F9);


  static const mainColor = Color(0xff0A828A);
  static const mainShadow = Color(0xffc7e9eb);


  static const mainText = blackColor;
  static const whiteText = whiteColor;
  static const tealText = mainColor;
  static const grayText = Color(0xff6D6565);
  static const steelBlueText = Color(0xff677294);

  static const activeStar = Color(0xffF6D060);
  static const noActiveStar = Color(0xffE2E5EA);

  static const messageSend = Color(0xff0B8FAC);
  static const messageReceive = Color(0xffD9D9D9);

  static const redColor = Colors.red;

  static const onboardingLinearGradient = LinearGradient(
    colors: [
      mainShadow,
      backWhiteColor,
      backWhiteColor,
      backWhiteColor,
      mainShadow,

    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,


  );








}