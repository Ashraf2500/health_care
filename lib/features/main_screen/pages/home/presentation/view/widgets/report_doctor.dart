import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomReportDoctor extends StatefulWidget {
   CustomReportDoctor({
    Key? key,
     required this.doctorReportData,
  }) : super(key: key);

  DoctorReportData doctorReportData;

  @override
  State<CustomReportDoctor> createState() => _CustomReportDoctorState();
}

class _CustomReportDoctorState extends State<CustomReportDoctor> {

   List<MedicineConvertData> medicineList =[];

   List<String> medicineListNames =[];

   void convertMedicineToList(){
     print(widget.doctorReportData.medicines);
     Map<String, dynamic> mapMedicine = (widget.doctorReportData.medicines!="")?jsonDecode(widget.doctorReportData.medicines!):{} ;
     MedicineConverterModel medicinesAll = MedicineConverterModel.fromJson(mapMedicine);
     medicineList=  medicinesAll.medicines;
     medicinesAll.medicines.forEach((element) {
       medicineListNames.add(element.medicineName.toString());
     });
   }

   @override
  void initState() {
     convertMedicineToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportDetailsCubit, ReportDetailsState>(
      builder: (contextReportDetailsCubit, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: CustomBackAppBar(
                context: contextReportDetailsCubit,
                title: "Report",
                titleColor: ColorHelper.whiteColor,
                backgroundColor: ColorHelper.mainColor,
                arrowColor: ColorHelper.whiteColor,
                elevation: 4,
                shadowColor: ColorHelper.mainColor,
                appBarHeight: FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.07,
              ),
              floatingActionButton: SpeedDial(
                icon: Icons.more_vert,
                overlayOpacity: 0.15,
                overlayColor: ColorHelper.blackColor,
                backgroundColor: ColorHelper.mainColor,
                curve: Curves.bounceIn,
                buttonSize: Size(
                    FixedVariables.widthScreenQuery(contextReportDetailsCubit) * 0.11,
                    FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.062),
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
                            diagnosisDoctor: widget.doctorReportData.diagnosis??"No there diagnosis",
                              advicesDoctor: widget.doctorReportData.advices??"No there advices",
                              medicinesDoctor: (medicineListNames.toString()!="")?medicineListNames.toString():"No there medicines",
                              listMeds: medicineListNames,
                              // diagnosisDoctor:
                              // "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab.",
                              // advicesDoctor:
                              // "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better.",
                              // medicinesDoctor:
                              // "Medicines are1- Azithromycim   - once every 12 hour2- Clarithromycin  -Once after lunch3- Doxycycline -Once after breakfast and once after dinner.",
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
                  padding: EdgeInsets.symmetric(horizontal:
                  FixedVariables.widthScreenQuery(contextReportDetailsCubit) * 0.03),
                  margin: EdgeInsets.only(
                    left: FixedVariables.widthScreenQuery(contextReportDetailsCubit) * 0.04,
                    right: FixedVariables.widthScreenQuery(contextReportDetailsCubit) * 0.04,
                    top: FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.03,
                    bottom: FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.04
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
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
                                  0.16,
                              height:
                                  FixedVariables.heightScreenQuery(contextReportDetailsCubit) *
                                      0.06,
                              child: Center(
                                child: SvgPicture.asset(
                                  ImageHelper.whiteLogo,
                                  width:
                                      FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
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
                                  FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
                                      0.03,
                              vertical:
                                  FixedVariables.heightScreenQuery(contextReportDetailsCubit) *
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
                                      "${widget.doctorReportData.appointment?.name}",
                                      style: TextStyleHelper.style10B.copyWith(
                                          color: ColorHelper.grayText),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(
                                          contextReportDetailsCubit) *
                                      0.006,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Age : ",
                                      style: TextStyleHelper.style10B,
                                    ),
                                    Text(
                                      "${widget.doctorReportData.appointment?.age}",
                                      style: TextStyleHelper.style10B.copyWith(
                                          color: ColorHelper.grayText),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(
                                          contextReportDetailsCubit) *
                                      0.006,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Gender : ",
                                      style: TextStyleHelper.style10B,
                                    ),
                                    Text(
                                        "${(widget.doctorReportData.appointment?.sex==1)?"male":"female"}",
                                      style: TextStyleHelper.style10B.copyWith(
                                          color: ColorHelper.grayText),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(
                                          contextReportDetailsCubit) *
                                      0.006,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Report Date : ",
                                      style: TextStyleHelper.style10B,
                                    ),
                                    Text(
                                      "${widget.doctorReportData.appointment?.createdAt.toString().replaceRange(widget.doctorReportData.appointment!.createdAt.toString().length-8, widget.doctorReportData.appointment?.createdAt.toString().length , "")}",
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
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
                      ),
                      Text(
                        "Diagnosis",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
                                    0.05),
                        child: Text(
                          "${widget.doctorReportData.diagnosis}",
                          //"The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab.",
                          style: TextStyleHelper.style12R
                              .copyWith(color: ColorHelper.grayText),
                        ),
                      ),
                      //--------------------------------------
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
                      ),
                      Text(
                        "Advices",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
                                    0.05),
                        child: Text(
                          "${widget.doctorReportData.advices}",
                          //"Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better.",
                          style: TextStyleHelper.style12R
                              .copyWith(color: ColorHelper.grayText),
                        ),
                      ),

                      //--------------------------------------
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
                      ),
                      Text(
                        "Medicines",
                        style: TextStyleHelper.style14B,
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                FixedVariables.widthScreenQuery(contextReportDetailsCubit) *
                                    0.02),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:medicineList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: FixedVariables.widthScreenQuery(context) * 0.01,
                                vertical: FixedVariables.heightScreenQuery(context) * 0.01,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: FixedVariables.widthScreenQuery(context) * 0.02,
                                  vertical: FixedVariables.heightScreenQuery(context) * 0.012,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorHelper.mainShadow,
                                  borderRadius: BorderRadius.circular(
                                      FixedVariables.radius12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${medicineList[index].medicineName}",
                                      style: TextStyleHelper.style12R.copyWith(color: ColorHelper.mainColor),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${medicineList[index].medicineDate}", style: TextStyleHelper.style8R
                                        .copyWith(color: ColorHelper.grayText),
                                    ),
                                    SizedBox(
                                      width: FixedVariables.widthScreenQuery(context)*0.02,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height:
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
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
                            FixedVariables.heightScreenQuery(contextReportDetailsCubit) * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (state is ReportDetailsInitial && state.status == ReportDetailsStatus.loading)
                ? Container(
                    width: FixedVariables.widthScreenQuery(contextReportDetailsCubit),
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
