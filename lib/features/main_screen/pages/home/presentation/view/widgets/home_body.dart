import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HomeBody extends StatelessWidget {
   HomeBody({Key? key}) : super(key: key);

  UserType? _userType;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    _userType = context.read<UserCubit>().userType;
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
            style: TextStyleHelper.style14M,
          ),
          SizedBox(
            height: _heightScreen * 0.02,
          ),
          SizedBox(
            height: _heightScreen * 0.11,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (listOfCategories.length > 10)
                    ? 10
                    : listOfCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _widthScreen * 0.025),
                    child: GestureDetector(
                      onTap: (){
                        RoutingHelper.navToDoctorsDepartments(context);
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
          (_userType ==UserType.patient)
              ?CustomViewPopularDoctors()
              :(_userType ==UserType.doctor)
              ?CustomPatientsTodayAppointments()
              :(_userType ==UserType.admin)
              ?CustomPatientsTodayAppointments()
              :CustomViewPopularDoctors(),

        ],
      ),
    );
  }
}
