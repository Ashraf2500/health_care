import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:intl/intl.dart';

class BookAppointmentTime extends StatelessWidget {
  BookAppointmentTime({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = context.read<CreateAppointmentCubit>().days;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        title: "Book Appointment",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Container(
        height: FixedVariables.heightScreenQuery(context),
        padding: EdgeInsets.symmetric(horizontal: FixedVariables.horizontalPaddingScreen(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: FixedVariables.heightScreenQuery(context) * 0.02,
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
              height: FixedVariables.heightScreenQuery(context) * 0.02,
            ),

            Text(
              "Available days",
              style: TextStyleHelper.style14B,
            ),
            SizedBox(
              height: FixedVariables.heightScreenQuery(context) * 0.01,
            ),

            Expanded(
                child: Container(
                  width: FixedVariables.widthScreenQuery(context),
                  child: Scrollbar(
                    thumbVisibility: true,
                    thickness: 3,
                    child: GridView.builder(
                     itemCount: days.length,
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: FixedVariables.widthScreenQuery(context)*0.29,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2/0.6,

                      ),
                      itemBuilder: (context,index){
                        return Container(
                          child: Center(
                            child: Text(
                              "${days[index]}",
                              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorHelper.mainShadow.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(FixedVariables.radius8)
                          ),

                        );
                      }
                                    ),
                  ),
                ),
              ),

            Padding(
              padding:  EdgeInsets.only(
                left: FixedVariables.widthScreenQuery(context)*0.03,
                right: FixedVariables.widthScreenQuery(context)*0.03,
                top: FixedVariables.heightScreenQuery(context) * 0.005,
                bottom: FixedVariables.heightScreenQuery(context) * 0.02,
              ),
              child: CustomButton(
                  onPressed: (){
                    DateTime? selectedDateInt = context.read<CreateAppointmentCubit>().dateTimeInt ;
                    String dayName = DateFormat('EEEE').format(selectedDateInt??DateTime.now());
                    print(selectedDateInt);
                    print(dayName);
                    if(days.contains(dayName)){
                      RoutingHelper.navToBookAppointmentInfo(context);
                    }else{
                      showSnackbar(context: context, message: "please choose available day", backGroundColor: ColorHelper.redColor);
                    }

                  },
                  text: "Next",
              ),
            ),




          ],
        ),
      ),
    );
  }
}
