import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Notifications",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
        child: Column(
          children: [
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.02,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: todayAppointmentsPatients.length,
                  padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.00),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.015),
                      child: GestureDetector(
                        onTap: (){
                          RoutingHelper.navToReport(context);
                        },
                        child: CustomNotificationItem(
                          index: index,
                          listOfItems: availableAppointmentsDoctors,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
