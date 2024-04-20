import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HistoryAppointments extends StatelessWidget {
  const HistoryAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "History",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Column(
        children: [
          // Container(
          //   height: FixedVariables.heightScreenQuery(context)*0.12,
          //   padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.04),
          //   margin: EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.004),
          //   decoration: BoxDecoration(
          //     color: ColorHelper.mainColor,
          //     borderRadius: BorderRadius.vertical(
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.grey.shade500,
          //           spreadRadius: 1,
          //           blurRadius: 6,
          //           offset: const Offset(0, 4)
          //       ),
          //     ],
          //   ),
          //
          //   child: Padding(
          //     padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         // SizedBox(
          //         //   width: FixedVariables.widthScreenQuery(context)*0.1
          //         // ),
          //         Text(
          //           "Schedule",
          //           style: TextStyleHelper.style18B.copyWith(color: ColorHelper.whiteColor),
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
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: FixedVariables.heightScreenQuery(context) * 0.01),
              child: ListView.builder(
                  itemCount: todayAppointmentsPatients.length,
                  padding: EdgeInsets.only(
                      top: FixedVariables.heightScreenQuery(context) * 0.02),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                      ).copyWith(bottom: FixedVariables.heightScreenQuery(context) * 0.015),
                      child: GestureDetector(
                        onTap: (){
                          RoutingHelper.navToReport(context);
                        },
                        child: CustomAppointmentItem(
                          index: index,
                          listOfItems: availableAppointmentsDoctors,
                          showSubtitle: true,
                          withDetails: false,
                          withCancel: false,
                          gradient:  LinearGradient(
                            colors: [
                              ColorHelper.gray100,
                              ColorHelper.whiteColor,
                              ColorHelper.whiteColor,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          listOfShadow: [
                            BoxShadow(
                              color: ColorHelper.gray200,
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: Offset(2, 1.5),
                            ),
                          ],
                          SubtitleColor: ColorHelper.mainColor,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
