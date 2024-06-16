import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
class MyReportsPatient extends StatelessWidget {
  const MyReportsPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Reports",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: BlocBuilder<DeleteReportCubit,DeleteReportState>(
        builder: (context ,deletingState) {
            return Stack(
              children: [
                BlocBuilder<GetPatientReportsCubit,GetPatientReportsState>(
                    builder: (context,patientReportsState) {
                      if(patientReportsState is LoadingGetPatientReportsState){
                        return Container(
                          height: FixedVariables.heightScreenQuery(context)*0.86,
                          width: FixedVariables.widthScreenQuery(context),
                          padding: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context) * 0.02, horizontal: FixedVariables.widthScreenQuery(context)*0.04),
                          child: Shimmer.fromColors(
                            baseColor: ColorHelper.gray300,
                            highlightColor: ColorHelper.gray100,
                            child: Skeletonizer(
                              enabled: true,
                              child: ListView.builder(
                                itemCount: 10,
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: FixedVariables.heightScreenQuery(context)*0.00,
                                    ),
                                    margin: EdgeInsets.only(
                                      bottom: FixedVariables.heightScreenQuery(context)*0.012,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ColorHelper.gray100.withOpacity(0.5),width: 2),
                                      borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: FixedVariables.widthScreenQuery(context)*0.2,
                                          height: FixedVariables.heightScreenQuery(context)*0.06,
                                          margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.01),
                                          decoration: BoxDecoration(
                                            color: ColorHelper.gray200,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: FixedVariables.widthScreenQuery(context)*0.5,
                                                  height: FixedVariables.heightScreenQuery(context)*0.01,
                                                  margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                                  decoration: BoxDecoration(
                                                    color: ColorHelper.gray200,
                                                    borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: FixedVariables.widthScreenQuery(context)*0.1,
                                                ),
                                                Container(
                                                  width: FixedVariables.widthScreenQuery(context)*0.06,
                                                  height: FixedVariables.heightScreenQuery(context)*0.02,
                                                  margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.00),
                                                  decoration: BoxDecoration(
                                                    color: ColorHelper.gray200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: FixedVariables.widthScreenQuery(context)*0.5,
                                              height: FixedVariables.heightScreenQuery(context)*0.01,
                                              margin: EdgeInsets.symmetric(vertical: FixedVariables.heightScreenQuery(context)*0.012),
                                              decoration: BoxDecoration(
                                                color: ColorHelper.gray200,
                                                borderRadius: BorderRadius.circular(FixedVariables.radius100),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      }else if(patientReportsState is SuccessGetPatientReportsState){
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
                          child: Column(
                            children: [
                              SizedBox(
                                height: FixedVariables.heightScreenQuery(context)*0.02,
                              ),
                              Flexible(
                                child: RefreshIndicator(
                                  onRefresh: ()async{
                                    context.read<GetPatientReportsCubit>().getPatientReports(context: context);
                                  },
                                  child: ListView.builder(
                                      itemCount: patientReportsState.patientReports.length,
                                      padding: EdgeInsets.only(top: FixedVariables.heightScreenQuery(context)*0.00),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:  EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.015),
                                          child: GestureDetector(
                                            onTap: (){
                                              //RoutingHelper.navToReport(context);
                                              Navigator.push(context, PageTransition(
                                                child: BlocProvider(
                                                  create: (context) => ReportDetailsCubit(),
                                                  child: CustomReportPatient(patientReportData:patientReportsState.patientReports[index]),
                                                ),
                                                type: PageTransitionType.fade,
                                                curve: Curves.fastEaseInToSlowEaseOut,
                                                duration: Duration(milliseconds: FixedVariables.pageTransition),
                                              ));
                                            },
                                            child: CustomReportViewPatient(
                                              listOfItems: patientReportsState.patientReports[index],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      else{
                        return Text("Error");
                      }
                    }
                ),
                (deletingState is LoadingDeleteReportState)?Container(
                    color: ColorHelper.blackColor.withOpacity(0.3),
                    child: Center(child: CircularProgressIndicator(),
                    )):SizedBox(),
              ],
            );
        }
      ),
    );
  }
}
