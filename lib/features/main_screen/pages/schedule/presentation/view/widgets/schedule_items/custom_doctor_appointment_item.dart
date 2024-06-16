import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:health_care/features/main_screen/pages/schedule/presentation/manager/confirm_appointment/confirm_appointment_cubit.dart';

enum DoctorAppointmentItem {DoctorSchedule,DoctorTodayAppointments,HistoryAppointments}
class CustomDoctorAppointmentItem extends StatelessWidget {
  CustomDoctorAppointmentItem({
    Key? key,
     this.SubtitleColor,
     this.backgroundColor,
     this.borderColor,
     this.gradient,
     this.listOfShadow,
     this.withCancel,
     this.withDetails,
     required this.index,
     required this.listOfItem,
     required this.listOfItemsType,


  }) : super(key: key);

   int index ;
   List<DoctorAppointmentsData> listOfItem;
   Color? SubtitleColor ;
   Color? backgroundColor;
   Color? borderColor;
   Gradient? gradient ;
   List<BoxShadow>? listOfShadow;
  DoctorAppointmentItem listOfItemsType;
   bool? withDetails = false;
   bool? withCancel = false;


  @override
  Widget build(BuildContext context) {
     DateTime? dateRegistrationTime = listOfItem[index].createdAt;
     String dateRegistrationString = listOfItem[index].createdAt.toString();
     dateRegistrationString = dateRegistrationString.replaceRange(dateRegistrationString.length-5, dateRegistrationString.length, "");


    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(
          child: DoctorScheduleDetails(doctorAppointmentData: listOfItem[index]),
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
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _heightScreen*0.075,
                        width: _widthScreen*.18,
                        child: CircleAvatar(backgroundImage: AssetImage(ImageHelper.person11)),
                        //child: CircleAvatar(backgroundImage: NetworkImage("https://graduation-9a7o.onrender.com/src/files/avatar/${listOfItemSchedule[index].doctorData.avatar}")),
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
                            "${listOfItem[index].name}",
                            style: TextStyleHelper.style14B,
                          ),
                          Text(
                            "${listOfItem[index].phone}",
                            style: TextStyleHelper.style12B.copyWith(color:SubtitleColor??ColorHelper.blackColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                  
                        ],
                      ),
                  
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(
                        child: CreateReport(doctorAppointmentsData: listOfItem[index],),
                        type: PageTransitionType.fade,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: Duration(milliseconds: FixedVariables.pageTransition),

                      ));
                    },
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: FixedVariables.widthScreenQuery(context)*0.18,
                          height: FixedVariables.widthScreenQuery(context)*0.14,
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit_note,size: 40,color: ColorHelper.grayText.withOpacity(0.5),
                          ),
                        )
                    ),
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
                              "Age : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:2 ,
                            ),
                            SizedBox(
                              width: _widthScreen*0.25,
                              child: Text(
                                "${listOfItem[index].age}",
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
                              "Gender : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            Text(
                              "${(listOfItem[index].sex==1)?"Male":"Female"}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
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
                              "Date    : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:2 ,
                            ),
                            Text(
                              "${listOfItem[index].appDate}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  (listOfItemsType == DoctorAppointmentItem.DoctorTodayAppointments|| listOfItemsType == DoctorAppointmentItem.DoctorSchedule)
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
                              "${listOfItem[index].turn}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.03 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "City   : ",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.grayText),
                            ),
                            SizedBox(
                              width:6 ,
                            ),
                            Container(
                              width: _widthScreen*0.24,
                              child: Text(
                                "${listOfItem[index].city}",
                                style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                              ),
                            ),


                          ],
                        ),
                      ),

                    ],
                  )
                      :(listOfItemsType == DoctorAppointmentItem.HistoryAppointments)
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
                      if(listOfItemsType == DoctorAppointmentItem.HistoryAppointments){
                        Navigator.push(context, PageTransition(
                          child: DoctorScheduleDetails(doctorAppointmentData: listOfItem[index]),
                          type: PageTransitionType.fade,
                          curve: Curves.fastEaseInToSlowEaseOut,
                          duration: Duration(milliseconds: FixedVariables.pageTransition),
                        ));
                      }
                      else{
                        context.read<ConfirmAppointmentCubit>().confirmAppointment(context: context, appointmentId: listOfItem[index].id);

                      }
                    },
                    isOutlined: true,
                    text:(listOfItemsType == DoctorAppointmentItem.HistoryAppointments)?"Details":"Confirm",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                    heightButton: (listOfItemsType==DoctorAppointmentItem.DoctorTodayAppointments)?_heightScreen*0.04:_heightScreen*0.05,
                    widthButton: (listOfItemsType==DoctorAppointmentItem.DoctorTodayAppointments)?(withDetails==true)?_widthScreen*0.38:_widthScreen*0.73:(withDetails==true)?_widthScreen*0.4:_widthScreen*0.83,
                    backgroundColor: ColorHelper.mainColor,
                    outlinedBorderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(FixedVariables.radius8),
                  ):SizedBox(),
                  (withCancel==true)?CustomButton(
                    onPressed: (){
                      context.read<DeleteAppointmentCubit>().deleteAppointment(context: context, appointmentId: listOfItem[index].id);
                    },
                    isOutlined: true,
                    text:(listOfItemsType == DoctorAppointmentItem.HistoryAppointments)?"Remove":"Cancel",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                    heightButton: (listOfItemsType==DoctorAppointmentItem.DoctorTodayAppointments)?_heightScreen*0.04:_heightScreen*0.05,
                    widthButton: (listOfItemsType==DoctorAppointmentItem.DoctorTodayAppointments)?(withDetails==true)?_widthScreen*0.38:_widthScreen*0.73:(withDetails==true)?_widthScreen*0.4:_widthScreen*0.83,
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
