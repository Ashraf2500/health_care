import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class DoctorInfoBody extends StatelessWidget {
  DoctorInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<GetDoctorInfoCubit, GetDoctorInfoState>(
      builder: (context, stateOfDoctor) {
        if(stateOfDoctor is GitDoctorInfoChanged){
          int index =  stateOfDoctor.index ;
          return Padding(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: _heightScreen * 0.13,
                          width: _widthScreen * 0.26,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(FixedVariables.radius12),
                            image: DecorationImage(
                              image: AssetImage(
                                "${ImageHelper.doctor_6}",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _widthScreen * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: _widthScreen*0.45,
                              child: Text(
                                "${stateOfDoctor.popularDoctorsData.name}",
                                style: TextStyleHelper.style14B,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: _widthScreen*0.45,
                              child: Text(
                                "${checkDepartmentOfDoctorFunc(departmentId: stateOfDoctor.popularDoctorsData.speciality)}",
                                style: TextStyleHelper.style12B
                                    .copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(
                              width: _widthScreen*0.45,
                              child: Text(
                                "${stateOfDoctor.popularDoctorsData.phone}",
                                  style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                              ),
                            ),
                            Text(
                              "${stateOfDoctor.popularDoctorsData.expertment} Experience ",
                              style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: _heightScreen * 0.01,
                            ),
                            RatingBar.builder(
                              initialRating: (stateOfDoctor.popularDoctorsData.ratingPoints==null)?0:stateOfDoctor.popularDoctorsData.ratingPoints!.toDouble() ,
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
                    SizedBox(
                      height: _heightScreen * 0.04,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyleHelper.style18B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    BlocBuilder<GetDoctorScheduleCubit,GetDoctorScheduleState>(
                      builder: (context,stateSchedule) {
                        if(stateSchedule is LoadingGetDoctorScheduleState){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: _widthScreen,
                                height: _heightScreen*0.2,
                                child: Shimmer.fromColors(
                                  baseColor: ColorHelper.gray300,
                                  highlightColor: ColorHelper.gray100,
                                  child: Skeletonizer(
                                    enabled: true,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      padding: EdgeInsets.all(0),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: _widthScreen,
                                          height: _heightScreen*0.02,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: _heightScreen * 0.065,
                              ),
                              Text(
                                "Evaluate doctor",
                                style: TextStyleHelper.style18B
                                    .copyWith(color: ColorHelper.mainColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: _heightScreen * 0.01,
                              ),
                              BlocBuilder<RatingCubit,RatingState>(
                                  builder: (context,ratingState) {
                                    return Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 25,
                                          ignoreGestures: false,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                          unratedColor: ColorHelper.noActiveStar,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: ColorHelper.activeStar,
                                          ),
                                          onRatingUpdate: (rating) {
                                            context.read<RatingCubit>().sendRating(context: context, doctorId: stateOfDoctor.popularDoctorsData.id??"", rate: rating);
                                          },
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: (ratingState is LoadingRatingState)
                                              ?CircularProgressIndicator()
                                              :(ratingState is SuccessRatingState)?Icon(Icons.check,color: ColorHelper.mainColor,):SizedBox(),
                                        ),
                                      ],
                                    );
                                  }
                              ),
                              SizedBox(
                                height: _heightScreen * 0.08,
                              ),
                              CustomButton(
                                onPressed: () {
                                  showSnackbar(context: context, message: "Please Wait !", backGroundColor: ColorHelper.mainColor);
                                },
                                text: "Book Now",
                              ),
                            ],
                          );;
                        }
                        else if (stateSchedule is SuccessGetDoctorScheduleState){
                          String saturday =  stateSchedule.doctorSchedule.saturday??"";
                          String sunday =  stateSchedule.doctorSchedule.sunday??"";
                          String monday =  stateSchedule.doctorSchedule.monday??"";
                          String tuesday =  stateSchedule.doctorSchedule.tuesday??"";
                          String wednesday =  stateSchedule.doctorSchedule.wednesday??"";
                          String thursday =  stateSchedule.doctorSchedule.thursday??"";
                          String friday =  stateSchedule.doctorSchedule.friday??"";
                          List<String> days= [];
                          if(saturday!=""){
                            days.add("Saturday");
                          }
                          if(sunday!=""){
                            days.add("Sunday");
                          }
                          if(monday!=""){
                            days.add("Monday");
                          }
                          if(tuesday!=""){
                            days.add("Tuesday");
                          }
                          if(wednesday!=""){
                            days.add("Wednesday");
                          }
                          if(thursday!=""){
                            days.add("Thursday");
                          }
                          if(friday!=""){
                            days.add("Friday");
                          }

                          return SizedBox(
                            height: _heightScreen*0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (saturday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Saturday      :  ${saturday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (sunday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "sunday         :  ${sunday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (sunday=="")
                                    ?Text(
                                     "No available days !",
                                      style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.clip,
                                    ) :SizedBox(),
                                (monday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "monday        :  ${monday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (tuesday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "tuesday        :  ${tuesday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (wednesday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "wednesday  :  ${wednesday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (thursday!="")?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "thursday       :  ${thursday}",
                                      style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: _heightScreen * 0.01,
                                    ),
                                  ],
                                ):SizedBox(),
                                (friday!="")?Text(
                                  "friday            :  ${friday}",
                                  style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                                  overflow: TextOverflow.ellipsis,
                                ):SizedBox(),

                                SizedBox(
                                  height: _heightScreen * 0.04,
                                ),
                                Text(
                                  "Evaluate doctor",
                                  style: TextStyleHelper.style18B
                                      .copyWith(color: ColorHelper.mainColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: _heightScreen * 0.01,
                                ),
                                BlocBuilder<RatingCubit,RatingState>(
                                    builder: (context,ratingState) {
                                      return Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 25,
                                            ignoreGestures: false,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                            unratedColor: ColorHelper.noActiveStar,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: ColorHelper.activeStar,
                                            ),
                                            onRatingUpdate: (rating) {
                                              context.read<RatingCubit>().sendRating(context: context, doctorId: stateOfDoctor.popularDoctorsData.id??"", rate: rating);
                                            },
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: (ratingState is LoadingRatingState)
                                                ?CircularProgressIndicator()
                                                :(ratingState is SuccessRatingState)?Icon(Icons.check,color: ColorHelper.mainColor,):SizedBox(),
                                          ),
                                        ],
                                      );
                                    }
                                ),
                                Spacer(),
                                CustomButton(
                                  onPressed: () {
                                    context.read<CreateAppointmentCubit>().setDays(listOfDays: days);
                                    context.read<CreateAppointmentCubit>().setDoctorsData(dataOfDoctor:stateOfDoctor.popularDoctorsData );
                                    RoutingHelper.navToBookAppointmentTime(context);
                                  },
                                  text: "Book Now",
                                ),
                                SizedBox(
                                  height: _heightScreen * 0.02,
                                ),
                              ],

                            ),
                          );
                        }
                        else {
                          return Text(
                            "Unknown Schedule",
                            style: TextStyleHelper.style14M.copyWith(color: ColorHelper.grayText),
                            overflow: TextOverflow.ellipsis,
                          );
                        }
                      }
                    ),

                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
