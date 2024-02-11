import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class AuthTypeBody extends StatelessWidget {
  const AuthTypeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen =  MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CustomBackgroundGradient(),
        Padding(
          padding:  EdgeInsets.all(FixedVariables.ScreenPadding),
          child: Column(
            children: [
              SizedBox(
                height: _heightScreen*0.1,
              ),
              SvgPicture.asset(ImageHelper.mainLogo),
              SizedBox(
                height: 16,
              ),
              Text(
                "HEALTH CARE",
                style: TextStyleHelper.style14S.copyWith(color: ColorHelper.mainColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Let's get started!",
                style: TextStyleHelper.style14S,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Sign up to enjoy the features we’ve Provided ,and stay healthy!",
                style: TextStyleHelper.style12M.copyWith(color: ColorHelper.grayText),
                textAlign: TextAlign.center,
              ),

              Spacer(),
              CustomButton(
                onPressed: (){
                  RoutingHelper.navToLogin(context);
                },
                text: "Login",
                marginVerticalSides: _heightScreen*0.01,
              ),
              CustomButton(
                onPressed: (){},
                text: "Sign Up",
                isOutlined: true,
                marginVerticalSides: _heightScreen*0.01,
              ),
              SizedBox(
                height: _heightScreen*0.05,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
