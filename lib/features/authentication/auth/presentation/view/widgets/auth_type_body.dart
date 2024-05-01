import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class AuthTypeBody extends StatelessWidget {
   AuthTypeBody({Key? key}) : super(key: key);

  UserType? _userType;
  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    _userType = context.read<UserCubit>().userType;

    return Stack(
      children: [
        //CustomBackgroundGradient(),
        Padding(
          padding:  EdgeInsets.all(FixedVariables.ScreenPadding32),
          child: Column( 
            children: [
              SizedBox(
                height: _heightScreen*0.15,
              ),
              SvgPicture.asset(
                ImageHelper.mainLogo,
                height: _heightScreen*0.15,
              ),
              SizedBox(
                height: _heightScreen*0.014,
              ),
              Text(
                "HEALTH CARE",
                style: TextStyleHelper.style14S.copyWith(color: ColorHelper.mainColor),
              ),
              SizedBox(
                height: _heightScreen*0.01,
              ),
              Text(
                "Let's get started!",
                style: TextStyleHelper.style14S,
              ),
              /*SizedBox(
                height: _heightScreen*0.01,
              ),
              Text(
                "Sign up to enjoy the features we’ve Provided ,and stay healthy!",
                style: TextStyleHelper.style12M.copyWith(color: ColorHelper.grayText),
                textAlign: TextAlign.center,
              ),*/

              Spacer(),
              CustomButton(
                onPressed: (){
                  RoutingHelper.navToLogin(context);
                },
                text: "Login",
                marginVerticalSides: _heightScreen*0.01,
              ),
              (_userType==UserType.patient)?CustomButton(
                onPressed: (){
                  RoutingHelper.navToSignUp(context);
                },
                text: "Sign Up",
                isOutlined: true,
                marginVerticalSides: _heightScreen*0.01,
              ):SizedBox(),
              SizedBox(
                height: _heightScreen*0.06,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
