import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPatientsTodayAppointments extends StatelessWidget {
   CustomPatientsTodayAppointments({Key? key}) : super(key: key);

  UserTypeData? _userTypeData;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    _userTypeData = context.read<UserTypeCubit>().userType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Appointments",
          style: TextStyleHelper.style14B,
        ),
        SizedBox(
          height: _heightScreen*0.02,
        ),
        Padding(
          padding:  EdgeInsets.only(right: FixedVariables.ScreenPadding22),
          child:ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: todayAppointmentsPatients.length,
            shrinkWrap: true,
            padding:  EdgeInsets.all(0),
            itemBuilder: (context ,index){
              return  Padding(
                padding:  EdgeInsets.only( bottom: _heightScreen*0.01),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorHelper.gray200,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: Offset(1.5, 1.5),
                        ),
                      ]
                  ),
                  child: CustomAppointmentItem(
                    index: index,
                    withOptions: true,
                    showPhone: (_userTypeData==UserTypeData.admin)?false:true,
                    showSubtitle: (_userTypeData==UserTypeData.admin)?true:false,
                    listOfItems:(_userTypeData==UserTypeData.doctor)?todayAppointmentsPatients:availableAppointmentsDoctors,

                  ),
                ),
              );
            },
          ),
        ),


      ],
    );
  }
}
