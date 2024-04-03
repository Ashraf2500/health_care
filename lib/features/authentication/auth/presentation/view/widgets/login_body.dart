import 'package:flutter/material.dart';
import 'package:health_care/core/core_exports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        CustomBackgroundImage(),
        Padding(
          padding:  EdgeInsets.all(FixedVariables.ScreenPadding32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _heightScreen*0.14,
              ),
              Row(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyleHelper.style24B,
                  ),
                  Text(
                    " Back !",
                    style: TextStyleHelper.style24B.copyWith(color: ColorHelper.mainColor),
                  ),
                ],
              ),

              SizedBox(
                height: _heightScreen*0.01,
              ),
              Text(
                "Sign in",
                style: TextStyleHelper.style16B.copyWith(color: ColorHelper.blackColor.withOpacity(0.7)),
              ),
              SizedBox(
                height: _heightScreen*0.06,
              ),
              CustomTextFormField(
                hintText: "Phone",
                marginVerticalSides: _heightScreen*0.01,
                prefixIcon: Icon(Icons.phone_android,color: ColorHelper.blackColor.withOpacity(0.6),),
                borderColor: ColorHelper.blackColor.withOpacity(0.5),
              ),
              CustomTextFormField(
                hintText: "Password",
                marginVerticalSides: _heightScreen*0.01,
                prefixIcon: Icon(Icons.lock_outline,color: ColorHelper.blackColor.withOpacity(0.6),),
                borderColor: ColorHelper.blackColor.withOpacity(0.5),
              ),
              SizedBox(
                height: _heightScreen*0.01,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    RoutingHelper.navToTakePhone(context);
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScreen*0.13,
              ),
              CustomButton(
                  onPressed: (){
                    RoutingHelper.navToMainScreen(context);
                  },
                  text: "Sign in",

              ),
              SizedBox(
                height: _heightScreen*0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have account ?  ",
                    style: TextStyleHelper.style10B,
                  ),
                  InkWell(
                    onTap: (){
                      RoutingHelper.navToSignUp(context);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyleHelper.style10B.copyWith(
                          color: ColorHelper.mainColor,
                          decoration: TextDecoration.underline ,
                          decorationColor: ColorHelper.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
