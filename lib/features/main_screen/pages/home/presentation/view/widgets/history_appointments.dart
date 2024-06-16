import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HistoryAppointments extends StatelessWidget {
  const HistoryAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    final _userTypeData =context.read<UserTypeCubit>().userType;
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
      body:  Column(
        children: [
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

          (_userTypeData==UserTypeData.patient)?BlocBuilder<PatientScheduleCubit,PatientScheduleState>(
              builder: (context,patientHistoryState) {
                if(patientHistoryState is LoadingGetPatientAppointmentsState){
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
                                          width: _widthScreen*0.38,
                                          height: _heightScreen*0.04,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                          ),
                                        ),
                                        Container(
                                          width: _widthScreen*0.38,
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
                else if(patientHistoryState is SuccessGetPatientAppointmentsState){
                  return BlocBuilder<DeleteAppointmentCubit,DeleteAppointmentState>(
                    builder: (context ,deleteAppointmentPatientState) {
                      return Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.01, horizontal: _widthScreen*0.01),
                          child: RefreshIndicator(
                            onRefresh: ()async{
                              await context.read<PatientScheduleCubit>().getUerAppointments(context: context );
                            },
                            child: (patientHistoryState.patientAppointmentsCompleted.isEmpty)
                                ?Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      context.read<PatientScheduleCubit>().getUerAppointments(context: context);
                                    },
                                    child: Icon(Icons.refresh,color: ColorHelper.grayText.withOpacity(0.3),size: 30,),
                                  ),
                                  SizedBox(height: _heightScreen*0.04,),
                                  Lottie.asset(ImageHelper.empty_state),
                                  SizedBox(height: _heightScreen*0.04,),
                                  Text(
                                    "There is no any appointment ",
                                    style: TextStyleHelper.style14B.copyWith(color: ColorHelper.gray300),
                                  ),
                                ],
                              ),
                            )
                                :Stack(
                                  children: [
                                    ListView.builder(
                                    itemCount: patientHistoryState.patientAppointmentsCompleted.length,
                                    padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:  EdgeInsets.only(
                                          left: _widthScreen * 0.04,
                                          right: _widthScreen * 0.04,
                                          bottom: _heightScreen*0.012,
                                        ),
                                        child: CustomAppointmentItem(
                                          listOfItemsType: AppointmentItem.HistoryAppointments,
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
                                          getPatientAppointmentsData: patientHistoryState.patientAppointmentsCompleted[index],
                                          //listOfItems: availableAppointmentsDoctors,
                                        ),
                                      );
                                    }),
                                    (deleteAppointmentPatientState is LoadingDeleteAppointmentState)?Container(
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
                                    ):SizedBox(),
                                  ],
                                ),
                          ),
                        ),
                      );
                    }
                  );
                }
                else{
                  return Center(child: Text("Error")); //todo);
                }

              }
          ):
          (_userTypeData==UserTypeData.doctor)?BlocBuilder<GetDoctorAppointmentsCubit,GetDoctorAppointmentsState>(
              builder: (context,DoctorAppointmentsHistoryState) {
                if(DoctorAppointmentsHistoryState is LoadingDoctorAppointmentsAppointmentsState){
                  return  Container(
                    height: _heightScreen*0.8,
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
                                          width: _widthScreen*0.38,
                                          height: _heightScreen*0.04,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                          ),
                                        ),
                                        Container(
                                          width: _widthScreen*0.38,
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
                else if(DoctorAppointmentsHistoryState is SuccessDoctorAppointmentsAppointmentsState){
                  return BlocBuilder<DeleteAppointmentCubit,DeleteAppointmentState>(
                    builder: (context,deleteAppointmentDoctorState) {
                      return Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.01, horizontal: _widthScreen*0.01),
                          child: RefreshIndicator(
                            onRefresh: ()async{
                              await context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context);
                            },
                            child:Stack(
                                  children: [
                                    ((DoctorAppointmentsHistoryState.doctorAppointmentsCompleted.isNotEmpty))
                                        ?ListView.builder(
                                    itemCount: DoctorAppointmentsHistoryState.doctorAppointmentsCompleted.length,
                                    padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:  EdgeInsets.only(
                                          left: _widthScreen * 0.04,
                                          right: _widthScreen * 0.04,
                                          bottom: _heightScreen*0.012,
                                        ),
                                        child: CustomDoctorAppointmentItem(
                                          listOfItemsType: DoctorAppointmentItem.HistoryAppointments,
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
                                          listOfItem: DoctorAppointmentsHistoryState.doctorAppointmentsCompleted,
                                          //listOfItems: availableAppointmentsDoctors,
                                        ),
                                      );
                                    })
                                        :Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context);
                                  },
                                  child: Icon(Icons.refresh,color: ColorHelper.grayText.withOpacity(0.3),size: 30,),
                                ),
                                SizedBox(height: _heightScreen*0.04,),
                                Lottie.asset(ImageHelper.empty_state),
                                SizedBox(height: _heightScreen*0.04,),
                                Text(
                                  "There is no any appointment ",
                                  style: TextStyleHelper.style14B.copyWith(color: ColorHelper.gray300),
                                ),
                              ],
                            ),
                          ),
                                    (deleteAppointmentDoctorState is LoadingDeleteAppointmentState)?Container(
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
                                    ):SizedBox(),
                                  ],
                                )

                          ),
                        ),
                      );
                    }
                  );
                }
                else{
                  return Center(child: Text("Error")); //todo);
                }

              }
          ):SizedBox(),
        ],
      ),
    );
  }
}
