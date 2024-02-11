import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class BuildOnboardingDots extends StatelessWidget {
   BuildOnboardingDots({
    Key? key,
    required this.currentOnboarding ,
  }) : super(key: key);
  final int currentOnboarding ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardingData.PagesLottie.length, (index) => Container(
        height: 8,
        width: (currentOnboarding==index)?16:8,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
            color: (currentOnboarding==index)?ColorHelper.mainColor:ColorHelper.mainShadow,
            borderRadius: BorderRadius.circular(20)

        ),
      ),
      ),
    );
  }
}
