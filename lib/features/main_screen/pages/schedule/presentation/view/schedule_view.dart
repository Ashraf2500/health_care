import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: _heightScreen*0.14,
          padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.04),
          decoration: BoxDecoration(
            color: ColorHelper.mainColor,
            borderRadius: BorderRadius.vertical(
            ),

          ),

          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: ColorHelper.whiteColor,
                      size: 26,
                    ),
                    SizedBox(
                      width: FixedVariables.widthScreenQuery(context)*0.02,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyleHelper.style18R.copyWith(color: ColorHelper.whiteColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications_none,
                  color: ColorHelper.whiteColor,
                  size: 26,
                ),
              ],
            ),
          ),

        ),
        Container(
          height: _heightScreen * 0.786,
          padding: EdgeInsets.symmetric(
              horizontal: _widthScreen * 0.04, vertical: _heightScreen * 0.01),
          child: ListView.builder(
              itemCount: todayAppointmentsPatients.length,
              padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(bottom: _heightScreen*0.006),
                  child: CustomAppointmentItem(
                      index: index,
                      showSpecialist: true,
                      withDetails: true,
                      withCancel: true,
                      listOfItems: availableAppointmentsDoctors,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
