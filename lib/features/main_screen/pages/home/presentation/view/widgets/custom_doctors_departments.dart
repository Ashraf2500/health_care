import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomDoctorsDepartments extends StatelessWidget {
  const CustomDoctorsDepartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        backgroundColor: ColorHelper.backWhiteColor,
        title: "Doctors",
      ),
      backgroundColor: ColorHelper.backWhiteColor,
      body: Container(
        height: FixedVariables.heightScreenQuery(context),
        padding: EdgeInsets.only(left: FixedVariables.horizontalPaddingScreen(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.04,
            ),
            Text(
              "Departments",
              style: TextStyleHelper.style14B,
            ),
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.015,
            ),
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.095,
              child: ListView.builder(
                itemCount: ListOfDepartments.listOfDoctorsDepartments.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return Container(
                    width: FixedVariables.widthScreenQuery(context)*0.2,
                    margin: EdgeInsets.only(right:FixedVariables.widthScreenQuery(context)*0.02),
                    decoration: BoxDecoration(
                      color: (index==0)?ColorHelper.mainColor:ColorHelper.mainShadow,
                      borderRadius: BorderRadius.circular(FixedVariables.radius16),
                    ),
                    child:Center(
                      child: (index==0)?
                          Text(
                            "All",
                            style: TextStyleHelper.style18B.copyWith(color: ColorHelper.whiteColor),
                          )
                          :SvgPicture.asset(
                              ListOfDepartments.listOfDoctorsDepartments[index].image,
                              height: FixedVariables.heightScreenQuery(context)*0.05,
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
              "Doctors",
              style: TextStyleHelper.style14B,
            ),
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.015,
            ),
            Container(
              height: FixedVariables.heightScreenQuery(context)*0.64,
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
    );
  }
}
