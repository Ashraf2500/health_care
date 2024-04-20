import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: CustomBackAppBar(
         context: context,
         title: "Massages",
         centerTitle: true,
         hasArrowBack: false,
         titleColor: ColorHelper.whiteColor,
         backgroundColor: ColorHelper.mainColor,
         arrowColor: ColorHelper.whiteColor,
         elevation: 3.5,
         shadowColor: ColorHelper.mainColor,
         appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
       ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: FixedVariables.heightScreenQuery(context)*0.03,
            ),
            Container(
              child: CustomTextFormField(
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorHelper.blackColor.withOpacity(0.7),
                  size: 25,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.close,
                    color: ColorHelper.grayText.withOpacity(0.7),
                    size: 20,
                  ),
                ),
                hintText: "search ",
                backgroundFilled: ColorHelper.whiteColor,
                borderColor: ColorHelper.gray300,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorHelper.grayText.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: FixedVariables.heightScreenQuery(context) * 0.04,
            ),
            // Text(
            //   "All Messages",
            //   style: TextStyleHelper.style14B,
            // ),
            // SizedBox(
            //   height: FixedVariables.heightScreenQuery(context) * 0.02,
            // ),
            Flexible(
              child: ListView.builder(
                  itemCount: todayAppointmentsPatients.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.01),
                      child: CustomPersonChatItem(
                        index: index,
                        listOfItems: availableAppointmentsDoctors,
                      ),
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
