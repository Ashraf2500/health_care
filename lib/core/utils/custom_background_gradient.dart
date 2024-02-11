import 'package:flutter/material.dart';
import '../../features/features_exports.dart';

class CustomBackgroundGradient extends StatelessWidget {
  const CustomBackgroundGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height:_heightScreen,
      decoration: BoxDecoration(
        gradient: ColorHelper.onboardingLinearGradient,
      ),
    );
  }
}