import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:health_care/features/features_exports.dart';

class SetScheduleSharf extends StatefulWidget {
  const SetScheduleSharf({Key? key}) : super(key: key);

  @override
  State<SetScheduleSharf> createState() => _SetScheduleSharfState();
}

class _SetScheduleSharfState extends State<SetScheduleSharf> with TickerProviderStateMixin{

  late AnimationController controller;

  late TextEditingController _dayNameController ;
  late TextEditingController _hourScheduleController ;
  late TextEditingController _minuteScheduleController ;

  @override
  void initState() {
    String? _userId = context
        .read<CurrentUserDataCubit>()
        .currentUserId;
    context
        .read<GetDoctorScheduleSharfCubit>()
        .getDoctorSchedule(context: context, doctorId: _userId!);

    _dayNameController = TextEditingController();
    _hourScheduleController = TextEditingController();
    _minuteScheduleController = TextEditingController();

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds:1 );
    super.initState();
  }

  @override
  void dispose() {
    _dayNameController.dispose();
    _hourScheduleController.dispose();
    _minuteScheduleController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorScheduleSharfCubit,GetDoctorScheduleSharfState>(
      builder: (context,stateSchedule) {
        if( stateSchedule is LoadingGetDoctorScheduleSharfState){
          return Center(child: CircularProgressIndicator());
        }else if(stateSchedule is SuccessGetDoctorScheduleSharfState){
          return Scaffold(
            appBar: CustomBackAppBar(
              context: context,
              title: "Schedule",
              titleColor: ColorHelper.whiteColor,
              backgroundColor: ColorHelper.mainColor,
              arrowColor: ColorHelper.whiteColor,
              elevation: 3.5,
              shadowColor: ColorHelper.mainColor,
              appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(
                left: FixedVariables.widthScreenQuery(context) * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: () {
                      Future.delayed(Duration(seconds:2 ));
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.success,
                        dismissOnTouchOutside: false,
                        body: Center(
                          child: Text(
                            'success',
                            style: TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor),
                          ),
                        ),
                        title: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnCancelColor: ColorHelper.mainColor,
                        btnOkColor: ColorHelper.mainColor,
                        btnOkOnPress: (){

                        },
                      )..show();
                    },
                    borderRadius: BorderRadius.circular(FixedVariables.radius12),
                    elevation: 6,
                    widthButton: FixedVariables.widthScreenQuery(context) * 0.7,
                    child: Text(
                      "Save",
                      style: TextStyleHelper.style16B
                          .copyWith(color: ColorHelper.whiteColor),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        transitionAnimationController: controller,
                        showDragHandle: true,
                        backgroundColor: ColorHelper.backWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(FixedVariables.radius24),
                          ),
                        ),

                        builder: (context) {
                          return Container(
                            height: FixedVariables.heightScreenQuery(context)*0.6,
                            padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.055 ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Add Day",
                                    style: TextStyleHelper.style20B.copyWith(color: ColorHelper.blackColor.withOpacity(0.8)),
                                  ),
                                ),

                                SizedBox(
                                  height:  FixedVariables.heightScreenQuery(context)*0.03,
                                ),
                                CustomTextFormField(
                                  controller: _dayNameController,
                                  hintText: "Day",
                                  marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
                                  prefixIcon: Icon(Icons.date_range,color: ColorHelper.blackColor.withOpacity(0.6),),
                                  borderColor: ColorHelper.blackColor.withOpacity(0.5),
                                ),
                                Row(
                                  children: [
                                    CustomTextFormField(
                                      controller: _hourScheduleController,
                                      hintText: "Hour",
                                      widthFilled: FixedVariables.widthScreenQuery(context)*0.41,
                                      marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
                                      prefixIcon: Icon(Icons.schedule,color: ColorHelper.blackColor.withOpacity(0.6),),
                                      borderColor: ColorHelper.blackColor.withOpacity(0.5),
                                    ),
                                    Spacer(),
                                    CustomTextFormField(
                                      controller: _minuteScheduleController,
                                      hintText: "Minute",
                                      widthFilled: FixedVariables.widthScreenQuery(context)*0.41,
                                      marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
                                      prefixIcon: Icon(Icons.access_time_outlined,color: ColorHelper.blackColor.withOpacity(0.6),),
                                      borderColor: ColorHelper.blackColor.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:  FixedVariables.heightScreenQuery(context)*0.04,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CustomButton(
                                    onPressed: (){
                                      if(stateSchedule is SuccessGetDoctorScheduleSharfState){
                                        //context.read<GetDoctorScheduleSharfCubit>().addDay(listOfDoctorSchedule: stateSchedule.listOfDoctorSchedule, getScheduleSharfModel: GetScheduleSharfModel(day:_dayNameController.text,time:'${(int.parse(_hourScheduleController.text)<10)?"0${_hourScheduleController.text}":"${_hourScheduleController.text}"}-${(int.parse(_minuteScheduleController.text)<10)?"0${_minuteScheduleController.text}":"${_minuteScheduleController.text}"}'));
                                        context.read<GetDoctorScheduleSharfCubit>().addDay(listOfDoctorSchedule: stateSchedule.listOfDoctorSchedule, getScheduleSharfModel: GetScheduleSharfModel(day:_dayNameController.text,time:"${_hourScheduleController.text}-${_minuteScheduleController.text}"));
                                        Navigator.pop(context);
                                        print(stateSchedule.listOfDoctorSchedule.length);
                                      }
                                    },
                                    text: "Add",


                                  ),
                                ),
                                SizedBox(
                                  height:  FixedVariables.heightScreenQuery(context)*0.04,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: ColorHelper.mainColor,
                    child: Icon(
                      Icons.add,
                      color: ColorHelper.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              height: FixedVariables.heightScreenQuery(context) * 0.8,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                    vertical: FixedVariables.heightScreenQuery(context) * 0.04,
                  ),
                  child:(stateSchedule is LoadingGetDoctorScheduleSharfState)
                      ? Center(child: CircularProgressIndicator())
                      : (stateSchedule is SuccessGetDoctorScheduleSharfState)
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: stateSchedule.listOfDoctorSchedule.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: FixedVariables.heightScreenQuery(
                                  context) *
                                  0.02,
                            ),
                            child: Card(
                              color: ColorHelper.whiteColor,
                              surfaceTintColor: ColorHelper.whiteColor,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        FixedVariables.radius8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                        FixedVariables.widthScreenQuery(
                                            context) *
                                            0.02,
                                        vertical:
                                        FixedVariables.heightScreenQuery(
                                            context) *
                                            0.008,
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorHelper.mainShadow
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                FixedVariables.radius8),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                          FixedVariables.widthScreenQuery(
                                              context) *
                                              0.01,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${stateSchedule.listOfDoctorSchedule[index]
                                                    .day}",
                                                style: TextStyleHelper.style12B
                                                    .copyWith(
                                                    color: ColorHelper
                                                        .mainColor),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                      GetDoctorScheduleSharfCubit>()
                                                      .deleteDay(
                                                      listOfDoctorSchedule: stateSchedule
                                                          .listOfDoctorSchedule,
                                                      getScheduleSharfModel:
                                                      stateSchedule
                                                          .listOfDoctorSchedule[
                                                      index]);
                                                },
                                                child: Icon(
                                                  Icons.highlight_remove_sharp,
                                                  color: ColorHelper.mainColor,
                                                  size: 18,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(
                                          context) *
                                          0.01,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                        FixedVariables.widthScreenQuery(
                                            context) *
                                            0.04,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "From",
                                              //   style: TextStyleHelper.style10B,
                                              // ),
                                              SizedBox(
                                                height: FixedVariables
                                                    .heightScreenQuery(
                                                    context) *
                                                    0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: FixedVariables
                                                        .heightScreenQuery(
                                                        context) *
                                                        0.05,
                                                    width: FixedVariables
                                                        .widthScreenQuery(
                                                        context) *
                                                        0.7,
                                                    child: Center(
                                                      child: Text(
                                                        "${stateSchedule.listOfDoctorSchedule[index].time}",
                                                        style: TextStyleHelper
                                                            .style12B
                                                            .copyWith(
                                                            color: ColorHelper
                                                                .mainColor),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorHelper
                                                          .mainShadow
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                      BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            FixedVariables
                                                                .radius8),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: FixedVariables
                                                        .heightScreenQuery(
                                                        context) *
                                                        0.05,
                                                    width: FixedVariables
                                                        .widthScreenQuery(
                                                        context) *
                                                        0.09,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Icon(
                                                          Icons.av_timer,
                                                          color: ColorHelper
                                                              .whiteColor,
                                                        ),
                                                        // Text(
                                                        //   "Set",
                                                        //   style: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                                                        // ),
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorHelper
                                                          .mainColor
                                                          .withOpacity(0.8),
                                                      borderRadius:
                                                      BorderRadius.horizontal(
                                                        right: Radius.circular(
                                                            FixedVariables
                                                                .radius8),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //   CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       "To",
                                          //       style: TextStyleHelper.style10B,
                                          //     ),
                                          //     SizedBox(
                                          //       height: FixedVariables
                                          //           .heightScreenQuery(
                                          //           context) *
                                          //           0.01,
                                          //     ),
                                          //     Row(
                                          //       children: [
                                          //         Container(
                                          //           height: FixedVariables
                                          //               .heightScreenQuery(
                                          //               context) *
                                          //               0.05,
                                          //           width: FixedVariables
                                          //               .widthScreenQuery(
                                          //               context) *
                                          //               0.24,
                                          //           child: Center(
                                          //             child: Text(
                                          //               "${stateSchedule.listOfDoctorSchedule[index].time?.replaceRange(0,4, "")}",
                                          //               style: TextStyleHelper
                                          //                   .style12B
                                          //                   .copyWith(
                                          //                   color: ColorHelper
                                          //                       .mainColor),
                                          //             ),
                                          //           ),
                                          //           decoration: BoxDecoration(
                                          //             color: ColorHelper
                                          //                 .mainShadow
                                          //                 .withOpacity(0.5),
                                          //             borderRadius:
                                          //             BorderRadius.horizontal(
                                          //               left: Radius.circular(
                                          //                   FixedVariables
                                          //                       .radius8),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Container(
                                          //           height: FixedVariables
                                          //               .heightScreenQuery(
                                          //               context) *
                                          //               0.05,
                                          //           width: FixedVariables
                                          //               .widthScreenQuery(
                                          //               context) *
                                          //               0.09,
                                          //           child: Row(
                                          //             mainAxisAlignment:
                                          //             MainAxisAlignment
                                          //                 .center,
                                          //             children: [
                                          //               Icon(
                                          //                 Icons.av_timer,
                                          //                 color: ColorHelper
                                          //                     .whiteColor,
                                          //               ),
                                          //               // Text(
                                          //               //   "Set",
                                          //               //   style: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                                          //               // ),
                                          //             ],
                                          //           ),
                                          //           decoration: BoxDecoration(
                                          //             color: ColorHelper
                                          //                 .mainColor
                                          //                 .withOpacity(0.8),
                                          //             borderRadius:
                                          //             BorderRadius.horizontal(
                                          //               right: Radius.circular(
                                          //                   FixedVariables
                                          //                       .radius8),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(
                                          context) *
                                          0.018,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ): Center(child: Text("There is an error")),
                ),
              ),
            ),
          );
        }else{
          return Center(child: Text("There is an error"));
        }

      }
    );
  }

  Future<dynamic> addScheduleBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: FixedVariables.heightScreenQuery(context)*0.4,
            color: ColorHelper.whiteColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Modal BottomSheet'),
                  ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------

}
