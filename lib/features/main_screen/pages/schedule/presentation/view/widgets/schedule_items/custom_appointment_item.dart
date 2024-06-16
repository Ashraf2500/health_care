import 'package:flutter/material.dart';
import 'package:health_care/core/utils/check_department_of_doctor_func.dart';
import 'package:health_care/features/features_exports.dart';

enum AppointmentItem {PatientSchedule,PatientTodayAppointments,HistoryAppointments}
class CustomAppointmentItem extends StatelessWidget {
   CustomAppointmentItem({
    Key? key,
     this.SubtitleColor,
     this.backgroundColor,
     this.borderColor,
     this.gradient,
     this.listOfShadow,
     this.withCancel,
     this.withDetails,
     required this.index,
     required this.getPatientAppointmentsData,
     required this.listOfItemsType,


  }) : super(key: key);

   int index ;
   PatientAppointmentData getPatientAppointmentsData;
   Color? SubtitleColor ;
   Color? backgroundColor;
   Color? borderColor;
   Gradient? gradient ;
   List<BoxShadow>? listOfShadow;
   AppointmentItem listOfItemsType;
   bool? withDetails = false;
   bool? withCancel = false;


  @override
  Widget build(BuildContext context) {
     DateTime? dateRegistrationTime = getPatientAppointmentsData.createdAt;
     String dateRegistrationString = getPatientAppointmentsData.createdAt.toString();
     dateRegistrationString = dateRegistrationString.replaceRange(dateRegistrationString.length-5, dateRegistrationString.length, "");

    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(
          child: PatientScheduleDetails(patientAppointmentData: getPatientAppointmentsData),
          type: PageTransitionType.fade,
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: Duration(milliseconds: FixedVariables.pageTransition),
        ));
      },
      child: Container(
        //height: _heightScreen*0.234,
        height:(withDetails==true || withCancel==true)? _heightScreen*0.27 :_heightScreen*0.19,
        //height: _heightScreen*0.24,
        width: _widthScreen,
        decoration: BoxDecoration(
          color: backgroundColor?? ColorHelper.whiteColor,
          gradient: gradient,
          boxShadow:listOfShadow,
          border: Border.all(
            color: borderColor?? ColorHelper.boxShadow.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(FixedVariables.radius12),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.02 ).copyWith(top: _heightScreen*0.015),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: _heightScreen*0.075,
                    width: _widthScreen*.18,
                    //todo
                    //child: CircleAvatar(backgroundImage: NetworkImage("https://graduation-9a7o.onrender.com/src/files/avatar/${listOfItemSchedule[index].doctorData.avatar}")),
                    child: CircleAvatar(backgroundImage: (getPatientAppointmentsData.id=="3423108002482")?AssetImage(ImageHelper.doctor_1):
                    (getPatientAppointmentsData.id=="3425891596959")?AssetImage(ImageHelper.doctor_6):
                    AssetImage(ImageHelper.doctor_16),
                    ),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   image: DecorationImage(
                    //     image: AssetImage(availableAppointmentsDoctors[index].image,
                    //     ),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    width: _widthScreen*0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _heightScreen*0.006,
                      ),
                      Text(
                        "Dr.${getPatientAppointmentsData.doctor?.name}",
                        style: TextStyleHelper.style14B,
                      ),
                      Text(
                        "${getPatientAppointmentsData.doctor?.phone}",
                        style: TextStyleHelper.style12B.copyWith(color:SubtitleColor??ColorHelper.blackColor),
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),

                ],
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Name : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:2 ,
                            ),
                            SizedBox(
                              width: _widthScreen*0.25,
                              child: Text(
                                "${getPatientAppointmentsData.name}",
                                style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Type   : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            SizedBox(
                              width: _widthScreen*0.22,
                              child: Text(
                                "${checkDepartmentOfDoctorFunc(departmentId: getPatientAppointmentsData.doctor?.speciality)}",
                                style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              "Date   : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:2 ,
                            ),
                            Text(
                              "${getPatientAppointmentsData.appDate}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  (listOfItemsType == AppointmentItem.PatientSchedule)
                      ?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.05 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Turn   : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            Text(
                              "${getPatientAppointmentsData.turn}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.05 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            // Icon(Icons.calendar_month,color:ColorHelper.grayText,size: 16,),
                            // // Icon(Icons.calendar_month_outlined,color:dateColor??ColorHelper.grayText,size: 18,),
                            // // Image.asset(ImageHelper.calenderIcon2,width: 14,color: dateColor??ColorHelper.grayText,),
                            // SizedBox(
                            //   width:4 ,
                            // ),

                            Text(
                              "Turn Now  : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            Text(
                              "${getPatientAppointmentsData.turnNow}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.02 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            //Icon(Icons.calendar_month,color:ColorHelper.grayText,size: 16,),
                            // Icon(Icons.calendar_month_outlined,color:dateColor??ColorHelper.grayText,size: 18,),
                            // Image.asset(ImageHelper.calenderIcon2,width: 14,color: dateColor??ColorHelper.grayText,),
                            // SizedBox(
                            //   width:4 ,
                            // ),

                            Text(
                              "Time on turn: ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            Text(
                              "${getPatientAppointmentsData.turnLeftDurationString}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),
                    ],
                  )
                      :(listOfItemsType == AppointmentItem.HistoryAppointments)
                      ?
                  Container(
                    padding: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.05 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: FixedVariables.heightScreenQuery(context)*0.06,
                          width: FixedVariables.widthScreenQuery(context)*0.2,
                          decoration: BoxDecoration(
                            //color: ColorHelper.mainShadow,
                            borderRadius: BorderRadius.circular(FixedVariables.radius8),
                          ),
                          child: Center(
                            child: Text(
                              "Completed",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),
                          ),
                        ),


                      ],
                    ),
                  )
                      :SizedBox()
                  ,
                  SizedBox(
                    width: _widthScreen*0.06,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _heightScreen*0.006,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ),
              child: Row(
                children: [
                  Text(
                    "${dateRegistrationString}",
                    style: TextStyleHelper.style10R.copyWith(color: ColorHelper.grayText),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:(withDetails==true || withCancel==true)?_heightScreen*0.008:0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left:FixedVariables.widthScreenQuery(context)*0.03,
                right:FixedVariables.widthScreenQuery(context)*0.03,
                bottom:FixedVariables.heightScreenQuery(context)*0.01,
              ),
              child: Row(
                mainAxisAlignment: (withDetails==false)?MainAxisAlignment.center:MainAxisAlignment.spaceBetween,
                children: [
                  (withDetails==true)?CustomButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                        child: PatientScheduleDetails(patientAppointmentData: getPatientAppointmentsData,),
                        type: PageTransitionType.fade,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: Duration(milliseconds: FixedVariables.pageTransition),
                      ));
                    },
                    isOutlined: true,
                    text:"Details",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                    heightButton: _heightScreen*0.05,
                    widthButton:  (withCancel==true)?_widthScreen*0.4:_widthScreen*0.83,
                    backgroundColor: ColorHelper.mainColor,
                    outlinedBorderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(FixedVariables.radius8),
                  ):SizedBox(),
                  (withCancel==true)?CustomButton(
                    onPressed: ()async{
                      await context.read<DeleteAppointmentCubit>().deleteAppointment(context: context, appointmentId: getPatientAppointmentsData.id);
                     // context.read<PatientScheduleCubit>().PatientAppointmentInfo;
                    },
                    isOutlined: true,
                    text:(getPatientAppointmentsData.completed!=1)?"Cancel":"Remove",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                    heightButton: _heightScreen*0.05,
                    widthButton: (withDetails==true)?_widthScreen*0.4:_widthScreen*0.83,
                    backgroundColor: ColorHelper.gray300.withOpacity(0.9),
                    outlinedBorderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(FixedVariables.radius8),
                  ):SizedBox(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
