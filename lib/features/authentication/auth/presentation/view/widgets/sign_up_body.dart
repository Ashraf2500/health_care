import 'package:flutter/material.dart';
import 'package:health_care/core/core_exports.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        //CustomBackgroundGradient(),
        CustomBackgroundImage(),
        Padding(
          padding:  EdgeInsets.all(FixedVariables.ScreenPadding32),
          child: Column(
            children: [
              SizedBox(
                height: _heightScreen*0.14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Create",
                    style: TextStyleHelper.style24B,
                  ),
                  Text(
                    " Account",
                    style: TextStyleHelper.style24B.copyWith(color: ColorHelper.mainColor),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScreen*0.04,
              ),
              CustomTextFormField(
                hintText: "Full name",
                marginVerticalSides: _heightScreen*0.01,
                prefixIcon: Icon(Icons.phone_android,color: ColorHelper.blackColor.withOpacity(0.6),),
                borderColor: ColorHelper.blackColor.withOpacity(0.5),
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
              CustomTextFormField(
                hintText: "Confirm Password",
                marginVerticalSides: _heightScreen*0.01,
                prefixIcon: Icon(Icons.lock_outline,color: ColorHelper.blackColor.withOpacity(0.6),),
                borderColor: ColorHelper.blackColor.withOpacity(0.5),
              ),
              SizedBox(
                height: _heightScreen*0.06,
              ),
              CustomButton(
                onPressed: (){},
                text: "Sign Up",

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
                      RoutingHelper.navToLogin(context);
                    },
                    child: Text(
                      "Sign In",

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