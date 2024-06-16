import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPatientsTodayAppointments extends StatelessWidget {
   CustomPatientsTodayAppointments({Key? key}) : super(key: key);

  UserTypeData? _userTypeData;

  @override
  Widget build(BuildContext context) {
    final double _widthScreen = MediaQuery.of(context).size.width;
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
        (_userTypeData==UserTypeData.doctor)?BlocBuilder<GetDoctorAppointmentsCubit,GetDoctorAppointmentsState>(
            builder: (context,stateGetTodayDoctor) {
              if(stateGetTodayDoctor is LoadingDoctorAppointmentsAppointmentsState){
                return Container(
                  height: _heightScreen*0.86,
                  width: _widthScreen,
                  padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.02, horizontal: _widthScreen*0.04),
                  child: Shimmer.fromColors(
                    baseColor: ColorHelper.gray300,
                    highlightColor: ColorHelper.gray100,
                    child: Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 5,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: _heightScreen*0.01,
                            ),
                            margin: EdgeInsets.only(
                              bottom: _heightScreen*0.01,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorHelper.gray100.withOpacity(0.5),width: 2),
                              borderRadius: BorderRadius.circular(FixedVariables.radius12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: _widthScreen*0.2,
                                      height: _heightScreen*0.06,
                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                      decoration: BoxDecoration(
                                        color: ColorHelper.gray200,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: _widthScreen*0.3,
                                          height: _heightScreen*0.01,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                          ),
                                        ),
                                        Container(
                                          width: _widthScreen*0.3,
                                          height: _heightScreen*0.01,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: _heightScreen*0.01,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: _widthScreen*0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: _widthScreen*0.1,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),

                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: _widthScreen*0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: _widthScreen*0.34,
                                        height: _heightScreen*0.04,
                                        margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                        decoration: BoxDecoration(
                                          color: ColorHelper.gray200,
                                          borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                        ),
                                      ),
                                      Container(
                                        width: _widthScreen*0.34,
                                        height: _heightScreen*0.04,
                                        margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                        decoration: BoxDecoration(
                                          color: ColorHelper.gray200,
                                          borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              else if(stateGetTodayDoctor is SuccessDoctorAppointmentsAppointmentsState){
                return BlocBuilder<ConfirmAppointmentCubit,ConfirmAppointmentState>(
                  builder: (context,ConfirmDoctorTodayState) {
                    return BlocBuilder<DeleteAppointmentCubit,DeleteAppointmentState>(
                      builder: (context , cancelDoctorTodayState) {
                        return RefreshIndicator(
                          onRefresh: ()async{
                            await context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context );
                          },
                          child: Stack(
                            children: [
                              Stack(
                                children: [
                                  (stateGetTodayDoctor.doctorAppointmentsNotCompletedToday.isNotEmpty)?ListView.builder(
                                       shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: stateGetTodayDoctor.doctorAppointmentsNotCompletedToday.length,
                                      padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                           // RoutingHelper.navToCreateReport(context);
                                            Navigator.push(context, PageTransition(
                                              child: DoctorScheduleDetails(doctorAppointmentData:stateGetTodayDoctor.doctorAppointmentsNotCompletedToday[index]),
                                              type: PageTransitionType.fade,
                                              curve: Curves.fastEaseInToSlowEaseOut,
                                              duration: Duration(milliseconds: FixedVariables.pageTransition),
                                            ));
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.only(
                                              left: _widthScreen * 0.04,
                                              right: _widthScreen * 0.04,
                                              bottom: _heightScreen*0.012,
                                            ),
                                            child: CustomDoctorAppointmentItem(
                                              listOfItemsType: DoctorAppointmentItem.DoctorTodayAppointments,
                                              index: index,
                                              withDetails: true,
                                              withCancel: true,
                                              borderColor: ColorHelper.gray200,
                                              listOfShadow: [
                                                BoxShadow(
                                                  color: ColorHelper.gray200,
                                                  blurRadius: 4,
                                                  spreadRadius: 1,
                                                  offset: Offset(3, 1.5),
                                                ),
                                              ],
                                              listOfItem: stateGetTodayDoctor.doctorAppointmentsNotCompletedToday,
                                              //listOfItems: availableAppointmentsDoctors,
                                            ),
                                          ),
                                        );
                                      })
                                      :Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: _heightScreen*0.05,),
                                        Lottie.asset(ImageHelper.empty_state,width: _widthScreen*0.2),
                                        SizedBox(height: _heightScreen*0.02,),
                                        Text(
                                          "There is no any appointment today",
                                          style: TextStyleHelper.style12B.copyWith(color: ColorHelper.gray300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (ConfirmDoctorTodayState is LoadingConfirmAppointmentState)?Container(
                                    height:  _heightScreen*0.4 * stateGetTodayDoctor.doctorAppointmentsNotCompletedToday.length,
                                    width: _widthScreen,
                                    decoration: BoxDecoration(
                                      color: ColorHelper.blackColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(FixedVariables.radius4),
                                    ),
                                    child: Center(
                                      child: Container(
                                          height: _heightScreen*0.1,
                                          width: _widthScreen*0.2,
                                          decoration: BoxDecoration(
                                            color: ColorHelper.grayText.withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                          ),
                                          child: Center(child: CircularProgressIndicator(strokeWidth: 5,))
                                      ),
                                    ),
                                  ):SizedBox(),
                                ],
                              ),
                              (cancelDoctorTodayState is LoadingDeleteAppointmentState)
                                  ?Container(
                                height: _heightScreen*0.86,
                                width: _widthScreen,
                                decoration: BoxDecoration(
                                  color: ColorHelper.blackColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(FixedVariables.radius4),
                                ),
                                child: Center(
                                  child: Container(
                                      height: _heightScreen*0.1,
                                      width: _widthScreen*0.2,
                                      decoration: BoxDecoration(
                                        color: ColorHelper.grayText.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                      ),
                                      child: Center(child: CircularProgressIndicator(strokeWidth: 5,))
                                  ),
                                ),
                              )
                                  :SizedBox(),
                            ],
                          ),
                        );
                      }
                    );
                  }
                );
              }
              else{
                return Center(child: Text("Error")); //todo);
              }

            }
        )


            :(_userTypeData==UserTypeData.admin)?BlocBuilder<GetAllAppointmentsCubit,GetAllAppointmentsState>(
            builder: (context,stateGetTodayAllAppointment) {
              if(stateGetTodayAllAppointment is LoadingGetAllAppointmentsState){
                return Container(
                  height: _heightScreen*0.86,
                  width: _widthScreen,
                  padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.02, horizontal: _widthScreen*0.04),
                  child: Shimmer.fromColors(
                    baseColor: ColorHelper.gray300,
                    highlightColor: ColorHelper.gray100,
                    child: Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 5,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: _heightScreen*0.01,
                            ),
                            margin: EdgeInsets.only(
                              bottom: _heightScreen*0.01,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorHelper.gray100.withOpacity(0.5),width: 2),
                              borderRadius: BorderRadius.circular(FixedVariables.radius12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: _widthScreen*0.2,
                                      height: _heightScreen*0.06,
                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                      decoration: BoxDecoration(
                                        color: ColorHelper.gray200,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: _widthScreen*0.3,
                                          height: _heightScreen*0.01,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                          ),
                                        ),
                                        Container(
                                          width: _widthScreen*0.3,
                                          height: _heightScreen*0.01,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: _heightScreen*0.01,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: _widthScreen*0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: _widthScreen*0.1,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),

                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                          Container(
                                            width: _widthScreen*0.3,
                                            height: _heightScreen*0.01,
                                            margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                            decoration: BoxDecoration(
                                              color: ColorHelper.gray200,
                                              borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: _widthScreen*0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: _widthScreen*0.34,
                                        height: _heightScreen*0.04,
                                        margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                        decoration: BoxDecoration(
                                          color: ColorHelper.gray200,
                                          borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                        ),
                                      ),
                                      Container(
                                        width: _widthScreen*0.34,
                                        height: _heightScreen*0.04,
                                        margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                        decoration: BoxDecoration(
                                          color: ColorHelper.gray200,
                                          borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              else if(stateGetTodayAllAppointment is SuccessGetAllAppointmentsState){
                return BlocBuilder<DeleteAppointmentCubit,DeleteAppointmentState>(
                    builder: (context , cancelAdminTodayState) {
                      return RefreshIndicator(
                        onRefresh: ()async{
                          await context.read<GetAllAppointmentsCubit>().geAllAppointments(context: context );
                        },
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                (stateGetTodayAllAppointment.allAppointmentsNotCompletedToday.isNotEmpty)?ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: stateGetTodayAllAppointment.allAppointmentsNotCompletedToday.length,
                                    padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          // RoutingHelper.navToCreateReport(context);
                                          Navigator.push(context, PageTransition(
                                            child: AdminScheduleDetails(allAppointmentData:stateGetTodayAllAppointment.allAppointmentsNotCompletedToday[index]),
                                            type: PageTransitionType.fade,
                                            curve: Curves.fastEaseInToSlowEaseOut,
                                            duration: Duration(milliseconds: FixedVariables.pageTransition),
                                          ));
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.only(
                                            left: _widthScreen * 0.04,
                                            right: _widthScreen * 0.04,
                                            bottom: _heightScreen*0.012,
                                          ),
                                          child: CustomAdminAppointmentItem(
                                            listOfItemsType: AdminAppointmentItem.AdminTodayAppointments,
                                            index: index,
                                            withDetails: true,
                                            withCancel: true,
                                            borderColor: ColorHelper.gray200,
                                            listOfShadow: [
                                              BoxShadow(
                                                color: ColorHelper.gray200,
                                                blurRadius: 4,
                                                spreadRadius: 1,
                                                offset: Offset(3, 1.5),
                                              ),
                                            ],
                                            listOfItem: stateGetTodayAllAppointment.allAppointmentsNotCompletedToday,
                                            //listOfItems: availableAppointmentsDoctors,
                                          ),
                                        ),
                                      );
                                    })
                                    :Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: _heightScreen*0.05,),
                                      Lottie.asset(ImageHelper.empty_state,width: _widthScreen*0.2),
                                      SizedBox(height: _heightScreen*0.02,),
                                      Text(
                                        "There is no any appointment today",
                                        style: TextStyleHelper.style12B.copyWith(color: ColorHelper.gray300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            (cancelAdminTodayState is LoadingDeleteAppointmentState)
                                ?Container(
                              height: _heightScreen*0.3 *stateGetTodayAllAppointment.allAppointmentsNotCompletedToday.length,
                              width: _widthScreen,
                              decoration: BoxDecoration(
                                color: ColorHelper.blackColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(FixedVariables.radius4),
                              ),
                              child: Center(
                                child: Container(
                                    height: _heightScreen*0.1,
                                    width: _widthScreen*0.2,
                                    decoration: BoxDecoration(
                                      color: ColorHelper.grayText.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                    ),
                                    child: Center(child: CircularProgressIndicator(strokeWidth: 5,))
                                ),
                              ),
                            )
                                :SizedBox(),
                          ],
                        ),
                      );
                    }
                );
              }
              else{
                return Center(child: Text("Error")); //todo);
              }

            }
        )
            :SizedBox()
        // (_userTypeData==UserTypeData.admin)? BlocBuilder<PatientScheduleCubit,PatientScheduleState>(
        //     builder: (context,patientTodayAppointmentState) {
        //       if(patientTodayAppointmentState is LoadingGetPatientAppointmentsState){
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       else if(patientTodayAppointmentState is SuccessGetPatientAppointmentsState){
        //         return RefreshIndicator(
        //           onRefresh: ()async{
        //             String currentUserId= await context.read<CurrentUserDataCubit>().currentUserId!;
        //             await context.read<PatientScheduleCubit>().getUerAppointments(context: context);
        //
        //           },
        //           child: ListView.builder(
        //               shrinkWrap: true,
        //               physics: NeverScrollableScrollPhysics(),
        //               itemCount: patientTodayAppointmentState.getPatientAppointmentsData.length,
        //               padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding:  EdgeInsets.only(
        //                     left: _widthScreen * 0.04,
        //                     right: _widthScreen * 0.04,
        //                     bottom: _heightScreen*0.012,
        //                   ),
        //                   child: CustomAdminAppointmentItem(
        //                     listOfItemsType: AdminAppointmentItem.AdminTodayAppointments,
        //                     index: index,
        //                     withDetails: true,
        //                     withCancel: true,
        //                     borderColor: ColorHelper.gray200,
        //                     listOfShadow: [
        //                       BoxShadow(
        //                         color: ColorHelper.gray200,
        //                         blurRadius: 4,
        //                         spreadRadius: 1,
        //                         offset: Offset(3, 1.5),
        //                       ),
        //                     ],
        //                     listOfItem: patientTodayAppointmentState.getPatientAppointmentsData,
        //                     //listOfItems: availableAppointmentsDoctors,
        //                   ),
        //                 );
        //               }),
        //         );
        //       }
        //       else{
        //         return Center(child: Text("Error")); //todo);
        //       }
        //
        //     }
        // ):SizedBox(),
      ],
    );
  }
}
