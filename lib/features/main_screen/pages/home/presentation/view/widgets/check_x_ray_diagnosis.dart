import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CheckXRayDiagnosis extends StatelessWidget {
  const CheckXRayDiagnosis({
    Key? key,
    required this.image,
    required this.results,
  }) : super(key: key);
  final File image;
  final CovidResultModel results;


  @override
  Widget build(BuildContext context) {
    String? resultCheck = results.prediction?.toLowerCase();
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "X-Ray Diagnosis",
        centerTitle: true,
        hasArrowBack: true,
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
                vertical: FixedVariables.heightScreenQuery(context) * 0.02,
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
                            "${results.prediction?.replaceAll("COVID-19 ", "")}",
                            style: TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor),
                          ),
                          Text(
                            "Covid 19",
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
                    child: (resultCheck!.contains("positive"))
                        ?Text(
                      "The results indicate a high probability of contracting Covid-19, and this may cause coughing and loss of the sense of smell and taste, and if the infection is serious, it may cause chest tightness and breathing disorders. These patients may require hospitalization to receive necessary treatment, including oxygen or intensive care.",
                      style: TextStyleHelper.style12R
                          .copyWith(color: ColorHelper.grayText),
                    )
                        :Text(
                      "The results indicate that you are negative for infection with Corona disease. If you suffer from any symptoms, it is best to seek help from a doctor",
                      style: TextStyleHelper.style12R
                          .copyWith(color: ColorHelper.grayText),
                    ),
                  ),
                  SizedBox(
                    height:
                    FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
                (resultCheck!.contains("positive"))
                    ?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Methods of prevention",
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
                          "1- Wearing Masks: It is advised to wear masks or face coverings in public places and when in close proximity to others, to reduce the spread of the virus through respiratory droplets. \n\n 2- Frequent Handwashing: Hands should be washed with soap and water for at least 20 seconds, especially after coughing or sneezing, before eating, and after using the bathroom. \n\n 3- Maintaining Social Distancing: Avoid large gatherings and direct contact with others as much as possible, and maintain a safe distance from others (such as at least six feet). \n\n 4- Avoiding Touching Face with Unwashed Hands: Touching the eyes, nose, and mouth with unwashed hands should be avoided, as the virus can enter the body through these routes. \n\n 5- Cleaning and Disinfecting Frequently Touched Surfaces: Surfaces and objects touched by many people should be regularly cleaned and disinfected, such as doors, door handles, phones, and remote controls. \n 6- Vaccination: Vaccination against COVID-19 is considered one of the most important means to prevent infection and reduce the risk of severe symptoms.",
                          style: TextStyleHelper.style12R
                              .copyWith(color: ColorHelper.grayText),
                        ),
                      ),
                    ],
                  ):SizedBox(),
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
