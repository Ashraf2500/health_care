import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class SetSchedule extends StatelessWidget {
  const SetSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          left: FixedVariables.widthScreenQuery(context)*0.1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPressed: (){},
              borderRadius: BorderRadius.circular(FixedVariables.radius12),
              elevation: 6,
              widthButton: FixedVariables.widthScreenQuery(context)*0.7,
              child: Text(
                "Save",
                style: TextStyleHelper.style16B.copyWith(color: ColorHelper.whiteColor),
              ),
            ),
            FloatingActionButton(
              onPressed: (){},
              backgroundColor: ColorHelper.mainColor,
              child: Icon(Icons.add,color: ColorHelper.whiteColor,),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: FixedVariables.widthScreenQuery(context)*0.04,
            vertical: FixedVariables.heightScreenQuery(context)*0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context,index){
                    return Padding(
                      padding:  EdgeInsets.only(
                        bottom:FixedVariables.heightScreenQuery(context)*0.02,
                      ),
                      child: Card(
                        color: ColorHelper.whiteColor,
                        surfaceTintColor:ColorHelper.whiteColor,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(FixedVariables.radius8)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: FixedVariables.widthScreenQuery(context)*0.02,
                                  vertical: FixedVariables.heightScreenQuery(context)*0.008,
                                ),
                                decoration: BoxDecoration(
                                    color: ColorHelper.mainShadow.withOpacity(0.5),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(FixedVariables.radius8),
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: FixedVariables.widthScreenQuery(context)*0.01,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sunday",
                                          style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                                        ),
                                        Icon(Icons.highlight_remove_sharp,color: ColorHelper.mainColor,size: 18,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:FixedVariables.heightScreenQuery(context)*0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: FixedVariables.widthScreenQuery(context)*0.04,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "From",
                                          style: TextStyleHelper.style10B,
                                        ),
                                        SizedBox(
                                          height:FixedVariables.heightScreenQuery(context)*0.01,
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              height:FixedVariables.heightScreenQuery(context)*0.05,
                                              width: FixedVariables.widthScreenQuery(context)*0.24,
                                              child: Center(
                                                child: Text(
                                                  "8:00 AM",
                                                  style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorHelper.mainShadow.withOpacity(0.5),
                                                borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(FixedVariables.radius8),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              height:FixedVariables.heightScreenQuery(context)*0.05,
                                              width: FixedVariables.widthScreenQuery(context)*0.09,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.av_timer,color: ColorHelper.whiteColor,),
                                                  // Text(
                                                  //   "Set",
                                                  //   style: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                                                  // ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorHelper.mainColor.withOpacity(0.8),
                                                borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(FixedVariables.radius8),
                                                ),
                                              ),

                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "To",
                                          style: TextStyleHelper.style10B,
                                        ),
                                        SizedBox(
                                          height:FixedVariables.heightScreenQuery(context)*0.01,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height:FixedVariables.heightScreenQuery(context)*0.05,
                                              width: FixedVariables.widthScreenQuery(context)*0.24,
                                              child: Center(
                                                child: Text(
                                                  "8:00 AM",
                                                  style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorHelper.mainShadow.withOpacity(0.5),
                                                borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(FixedVariables.radius8),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              height:FixedVariables.heightScreenQuery(context)*0.05,
                                              width: FixedVariables.widthScreenQuery(context)*0.09,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.av_timer,color: ColorHelper.whiteColor,),
                                                  // Text(
                                                  //   "Set",
                                                  //   style: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                                                  // ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorHelper.mainColor.withOpacity(0.8),
                                                borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(FixedVariables.radius8),
                                                ),
                                              ),

                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:FixedVariables.heightScreenQuery(context)*0.018,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
