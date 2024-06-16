import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class PatientScheduleDetails extends StatelessWidget {
   PatientScheduleDetails({
    Key? key,
     required this.patientAppointmentData
  }) : super(key: key);

  final PatientAppointmentData patientAppointmentData ;

  @override
  Widget build(BuildContext context) {

    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        title: "Appointment Details",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _widthScreen * 0.04, vertical: _heightScreen * 0.03),
        child: Card(
          elevation: 0.8,
          child: Container(
            height: _heightScreen,
            width: _widthScreen,
            padding: EdgeInsets.symmetric(
                horizontal: _widthScreen * 0.06,
                vertical: _heightScreen * 0.04),
            decoration: BoxDecoration(
                color: ColorHelper.whiteColor,
                borderRadius: BorderRadius.circular(FixedVariables.radius12),
                boxShadow: [
                  BoxShadow(
                    color: ColorHelper.gray200,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                ]
            ),
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Doctor Information",
                      style: TextStyleHelper.style14B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: _widthScreen*0.00,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.doctor?.name}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.doctor?.phone}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Speciality : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${checkDepartmentOfDoctorFunc(departmentId: patientAppointmentData.doctor?.speciality)}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Experience : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.doctor?.expertment}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Rating : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              RatingBar.builder(
                                initialRating: (patientAppointmentData.doctor?.ratingPoints==null)?0:patientAppointmentData.doctor!.ratingPoints!.toDouble() ,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                unratedColor: ColorHelper.noActiveStar,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: ColorHelper.activeStar,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _heightScreen * 0.02,
                    ),
                    Text(
                      "Sender Information",
                      style: TextStyleHelper.style14B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: _widthScreen*0.00,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.owner?.name}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.owner?.phone}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),



                        ],
                      ),
                    ),
                    SizedBox(
                      height: _heightScreen * 0.02,
                    ),

                    Text(
                      "Patient Information",
                      style: TextStyleHelper.style14B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: _widthScreen*0.00,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.name}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.phone}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Gender : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${(patientAppointmentData.sex==1)?"Male":"Female"}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Age : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.age}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "City : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.city}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                
                
                
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _heightScreen * 0.02,
                    ),

                    Text(
                      "Appointment Information",
                      style: TextStyleHelper.style14B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: _widthScreen*0.00,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Turn : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${patientAppointmentData.turn}",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          (patientAppointmentData.completed==1)
                              ?Row(
                            children: [
                              Text(
                                "State : ",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Completed",
                                style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ):Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Turn now : ",
                                    style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${patientAppointmentData.turn}",
                                    style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time on Turn : ",
                                    style: TextStyleHelper.style14M.copyWith(color: ColorHelper.mainColor),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${ patientAppointmentData.turnLeftDurationString}",
                                    style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: _heightScreen * 0.02,
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyleHelper.style14B
                              .copyWith(color: ColorHelper.mainColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: _heightScreen * 0.01,
                        ),
                        Container(
                          width: _widthScreen*0.8,
                          padding: EdgeInsets.symmetric(
                            vertical: _heightScreen*0.01,
                            horizontal: _widthScreen*0.02,
                          ),
                          decoration: BoxDecoration(
                              //color: ColorHelper.mainShadow.withOpacity(0.3),
                              color: ColorHelper.gray100,
                              borderRadius: BorderRadius.circular(FixedVariables.radius4)
                          ),
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: (patientAppointmentData.description!.replaceAll(RegExp(r'\s+'), '').isNotEmpty)
                                ?SingleChildScrollView(
                              child: Text(
                                "${patientAppointmentData.description}",
                                style: TextStyleHelper.style12M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.clip,
                              ),
                            )
                                :Center(
                              child: Text(
                                "There is no description",
                                style: TextStyleHelper.style12M.copyWith(color: ColorHelper.grayText),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Spacer(),
                    // CustomButton(
                    //   onPressed: ()async{
                    //     await context.read<DeleteAppointmentCubit>().deleteAppointment(context: context, appointmentId: patientAppointmentData.id);
                    //     // context.read<PatientScheduleCubit>().PatientAppointmentInfo;
                    //   },
                    //   isOutlined: true,
                    //   text:"Cancel",
                    //   textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                    //   heightButton: _heightScreen*0.05,
                    //   widthButton:_widthScreen*0.83,
                    //   backgroundColor: ColorHelper.gray300,
                    //   outlinedBorderColor: Colors.transparent,
                    //   borderRadius: BorderRadius.circular(FixedVariables.radius8),
                    // ),
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
