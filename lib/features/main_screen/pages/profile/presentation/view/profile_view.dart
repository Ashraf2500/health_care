import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingBottomCustomProfileRow = FixedVariables.heightScreenQuery(context)*0.004;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: FixedVariables.heightScreenQuery(context)*0.155,
            color: ColorHelper.mainColor,
            padding: EdgeInsets.only(
            top: FixedVariables.heightScreenQuery(context)*0.065,
            left: FixedVariables.widthScreenQuery(context)*0.02,
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: FixedVariables.heightScreenQuery(context)*0.08,
                  width: FixedVariables.widthScreenQuery(context)*0.2,
                  decoration: BoxDecoration(
                    color: ColorHelper.whiteColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImageHelper.person12),
                      fit:BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                    left: FixedVariables.widthScreenQuery(context)*0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Youssef Frostbit",
                        style: TextStyleHelper.style18M.copyWith(color: ColorHelper.whiteColor),
                      ),
                      Text(
                        "01022365658",
                        style: TextStyleHelper.style14R.copyWith(color: ColorHelper.whiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: FixedVariables.heightScreenQuery(context)*0.03,
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.personFillIcon,
            title:"General Details",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){
              RoutingHelper.navToProfileGeneralInfo(context);
            },
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.scheduleFillIcon,
            title:"My Schedule",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.historyFillIcon,
            title:"History",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.notificationFillIcon,
            title:"Notification",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.rateFillIcon,
            title:"Rate App",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.phoneFillIcon,
            title:"Contact us for Support",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.shareIcon,
            title:"Share App",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){},
          ),
          CustomProfileRowFeature(
            iconSvg:ImageHelper.logoutFillIcon,
            title:"Sign Out",
            paddingBottom: paddingBottomCustomProfileRow,
            onPressed: (){
              RoutingHelper.navToUserType(context);
            },
          ),
      
        ],
      ),
    );
  }
}




