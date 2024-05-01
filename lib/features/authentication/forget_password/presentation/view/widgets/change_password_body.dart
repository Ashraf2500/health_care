import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

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
                "Create New ",
                style: TextStyleHelper.style20B,
              ),
              Text(
                "Password",
                style: TextStyleHelper.style20B.copyWith(color: ColorHelper.mainColor),
              ),
            ],
          ),
          SizedBox(
            height: _heightScreen*0.02,
          ),
          Text(
            "Create your new password to login ",
            style: TextStyleHelper.style12B.copyWith(color: ColorHelper.blackColor.withOpacity(0.5)),
          ),
          SizedBox(
            height: _heightScreen*0.08,
          ),
          CustomTextFormField(
            hintText: "Password",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.visibility_rounded,size: 22,color: ColorHelper.grayText.withOpacity(0.8),),
            ),
            marginVerticalSides: _heightScreen*0.01,
            prefixIcon: Icon(Icons.lock_outline_rounded,color: ColorHelper.blackColor.withOpacity(0.6),),
            borderColor: ColorHelper.blackColor.withOpacity(0.5),
          ),
          CustomTextFormField(
            hintText: "Confirm Password",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.visibility_rounded,size: 22,color: ColorHelper.grayText.withOpacity(0.8),),
            ),
            marginVerticalSides: _heightScreen*0.01,
            prefixIcon: Icon(Icons.lock_outline_rounded,color: ColorHelper.blackColor.withOpacity(0.6),),
            borderColor: ColorHelper.blackColor.withOpacity(0.5),
          ),

          SizedBox(
            height: _heightScreen*0.06,
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              onPressed: (){
                RoutingHelper.navToLoginReplace(context);
              },
              text: "Create",



            ),
          ),
        ],
      ),
    );
  }
}
