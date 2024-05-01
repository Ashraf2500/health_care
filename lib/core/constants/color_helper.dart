import 'package:flutter/material.dart';

class ColorHelper {

  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);
  static const backWhiteColor = Color(0xffF9F9F9);
  //static const backWhiteColor = Color(0xfff2f2f2);


  static const mainColor = Color(0xff0A828A);
  static const mainShadow = Color(0xffc7e9eb);


  static const mainText = blackColor;
  static const whiteText = whiteColor;
  static const tealText = mainColor;
  static const grayText = Color(0xff6D6565);
  static const steelBlueText = Color(0xff677294);

  static const activeStar = Color(0xffF6D060);
  static const noActiveStar = Color(0xffd3d7df);

  static const messageSend = Color(0xff0B8FAC);
  static const messageReceive = Color(0xffD9D9D9);

  static const redColor = Colors.red;
  static const greenColor = Colors.green;

  static const boxShadow = Color(0xFF757575);
  static const backgroundSearchBar = Color(0xffecf8f8);

  static Color gray300 = Colors.grey.shade300;
  static Color gray200 = Colors.grey.shade200;
  static Color gray100 = Colors.grey.shade100;

  static const onboardingLinearGradient = LinearGradient(
    colors: [
      mainShadow,
      backWhiteColor,
      backWhiteColor,
      backWhiteColor,
      backWhiteColor,
      backWhiteColor,
      mainShadow,

    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,

  );

  final shadowLinearGradient = LinearGradient(
    colors: [
      ColorHelper.gray200,
      ColorHelper.gray100,
      ColorHelper.whiteColor,
      ColorHelper.whiteColor,
      ColorHelper.whiteColor,

    ],
  );








}