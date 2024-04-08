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
          Container(
            height: FixedVariables.heightScreenQuery(context) * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: FixedVariables.widthScreenQuery(context) * 0.04, vertical: FixedVariables.heightScreenQuery(context) * 0.01),
            child: ListView.builder(
                itemCount: todayAppointmentsPatients.length,
                padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.006),
                    child: CustomAppointmentItem(
                      index: index,
                      listOfItems: availableAppointmentsDoctors,
                      showSpecialist: true,
                      withDetails: false,
                      withCancel: false,
                      colorRowDateTime: ColorHelper.mainShadow.withOpacity(0.1),
                      specialistColor: ColorHelper.mainColor,

                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
