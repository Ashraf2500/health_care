import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      RoutingHelper.navToOnboarding(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageHelper.logoWhite,
            height:heightScreen*0.2,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
              "HEALTH CARE",
              style: TextStyleHelper.style30B
          ),

        ],
      ),
    );
  }
}
