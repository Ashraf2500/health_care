import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomReport extends StatelessWidget {
  const CustomReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportDetailsCubit, ReportDetailsState>(
      listener: (context, state) {


      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: CustomBackAppBar(
                context: context,
                title: "Report",
                titleColor: ColorHelper.whiteColor,
                backgroundColor: ColorHelper.mainColor,
                arrowColor: ColorHelper.whiteColor,
                elevation: 4,
                shadowColor: ColorHelper.mainColor,
                appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
              ),
              floatingActionButton: SpeedDial(
                icon: Icons.more_vert,
                overlayOpacity: 0.15,
                overlayColor: ColorHelper.blackColor,
                backgroundColor: ColorHelper.mainColor,
                curve: Curves.bounceIn,
                buttonSize: Size(
                    FixedVariables.widthScreenQuery(context) * 0.11,
                    FixedVariables.heightScreenQuery(context) * 0.062),
                children: [
                  SpeedDialChild(
                      backgroundColor: ColorHelper.mainColor,
                      child: SvgPicture.asset(
                        ImageHelper.chatBotIcon,
                        colorFilter: ColorFilter.mode(
                            ColorHelper.whiteColor, BlendMode.srcIn),
                        width: 30,
                      ),
                      onTap: () {
                          context.read<ReportDetailsCubit>().sendMessage(
                              diagnosisDoctor:
                              "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab.",
                              advicesDoctor:
                              "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better.",
                              medicinesDoctor:
                              "Medicines are1- Azithromycim   - once every 12 hour2- Clarithromycin  -Once after lunch3- Doxycycline -Once after breakfast and once after dinner.",
                              context: context
                          );

                      }),
                  SpeedDialChild(
                    backgroundColor: ColorHelper.mainColor,
                    child: Icon(
                      Icons.volume_up_sharp,
                      color: ColorHelper.whiteColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.03),
                  margin: EdgeInsets.symmetric(
                    horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                    vertical: FixedVariables.heightScreenQuery(context) * 0.03,
                  ).copyWith(bottom: FixedVariables.heightScreenQuery(context) * 0.04),
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
                        "Diagnosis",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.01,
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
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.02,
                      ),
                      Text(
                        "Advices",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.01,
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
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.02,
                      ),
                      Text(
                        "Medicines",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.01,
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
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.02,
                                vertical:
                                    FixedVariables.heightScreenQuery(context) *
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
                                        .copyWith(color: ColorHelper.mainColor),
                                  ),
                                  Text(
                                    "once every 12 hour",
                                    style: TextStyleHelper.style8R
                                        .copyWith(color: ColorHelper.grayText),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  FixedVariables.heightScreenQuery(context) *
                                      0.01,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.02,
                                vertical:
                                    FixedVariables.heightScreenQuery(context) *
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
                                        .copyWith(color: ColorHelper.mainColor),
                                  ),
                                  Text(
                                    "Once after lunch",
                                    style: TextStyleHelper.style8R
                                        .copyWith(color: ColorHelper.grayText),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  FixedVariables.heightScreenQuery(context) *
                                      0.01,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    FixedVariables.widthScreenQuery(context) *
                                        0.02,
                                vertical:
                                    FixedVariables.heightScreenQuery(context) *
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
                                        .copyWith(color: ColorHelper.mainColor),
                                  ),
                                  Text(
                                    "1 after breakfast and 1 after dinner",
                                    style: TextStyleHelper.style8R
                                        .copyWith(color: ColorHelper.grayText),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(color: ColorHelper.mainColor),
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
                        height:
                            FixedVariables.heightScreenQuery(context) * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (state is ReportDetailsInitial && state.status == ReportDetailsStatus.loading)
                ? Container(
                    width: FixedVariables.widthScreenQuery(context),
                    height: double.infinity,
                    color: ColorHelper.blackColor.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : (state is ReportDetailsInitial && state.status == ReportDetailsStatus.failure)
                    ? Center(
                        child: Text(" error in Report Screen"),
                      )
                    : SizedBox(),
          ],
        );
      },
    );
  }
}
