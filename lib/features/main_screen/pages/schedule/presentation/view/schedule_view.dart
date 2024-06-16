import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    final _userTypeData =context.read<UserTypeCubit>().userType;
    return Column(
      children: [
        CustomBackAppBar(
          context: context,
          title: "Schedule",
          titleColor: ColorHelper.whiteColor,
          backgroundColor: ColorHelper.mainColor,
          elevation: 4,
          shadowColor: ColorHelper.mainColor,
          hasArrowBack: false,
          appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
        ),
        // Container(
        //   height: _heightScreen*0.11,
        //   padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.04),
        //   decoration: BoxDecoration(
        //     color: ColorHelper.mainColor,
        //     borderRadius: BorderRadius.vertical(
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: ColorHelper.gray100,
        //         blurRadius: 6,
        //         offset: Offset(0, 2),
        //       ),
        //     ],
        //
        //   ),
        //   child: Padding(
        //     padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             Icon(
        //               Icons.calendar_month_outlined,
        //               color: ColorHelper.whiteColor,
        //               size: 26,
        //             ),
        //             SizedBox(
        //               width: FixedVariables.widthScreenQuery(context)*0.02,
        //             ),
        //             Text(
        //               "Schedule",
        //               style: TextStyleHelper.style18R.copyWith(color: ColorHelper.whiteColor),
        //             ),
        //           ],
        //         ),
        //         Icon(
        //           Icons.notifications_none,
        //           color: ColorHelper.whiteColor,
        //           size: 26,
        //         ),
        //       ],
        //     ),
        //   ),
        //
        // ),
        (_userTypeData==UserTypeData.patient )
            ?PatientSchedule()
            :(_userTypeData==UserTypeData.doctor)
            ?DoctorSchedule()
            :AdminSchedule(),


      ],
    );
  }
}
