import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class TakePhoneBody extends StatelessWidget {
  const TakePhoneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.all(FixedVariables.ScreenPadding32),
      child: Column(
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
                "Forget Your ",
                style: TextStyleHelper.style20B,
              ),
              Text(
                "Password ?",
                style: TextStyleHelper.style20B.copyWith(color: ColorHelper.mainColor),
              ),
            ],
          ),
          SizedBox(
            height: _heightScreen*0.02,
          ),
          Text(
            "Enter your phone number,we will send you configuration code ",
            style: TextStyleHelper.style12B.copyWith(color: ColorHelper.blackColor.withOpacity(0.5)),
          ),
          SizedBox(
            height: _heightScreen*0.08,
          ),
          CustomTextFormField(
            hintText: "Phone",
            marginVerticalSides: _heightScreen*0.01,
            prefixIcon: Icon(Icons.phone_android,color: ColorHelper.blackColor.withOpacity(0.6),),
            borderColor: ColorHelper.blackColor.withOpacity(0.5),
          ),

          SizedBox(
            height: _heightScreen*0.06,
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              onPressed: (){
                RoutingHelper.navToVerificationOtp(context);
              },
              text: "Send Code",



            ),
          ),
        ],
      ),
    );
  }
}
