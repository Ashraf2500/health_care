import 'package:flutter/material.dart';

class FixedVariables {

  static const double radius4 = 4.0;
  static const double radius8 = 8.0;
  static const double radius12 = 12.0;
  static const double radius16 = 16.0;
  static const double radius24 = 24.0;
  static const double radius100 = 100.0;
  static const double homeTopContainerRadius = 26.0;

  static const double heightButton = 55;
  static const double ScreenPadding32 = 32;
  static const double ScreenPadding22 = 22;
  static const double padding12 = 12;
  static const double ScreenPaddingPercent = 0.08;

  static const int pageTransition = 600;

  static const int countItemOfPerRow = 2;
  static const int initialNumPopularDoctors = 6;
  static const int stepMorePopularDoctor = 6;

  static double  heightScreenQuery (BuildContext context ) => MediaQuery.of(context).size.height;
  static double  widthScreenQuery (BuildContext context ) => MediaQuery.of(context).size.width;

  static double  horizontalPaddingScreen (BuildContext context ) => MediaQuery.of(context).size.width*0.05;


}