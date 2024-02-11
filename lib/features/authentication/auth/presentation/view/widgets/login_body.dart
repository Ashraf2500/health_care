import 'package:flutter/material.dart';
import 'package:health_care/core/core_exports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

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
                height: _heightScreen*0.08,
              ),
              Text(
                "Welcome",
                style: TextStyleHelper.style24B,
              ),
              SizedBox(
                height: _heightScreen*0.01,
              ),
              Text(
                "Please Sign in to continue",
                style: TextStyleHelper.style16B,
              ),
              SizedBox(
                height: _heightScreen*0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextFormField(
                  hintText: "Phone",
                  borderColor: ColorHelper.blackColor.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextFormField(
                  hintText: "Phone",
                  borderColor: ColorHelper.blackColor.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: _heightScreen*0.05,
              ),
              CustomButton(
                  onPressed: (){},
                  text: "Login"
              ),
            ],
          ),
        ),
      ],
    );
  }
}
