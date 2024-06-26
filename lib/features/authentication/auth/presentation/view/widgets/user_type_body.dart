import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class UserTypeBody extends StatelessWidget {
  const UserTypeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;

    return Stack(
      children: [
       // CustomBackgroundGradient(),
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
                 "join As",
                 style: TextStyleHelper.style14S,
               ),
               Spacer(),
               CustomButton(
                 onPressed: (){
                   context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.patient);

                   RoutingHelper.navToAuthType(context);
                 },
                 text: "Patient",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
               CustomButton(
                 onPressed: (){
                   context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.doctor);
                   RoutingHelper.navToAuthType(context);
                 },
                 text: "Doctor",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
               CustomButton(
                 onPressed: (){
                   context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.admin);
                   RoutingHelper.navToAuthType(context);
                 },
                 text: "Admin",
                 isOutlined: true,
                 marginVerticalSides: _heightScreen*0.01,
               ),
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
