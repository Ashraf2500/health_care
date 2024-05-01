import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({Key? key}) : super(key: key);

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  List<String> medicines = ["Azithromycim", "Clarithromycin", "Doxycyline"];
  List<String> medicinesDate = [
    "once every 12 hour",
    "once after lunch",
    "1 after breakfast and 1 after dinner"
  ];

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Create Report",
        centerTitle: true,
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Stack(
        children: [
          Stepper(
            elevation: 0,
            margin: EdgeInsets.all(0),
            connectorThickness: 1,
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
            steps: [
              Step(
                isActive: currentStep >= 0,
                state:
                    (currentStep > 0) ? StepState.complete : StepState.indexed,
                label: Text(
                  "Diagnosis",
                  style: TextStyleHelper.style12B,
                ),
                title: Text(
                  "_",
                  style: TextStyleHelper.style12B.copyWith(
                      color: (currentStep > 0) ? ColorHelper.mainColor : null),
                ),
                content: CustomTopicOfCreateReport(
                  topicTitle: "diagnosis",
                ),
              ),
              Step(
                isActive: currentStep >= 1,
                state:
                    (currentStep > 1) ? StepState.complete : StepState.indexed,
                label: Text(
                  "Advices",
                  style: TextStyleHelper.style12B,
                ),
                title: Text(
                  "_",
                  style: TextStyleHelper.style12B.copyWith(
                      color: (currentStep > 1) ? ColorHelper.mainColor : null),
                ),
                content: CustomTopicOfCreateReport(
                  topicTitle: "Advices",
                ),
              ),
              Step(
                isActive: currentStep >= 2,
                state:
                    (currentStep > 2) ? StepState.complete : StepState.indexed,
                label: Text(
                  "Medicines",
                  style: TextStyleHelper.style12B,
                ),
                title: Text(
                  "_",
                  style: TextStyleHelper.style12B.copyWith(
                      color: (currentStep > 2) ? ColorHelper.mainColor : null),
                ),
                content: Container(
                  height: FixedVariables.heightScreenQuery(context) * 0.65,
                  padding: EdgeInsets.only(
                    top: FixedVariables.heightScreenQuery(context) * 0.02,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      // ListView.builder(
                      //   itemCount: (FixedVariables.heightScreenQuery(context)/40).floor(),
                      //   itemBuilder: (context,index){
                      //     return Padding(
                      //       padding:  EdgeInsets.only(
                      //         //bottom: FixedVariables.heightScreenQuery(context)*0.04,
                      //         bottom: 31,
                      //       ),
                      //       child: Container(
                      //         height: 1,
                      //         width: double.infinity,
                      //         color: ColorHelper.gray300,
                      //       ),
                      //     );
                      //   },
                      // ),
                      ListView.builder(
                        itemCount: medicines.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  FixedVariables.widthScreenQuery(context) *
                                      0.01,
                              vertical:
                                  FixedVariables.heightScreenQuery(context) *
                                      0.01,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.02,
                                vertical:
                                    FixedVariables.heightScreenQuery(context) *
                                        0.012,
                              ),
                              decoration: BoxDecoration(
                                color: ColorHelper.mainShadow,
                                borderRadius: BorderRadius.circular(
                                    FixedVariables.radius12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${medicines[index]}",
                                    style: TextStyleHelper.style14R
                                        .copyWith(color: ColorHelper.mainColor),
                                  ),
                                  Text(
                                    "${medicinesDate[index]}",
                                    style: TextStyleHelper.style8R
                                        .copyWith(color: ColorHelper.grayText),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                isActive: currentStep >= 3,
                state:
                    (currentStep > 3) ? StepState.complete : StepState.indexed,
                label: Text(
                  "Send",
                  style: TextStyleHelper.style12B,
                ),
                title: Text(
                  "",
                  style: TextStyleHelper.style10B,
                ),
                content: Container(
                  height: FixedVariables.heightScreenQuery(context) * 0.65,
                  child: SingleChildScrollView(

                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              FixedVariables.widthScreenQuery(context) * 0.03),
                      decoration: BoxDecoration(
                        color: ColorHelper.whiteColor,
                        borderRadius:
                            BorderRadius.circular(FixedVariables.radius8),
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
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width:
                                      FixedVariables.widthScreenQuery(context) *
                                          0.16,
                                  height: FixedVariables.heightScreenQuery(
                                          context) *
                                      0.06,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      ImageHelper.whiteLogo,
                                      width: FixedVariables.widthScreenQuery(
                                              context) *
                                          0.08,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorHelper.mainColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          FixedVariables.radius8),
                                      bottomLeft: Radius.circular(
                                          FixedVariables.radius8),
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
                                  vertical: FixedVariables.heightScreenQuery(
                                          context) *
                                      0.02,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ColorHelper.mainColor),
                                  borderRadius: BorderRadius.circular(
                                      FixedVariables.radius8),
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
                                          style: TextStyleHelper.style10B
                                              .copyWith(
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
                                          style: TextStyleHelper.style10B
                                              .copyWith(
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
                                          style: TextStyleHelper.style10B
                                              .copyWith(
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
                                          style: TextStyleHelper.style10B
                                              .copyWith(
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
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                          Text(
                            "Diagnosis",
                            style: TextStyleHelper.style14B,
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.05),
                            child: Text(
                              "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab.",
                              style: TextStyleHelper.style12R
                                  .copyWith(color: ColorHelper.grayText),
                            ),
                          ),
                          //--------------------------------------
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                          Text(
                            "Advices",
                            style: TextStyleHelper.style14B,
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.05),
                            child: Text(
                              "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better.",
                              style: TextStyleHelper.style12R
                                  .copyWith(color: ColorHelper.grayText),
                            ),
                          ),

                          //--------------------------------------
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                          Text(
                            "Medicines",
                            style: TextStyleHelper.style14B,
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.02),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: FixedVariables.widthScreenQuery(
                                            context) *
                                        0.02,
                                    vertical: FixedVariables.heightScreenQuery(
                                            context) *
                                        0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorHelper.mainShadow,
                                    borderRadius: BorderRadius.circular(
                                        FixedVariables.radius12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Azithromycim",
                                        style: TextStyleHelper.style14R
                                            .copyWith(
                                                color: ColorHelper.mainColor),
                                      ),
                                      Text(
                                        "once every 12 hour",
                                        style: TextStyleHelper.style8R.copyWith(
                                            color: ColorHelper.grayText),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(
                                          context) *
                                      0.01,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: FixedVariables.widthScreenQuery(
                                            context) *
                                        0.02,
                                    vertical: FixedVariables.heightScreenQuery(
                                            context) *
                                        0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorHelper.mainShadow,
                                    borderRadius: BorderRadius.circular(
                                        FixedVariables.radius12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Clarithromycin",
                                        style: TextStyleHelper.style14R
                                            .copyWith(
                                                color: ColorHelper.mainColor),
                                      ),
                                      Text(
                                        "Once after lunch",
                                        style: TextStyleHelper.style8R.copyWith(
                                            color: ColorHelper.grayText),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(
                                          context) *
                                      0.01,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: FixedVariables.widthScreenQuery(
                                            context) *
                                        0.02,
                                    vertical: FixedVariables.heightScreenQuery(
                                            context) *
                                        0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorHelper.mainShadow,
                                    borderRadius: BorderRadius.circular(
                                        FixedVariables.radius12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Doxycycline",
                                        style: TextStyleHelper.style14R
                                            .copyWith(
                                                color: ColorHelper.mainColor),
                                      ),
                                      Text(
                                        "1 after breakfast and 1 after dinner",
                                        style: TextStyleHelper.style8R.copyWith(
                                            color: ColorHelper.grayText),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                BoxDecoration(color: ColorHelper.mainColor),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Youssef Ahmed",
                                style: TextStyleHelper.style8R
                                    .copyWith(color: ColorHelper.grayText),
                              ),
                              Text(
                                "NO. +20 1022994635",
                                style: TextStyleHelper.style8R
                                    .copyWith(color: ColorHelper.grayText),
                              ),
                              Text(
                                "Hospital / Clinic. Kafr El-Sheikh General",
                                style: TextStyleHelper.style8R
                                    .copyWith(color: ColorHelper.grayText),
                              ),
                              Text(
                                "Address. In front of the Endowments Buildings - Kafr El Sheikh ",
                                style: TextStyleHelper.style8R
                                    .copyWith(color: ColorHelper.grayText),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) *
                                0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            onStepContinue: () {
              (currentStep == 3)
                  ? null
                  : setState(() {
                      currentStep += 1;
                    });
            },
            onStepCancel: () {
              (currentStep == 0)
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Padding(
                padding: EdgeInsets.only(
                  top: FixedVariables.heightScreenQuery(context) * 0.015,
                ),
                child: (currentStep != 3)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            onPressed: details.onStepCancel!,
                            widthButton:
                                FixedVariables.widthScreenQuery(context) * 0.22,
                            heightButton:
                                FixedVariables.heightScreenQuery(context) *
                                    0.05,
                            borderRadius:
                                BorderRadius.circular(FixedVariables.radius8),
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.only(
                              left: FixedVariables.widthScreenQuery(context) *
                                  .03,
                              right: FixedVariables.widthScreenQuery(context) *
                                  .04,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorHelper.whiteColor,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyleHelper.style12B
                                      .copyWith(color: ColorHelper.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            onPressed: details.onStepContinue!,
                            widthButton:
                                FixedVariables.widthScreenQuery(context) * 0.22,
                            heightButton:
                                FixedVariables.heightScreenQuery(context) *
                                    0.05,
                            borderRadius:
                                BorderRadius.circular(FixedVariables.radius8),
                            padding: EdgeInsets.only(
                              left: FixedVariables.widthScreenQuery(context) *
                                  .04,
                              right: FixedVariables.widthScreenQuery(context) *
                                  .03,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyleHelper.style12B
                                      .copyWith(color: ColorHelper.whiteColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: ColorHelper.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : CustomButton(
                        onPressed: () {},
                        heightButton: FixedVariables.heightScreenQuery(context) * 0.06,
                        borderRadius: BorderRadius.circular(FixedVariables.radius8),
                        padding: EdgeInsets.only(
                          left: FixedVariables.widthScreenQuery(context) * .04,
                          right: FixedVariables.widthScreenQuery(context) * .03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                            Text(
                              "Send report",
                              style: TextStyleHelper.style14B
                                  .copyWith(color: ColorHelper.whiteColor),
                            ),
                            SizedBox(
                              width: FixedVariables.widthScreenQuery(context)*0.4,
                            ),
                            Icon(Icons.send, size: 30 ,color: ColorHelper.whiteColor,)
                          ],
                        ),
                      ),
              );
            },
          ),
          (currentStep == 0 || currentStep ==1)
              ?Align(
               alignment: Alignment.bottomCenter,
                child: Container(
                  height: FixedVariables.heightScreenQuery(context)*0.06,
                  padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.055 ),
                  margin:  EdgeInsets.symmetric(
                      horizontal: FixedVariables.widthScreenQuery(context)*0.055 ,
                      vertical: FixedVariables.heightScreenQuery(context)*0.026
                  ),
                   child: Icon(Icons.mic , color: ColorHelper.whiteColor,),
                   decoration: BoxDecoration(
                     color: ColorHelper.mainColor,
                     shape: BoxShape.circle
                   ),
                  ),
              )
              :(currentStep == 2)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: AddMedicineBottomSheet(),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
