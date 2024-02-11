import 'package:flutter/material.dart';
import '../../../features_exports.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OnboardingBody(),
    );
  }
}
