import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  UserTypeData? _userTypeData;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    final double _widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    _userTypeData = context
        .read<UserTypeCubit>()
        .userType;
    return Padding(
      padding: EdgeInsets.only(left: FixedVariables.ScreenPadding22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _heightScreen * 0.06,
          ),
          Text(
            "Categories",
            style: TextStyleHelper.style14B,
          ),
          SizedBox(
            height: _heightScreen * 0.02,
          ),
          SizedBox(
            height: _heightScreen * 0.11,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (_userTypeData == UserTypeData.patient)
                    ? AllCategories[StringsApp.patientUser]!.length
                    : (_userTypeData == UserTypeData.doctor)
                    ? AllCategories[StringsApp.doctorUser]!.length
                    : AllCategories[StringsApp.adminUser]!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: _widthScreen * 0.025),
                    child: GestureDetector(
                      onTap: () {
                        if (_userTypeData == UserTypeData.patient) {
                          if (index == 0) {
                            RoutingHelper.navToHistoryAppointments(context);
                          }
                          else if (index == 1) {
                            RoutingHelper.navToDoctorsDepartments(context);
                          }
                          else if (index == 2) {
                            RoutingHelper.navToChatBot(context);
                          }
                          else if (index == 3) {
                            RoutingHelper.navToTestXRay(context);
                          }
                        }
                        else if (_userTypeData == UserTypeData.doctor) {
                          if (index == 0) {
                            RoutingHelper.navToSetSchedule(context);
                          }
                          else if (index == 1) {
                            RoutingHelper.navToHistoryAppointments(context);
                          }
                          else if (index == 2) {
                            RoutingHelper.navToTestXRay(context);
                          }
                          else if (index == 3) {
                            RoutingHelper.navToChatBot(context);
                          }
                        }
                        if (_userTypeData == UserTypeData.admin) {
                          if (index == 0) {
                            RoutingHelper.navToDoctorsDepartments(context);
                          }
                        }
                      },
                      child: CustomCategoryItem(
                        index: index,
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: _heightScreen * 0.04,
          ),
          (_userTypeData == UserTypeData.patient)
              ? CustomViewPopularDoctors()
              : (_userTypeData == UserTypeData.doctor)
              ? CustomPatientsTodayAppointments()
              : (_userTypeData == UserTypeData.admin)
              ? CustomPatientsTodayAppointments()
              : CustomViewPopularDoctors(),

        ],
      ),
    );
  }
}
