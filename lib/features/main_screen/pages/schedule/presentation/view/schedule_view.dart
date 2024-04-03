import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: _heightScreen*0.055,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Schedule",
                style: TextStyleHelper.style16B,
              ),
            ),
          ),
          Container(
            height: _heightScreen * 0.82,
            padding: EdgeInsets.symmetric(
                horizontal: _widthScreen * 0.04, vertical: _heightScreen * 0.028),
            child: ListView.builder(
                itemCount: todayAppointmentsPatients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: _heightScreen*0.006),
                    child: CustomAppointmentItem(
                        index: index,
                        showSpecialist: true,
                        withDetails: true,
                        listOfItems: availableAppointmentsDoctors,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
