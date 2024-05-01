import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CheckXRayDiagnosis extends StatelessWidget {
  const CheckXRayDiagnosis({
    Key? key,
    required this.image,
  }) : super(key: key);
  final File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "X-Ray Diagnosis",
        centerTitle: true,
        hasArrowBack: false,
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Stack(
        children: [
          Container(
            width: FixedVariables.widthScreenQuery(context),
            height: FixedVariables.heightScreenQuery(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/png_images/background_chatbot.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: FixedVariables.heightScreenQuery(context) * 0.04,
                horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
              ),
              margin: EdgeInsets.only(
                  left: FixedVariables.widthScreenQuery(context) * 0.03,
                  right: FixedVariables.widthScreenQuery(context) * 0.03,
                  top: FixedVariables.heightScreenQuery(context) * 0.04,
                  bottom: FixedVariables.heightScreenQuery(context) * 0.04
              ),
              decoration: BoxDecoration(
                color: ColorHelper.whiteColor,
                borderRadius: BorderRadius.circular(FixedVariables.radius8),
                boxShadow: [
                  BoxShadow(
                    color: ColorHelper.grayText.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: FixedVariables.widthScreenQuery(context) *
                              0.16,
                          height:
                          FixedVariables.heightScreenQuery(context) *
                              0.06,
                          child: Center(
                            child: SvgPicture.asset(
                              ImageHelper.whiteLogo,
                              width:
                              FixedVariables.widthScreenQuery(context) *
                                  0.08,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorHelper.mainColor,
                            borderRadius: BorderRadius.only(
                              topRight:
                              Radius.circular(FixedVariables.radius8),
                              bottomLeft:
                              Radius.circular(FixedVariables.radius8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) *
                              0.03,
                          vertical:
                          FixedVariables.heightScreenQuery(context) *
                              0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorHelper.mainColor),
                          borderRadius:
                          BorderRadius.circular(FixedVariables.radius8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Patient Name : ",
                                  style: TextStyleHelper.style10B,
                                ),
                                Text(
                                  "Ashraf hatem Omara",
                                  style: TextStyleHelper.style10B.copyWith(
                                      color: ColorHelper.grayText),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: FixedVariables.heightScreenQuery(
                                  context) *
                                  0.006,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Age : ",
                                  style: TextStyleHelper.style10B,
                                ),
                                Text(
                                  "23",
                                  style: TextStyleHelper.style10B.copyWith(
                                      color: ColorHelper.grayText),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: FixedVariables.heightScreenQuery(
                                  context) *
                                  0.006,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Gender : ",
                                  style: TextStyleHelper.style10B,
                                ),
                                Text(
                                  "male",
                                  style: TextStyleHelper.style10B.copyWith(
                                      color: ColorHelper.grayText),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: FixedVariables.heightScreenQuery(
                                  context) *
                                  0.006,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Report Date : ",
                                  style: TextStyleHelper.style10B,
                                ),
                                Text(
                                  "17-05-2024  20:18",
                                  style: TextStyleHelper.style10B.copyWith(
                                      color: ColorHelper.grayText),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
                  Text(
                    "Result",
                    style: TextStyleHelper.style14B,
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context)*0.01,
                          ),
                          Text(
                            "Positive",
                            style: TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor),
                          ),
                          Text(
                            "Pneumonia",
                            style: TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor),
                          ),
                          SizedBox(
                            height:
                            FixedVariables.heightScreenQuery(context) * 0.01,
                          ),
                          Container(
                            width: FixedVariables.widthScreenQuery(context)*0.4,
                            child: Text(
                              "Don't forget to consult a specialist doctor to confirm the diagnosis",
                              style: TextStyleHelper.style10R
                                  .copyWith(color: ColorHelper.grayText.withOpacity(0.6)),
                            ),
                          ),

                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(FixedVariables.radius8),
                        child: Container(
                          width: FixedVariables.widthScreenQuery(context) * 0.4,
                          height: FixedVariables.heightScreenQuery(context) * 0.16,
                          child: Image.file(
                            this.image,
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            color: ColorHelper.gray300,

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
                  Text(
                    "Diagnosis",
                    style: TextStyleHelper.style14B,
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                        FixedVariables.widthScreenQuery(context) *
                            0.05),
                    child: Text(
                      "The diagnostic results suggest that the patient is exhibiting signs of pneumonia. Pneumonia can be caused by various pathogens, including bacteria, viruses, and fungi. Given the current global situation with the COVID-19 pandemic, it is prudent to consider the possibility of COVID-19 infection, especially if the patient is exhibiting symptoms consistent with COVID-19 or has been in contact with individuals known to have the virus.",
                      style: TextStyleHelper.style12R
                          .copyWith(color: ColorHelper.grayText),
                    ),
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.03,
                  ),




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
