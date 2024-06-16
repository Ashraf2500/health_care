import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class AllPatients extends StatelessWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        title: "Patients",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      backgroundColor: ColorHelper.backWhiteColor,
      body: BlocBuilder<DeleteUserCubit,DeleteUserState>(
          builder: (context,removeUserState) {
            return Stack(
              children: [
                BlocBuilder<GetAllPatientsCubit, GetAllPatientsState>(
                    builder: (context, patientState) {
                      return Container(
                        height: FixedVariables.heightScreenQuery(context),
                        padding: EdgeInsets.only(
                          left: FixedVariables.widthScreenQuery(context)*0.04,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: FixedVariables.heightScreenQuery(context) * 0.04,
                            ),

                            (patientState is LoadingGetAllPatientsState)
                                ? Container(
                              height: FixedVariables.heightScreenQuery(context)*0.82,
                              width:  FixedVariables.widthScreenQuery(context),
                              padding: EdgeInsets.only(
                                  top:  FixedVariables.heightScreenQuery(context) * 0.01,
                                  bottom:  FixedVariables.heightScreenQuery(context) * 0.01,
                                  left:  FixedVariables.widthScreenQuery(context)*0.0,
                                  right:  FixedVariables.widthScreenQuery(context)*0.04
                              ),
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
                                        padding: EdgeInsets.symmetric(
                                          vertical:  FixedVariables.heightScreenQuery(context)*0.01,
                                        ),
                                        margin: EdgeInsets.only(
                                          bottom:  FixedVariables.heightScreenQuery(context)*0.01,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: ColorHelper.gray100.withOpacity(0.5),width: 2),
                                          borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: FixedVariables.widthScreenQuery(context)*0.25,
                                                  height:  FixedVariables.heightScreenQuery(context)*0.12,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: FixedVariables.widthScreenQuery(context)*0.04
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: ColorHelper.gray200,
                                                      borderRadius: BorderRadius.circular(FixedVariables.radius8)
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: FixedVariables.widthScreenQuery(context)*0.3,
                                                      height:  FixedVariables.heightScreenQuery(context)*0.01,
                                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.006),
                                                      decoration: BoxDecoration(
                                                        color: ColorHelper.gray200,
                                                        borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: FixedVariables.widthScreenQuery(context)*0.3,
                                                      height:  FixedVariables.heightScreenQuery(context)*0.01,
                                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.006),
                                                      decoration: BoxDecoration(
                                                        color: ColorHelper.gray200,
                                                        borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: FixedVariables.widthScreenQuery(context)*0.3,
                                                      height:  FixedVariables.heightScreenQuery(context)*0.01,
                                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.006),
                                                      decoration: BoxDecoration(
                                                        color: ColorHelper.gray200,
                                                        borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: FixedVariables.widthScreenQuery(context)*0.3,
                                                      height:  FixedVariables.heightScreenQuery(context)*0.01,
                                                      margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.006),
                                                      decoration: BoxDecoration(
                                                        color: ColorHelper.gray200,
                                                        borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height:  FixedVariables.heightScreenQuery(context)*0.02,),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: FixedVariables.widthScreenQuery(context)*0.32,
                                                    height:  FixedVariables.heightScreenQuery(context)*0.045,
                                                    margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                                    decoration: BoxDecoration(
                                                      color: ColorHelper.gray200,
                                                      borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:  FixedVariables.widthScreenQuery(context)*0.32,
                                                    height:  FixedVariables.heightScreenQuery(context)*0.045,
                                                    margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                                    decoration: BoxDecoration(
                                                      color: ColorHelper.gray200,
                                                      borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                                : (patientState is SuccessGetAllPatientsState)
                                ? Container(
                              height: FixedVariables.heightScreenQuery(context) * 0.82,
                              padding: EdgeInsets.only(
                                  right: FixedVariables.horizontalPaddingScreen(context)
                              ),
                              child: (patientState.allPatientData.isNotEmpty)
                                  ? RefreshIndicator(
                                    onRefresh: ()async{
                                         context.read<GetAllPatientsCubit>().getAllPatient(context: context );
                                     },
                                    child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: patientState.allPatientData.length,
                                    padding: EdgeInsets.all(0),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: FixedVariables.heightScreenQuery(context) * 0.01,
                                        ),
                                        child: CustomItemPatient(
                                          index: index,
                                          listOfAllPatientData: patientState.allPatientData,
                                        ),
                                      );
                                    }),
                                  )
                                  : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(ImageHelper.empty_state),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.04,
                                    ),
                                    Text(
                                      "There is no any Patient ",
                                      style: TextStyleHelper.style14B
                                          .copyWith(
                                          color: ColorHelper.gray300
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                : Container(child: Text("Error")),
                          ],
                        ),
                      );
                    }),
                (removeUserState is LoadingDeleteUserState)?Container(
                  height: FixedVariables.heightScreenQuery(context)*0.86,
                  width: FixedVariables.widthScreenQuery(context),
                  decoration: BoxDecoration(
                    color: ColorHelper.blackColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(FixedVariables.radius4),
                  ),
                  child: Center(
                    child: Container(
                        height: FixedVariables.heightScreenQuery(context)*0.1,
                        width:  FixedVariables.widthScreenQuery(context)*0.2,
                        decoration: BoxDecoration(
                          color: ColorHelper.grayText.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(FixedVariables.radius12),
                        ),
                        child: Center(child: CircularProgressIndicator(strokeWidth: 5,))
                    ),
                  ),
                ):SizedBox(),
              ],
            );
          }
      ),
    );
  }
}
