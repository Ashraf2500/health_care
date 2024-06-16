import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class AdminSchedule extends StatelessWidget {
  const AdminSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    final _userTypeData =context.read<UserTypeCubit>().userType;

    return BlocBuilder<GetAllAppointmentsCubit,GetAllAppointmentsState>(
        builder: (context,allAppointmentState) {
          if(allAppointmentState is LoadingGetAllAppointmentsState){
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
          else if(allAppointmentState is SuccessGetAllAppointmentsState){
            return Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.01, horizontal: _widthScreen*0.01),
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await context.read<GetAllAppointmentsCubit>().geAllAppointments(context: context);
                  },
                  child: ListView.builder(
                      itemCount: allAppointmentState.allAppointmentsNotCompleted.length,
                      padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.02),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(
                            left: _widthScreen * 0.04,
                            right: _widthScreen * 0.04,
                            bottom: _heightScreen*0.012,
                          ),
                          child: CustomAdminAppointmentItem(
                            listOfItemsType: AdminAppointmentItem.DAdminSchedule,
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
                            listOfItem: allAppointmentState.allAppointmentsNotCompleted,
                            //listOfItems: availableAppointmentsDoctors,
                          ),
                        );
                      }),
                ),
              ),
            );
          }
          else{
            return Center(child: Text("Error")); //todo);
          }

        }
    );
  }
}
