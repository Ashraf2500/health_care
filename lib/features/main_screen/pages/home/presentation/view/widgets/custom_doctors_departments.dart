import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomDoctorsDepartments extends StatelessWidget {
  const CustomDoctorsDepartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backWhiteColor,
      body: Container(
        height: FixedVariables.heightScreenQuery(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackAppBar(
              context: context,
              backgroundColor: ColorHelper.backWhiteColor,
              title: "Doctors",
            ),
            Padding(
              padding: EdgeInsets.only(left: FixedVariables.horizontalPaddingScreen(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.04,
                  ),
                  Text(
                    "Departments",
                    style: TextStyleHelper.style16B,
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.015,
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.1,
                    child: ListView.builder(
                      itemCount: ListOfDepartments.listOfDoctorsDepartments.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index) {
                        return Container(
                          width: FixedVariables.widthScreenQuery(context)*0.2,
                          margin: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.03),
                          decoration: BoxDecoration(
                            color: (index==0)?ColorHelper.mainColor:ColorHelper.mainShadow,
                            borderRadius: BorderRadius.circular(FixedVariables.radius16),
                          ),
                          child:Center(
                            child: (index==0)?
                                Text(
                                  "All",
                                  style: TextStyleHelper.style20B.copyWith(color: ColorHelper.whiteColor),
                                )
                                :SvgPicture.asset(
                                    ListOfDepartments.listOfDoctorsDepartments[index].image,
                                    height: FixedVariables.heightScreenQuery(context)*0.06,
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.02,
                  ),
                  Text(
                    "All Doctors",
                    style: TextStyleHelper.style16B,
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.015,
                  ),
                  Container(
                    height: FixedVariables.heightScreenQuery(context)*0.62,
                    padding: EdgeInsets.only(right: FixedVariables.horizontalPaddingScreen(context)),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: listOfPopularDoctors.length,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.01 ),
                          child: CustomDoctorDepartmentItem(index: index,),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
