import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class VerificationOtpBody extends StatelessWidget {
  const VerificationOtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen =  MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(FixedVariables.ScreenPadding),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _heightScreen*0.05,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: ColorHelper.mainColor,size: 25,),
              ),
              SizedBox(
                height: _heightScreen*0.04,
              ),
              Row(
                children: [
                  Text(
                    "Enter Verification ",
                    style: TextStyleHelper.style20B,
                  ),
                  Text(
                    "Code",
                    style: TextStyleHelper.style20B.copyWith(color: ColorHelper.mainColor),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScreen*0.02,
              ),
              Text(
                "Enter code that we sent to your number 0102299**** ",
                style: TextStyleHelper.style12B.copyWith(color: ColorHelper.blackColor.withOpacity(0.5)),
              ),
              SizedBox(
                height: _heightScreen*0.08,
              ),

              CustomPinOtpFields(),
              SizedBox(
                height: _heightScreen*0.06,
              ),
              Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  onPressed: (){
                    RoutingHelper.navToChangePassword(context);
                  },
                  text: "Verify",



                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
