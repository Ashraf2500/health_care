import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class BookAppointmentTime extends StatelessWidget {
  BookAppointmentTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: FixedVariables.heightScreenQuery(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackAppBar(
              context: context,
              title: "Book an Appointment",
            ),
            Container(
              height: FixedVariables.heightScreenQuery(context)*0.88,
              padding: EdgeInsets.symmetric(horizontal: FixedVariables.horizontalPaddingScreen(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context) * 0.04,
                  ),
                  Text(
                    "Select Date",
                    style: TextStyleHelper.style14B,
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
        
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.02),
                    child: CustomCalendarDate(),
                  ),
        
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context) * 0.04,
                  ),
        
                  Text(
                    "Select Time",
                    style: TextStyleHelper.style14B,
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
                  Expanded(
                      child: Container(
                        width: FixedVariables.widthScreenQuery(context),
                        child: GridView.builder(
                         itemCount: 10,
                          padding: EdgeInsets.all(0),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: FixedVariables.widthScreenQuery(context)*0.29,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                            childAspectRatio: 2/1,

                          ),
                          itemBuilder: (context,index){
                            return Container(
                              child: Center(
                                child: Text(
                                  "8:00 AM",
                                  style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorHelper.mainShadow,
                                borderRadius: BorderRadius.circular(FixedVariables.radius8)
                              ),

                            );
                          }
                      ),
                      ),
                    ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context) * 0.005,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: FixedVariables.widthScreenQuery(context)*0.03,
                    ),
                    child: CustomButton(
                        onPressed: (){},
                        text: "Next",
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
