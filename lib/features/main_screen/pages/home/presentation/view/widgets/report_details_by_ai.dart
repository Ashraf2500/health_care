import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ReportDetailsByAi extends StatelessWidget {
  const ReportDetailsByAi({
    Key? key,
    required this.diagnosisDetails,
    required this.reasonsDetails,
    required this.advicesDetails,
    required this.treatmentDetails,
    required this.listOfMedicine,
    required this.listOfMedicineDetails,
  }) : super(key: key);

  final String? diagnosisDetails;
  final String? reasonsDetails;
  final String? advicesDetails;
  final String? treatmentDetails;
  final List<String>? listOfMedicine;
  final List<String>? listOfMedicineDetails;

  @override
  Widget build(BuildContext context) {
    print("listOfMedicine $listOfMedicine");
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Report Details",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: FixedVariables.widthScreenQuery(context),
          margin: EdgeInsets.symmetric(
            horizontal: FixedVariables.widthScreenQuery(context) * 0.03,
            vertical: FixedVariables.heightScreenQuery(context) * 0.03,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
            vertical: FixedVariables.heightScreenQuery(context) * 0.02,
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
                "Diagnosis",
                style: TextStyleHelper.style14B,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    FixedVariables.widthScreenQuery(context) * 0.05),
                child: Text(
                  "${this.diagnosisDetails}",
                  style: TextStyleHelper.style12R
                      .copyWith(color: ColorHelper.grayText),
                ),
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.02,
              ),
              Text(
                "The reasons",
                style: TextStyleHelper.style14B,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    FixedVariables.widthScreenQuery(context) * 0.05),
                child: Text(
                  "${this.reasonsDetails}",
                  style: TextStyleHelper.style12R
                      .copyWith(color: ColorHelper.grayText),
                ),
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.02,
              ),
              Text(
                "Advices",
                style: TextStyleHelper.style14B,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    FixedVariables.widthScreenQuery(context) * 0.05),
                child: Text(
                  "${this.advicesDetails}",
                  style: TextStyleHelper.style12R
                      .copyWith(color: ColorHelper.grayText),
                ),
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.02,
              ),
              Text(
                "Treatment",
                style: TextStyleHelper.style14B,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context) * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    FixedVariables.widthScreenQuery(context) * 0.05),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:this.listOfMedicineDetails?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${this.listOfMedicine?[index]}",
                            style: TextStyleHelper.style12B
                                .copyWith(color: ColorHelper.mainColor),
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context) * 0.01,
                          ),
                          Text(
                            "${this.listOfMedicineDetails?[index]}",
                            style: TextStyleHelper.style12R
                                .copyWith(color: ColorHelper.grayText),
                          ),
                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* return BlocBuilder<ReportDetailsCubit, ReportDetailsState>(
      builder: (context, state) {
        if(state is ReportDetailsInitial && state.status==ReportDetailsStatus.success){
          return Scaffold(
            appBar: CustomBackAppBar(
              context: context,
              title: "Report Details",
              appBarHeight: FixedVariables.heightScreenQuery(context) * 0.08,
            ),
            body: SingleChildScrollView(
              child: Container(
                width: FixedVariables.widthScreenQuery(context),
                margin: EdgeInsets.symmetric(
                  horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                  vertical: FixedVariables.heightScreenQuery(context) * 0.02,
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
                    Text(
                      "Diagnosis",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "${this.diagnosisDetails}",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "The reasons",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "${this.reasonsDetails}",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "Advices",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "${this.advicesDetails}",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "Treatment",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "${this.treatmentDetails}",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else if(state is ReportDetailsInitial && state.status == ReportDetailsStatus.loading){
          return Scaffold(
            body: Container(
              width: FixedVariables.widthScreenQuery(context),
              height: double.infinity,
              color: ColorHelper.blackColor.withOpacity(0.3),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        else{
          return Scaffold(
            appBar: CustomBackAppBar(
              context: context,
              title: "Report Details",
              appBarHeight: FixedVariables.heightScreenQuery(context) * 0.08,
              // hasActions: true,
              // actions: [
              //   IconButton(
              //       onPressed: (){
              //         context.read<ReportDetailsCubit>().sendMessage(
              //             diagnosisDoctor:
              //             "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab.",
              //             advicesDoctor:
              //             "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better.",
              //             medicinesDoctor:
              //             "Medicines are1- Azithromycim   - once every 12 hour2- Clarithromycin  -Once after lunch3- Doxycycline -Once after breakfast and once after dinner",
              //             context: context
              //         );
              //       },
              //       icon: Icon(Icons.add),
              //   )
              // ],todo
            ),
            body: SingleChildScrollView(
              child: Container(
                width: FixedVariables.widthScreenQuery(context),
                margin: EdgeInsets.symmetric(
                  horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                  vertical: FixedVariables.heightScreenQuery(context) * 0.02,
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
                    Text(
                      "${(state is ReportDetailsInitial && state.status == ReportDetailsStatus.loading)?"loading":(state is ReportDetailsInitial && state.status == ReportDetailsStatus.success)?"Success":(state is ReportDetailsInitial && state.status == ReportDetailsStatus.failure)?"Error":(state is ReportDetailsInitial && state.status == ReportDetailsStatus.initial)?"Initial":"Other"}",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child:Text(
                        "${"error"}",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "${(state is ReportDetailsInitial)?"${state.status}":""}",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "error",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "Advices",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "error",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    Text(
                      "Treatment",
                      style: TextStyleHelper.style14B,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.05),
                      child: Text(
                        "error",
                        style: TextStyleHelper.style12R
                            .copyWith(color: ColorHelper.grayText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          }
      },
    );*/
  }
}
