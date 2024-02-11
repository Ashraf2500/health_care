import 'package:flutter/material.dart';
import 'package:health_care/core/core_exports.dart';

class UserTypeBody extends StatelessWidget {
  const UserTypeBody({Key? key}) : super(key: key);

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
                 "join As",
                 style: TextStyleHelper.style14S,
               ),
               SizedBox(
                 height: _heightScreen*0.1,
               ),
               CustomButton(
                 onPressed: (){
                   RoutingHelper.navToAuthType(context);
                 },
                 text: "User",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
               CustomButton(
                 onPressed: (){
                   RoutingHelper.navToAuthType(context);
                 },
                 text: "Doctor",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
               CustomButton(
                 onPressed: (){
                   RoutingHelper.navToAuthType(context);
                 },
                 text: "Admin",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
             ],
          ),
        ),
      ],
    );
  }
}
