import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomDoctorsDepartments extends StatelessWidget {
  const CustomDoctorsDepartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        title: "Doctors",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      backgroundColor: ColorHelper.backWhiteColor,
      body: BlocBuilder<DeleteDoctorCubit,DeleteDoctorState>(
            builder: (context,removeDoctorState) {
              return Stack(
                children: [
                  BlocBuilder<ChooseDoctorDepartmentCubit, ChooseDoctorDepartmentState>(
                      builder: (context, chooseCategory) {
                        int indexCategory = context.read<ChooseDoctorDepartmentCubit>().indexCategory;
                        return BlocBuilder<GetPopularDoctorsCubit, GetPopularDoctorsState>(
                            builder: (context, doctorState) {
                              return Container(
                                height: FixedVariables.heightScreenQuery(context),
                                padding: EdgeInsets.only(
                                  left: FixedVariables.horizontalPaddingScreen(context),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.04,
                                    ),
                                    Text(
                                      "Departments",
                                      style: TextStyleHelper.style14B,
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.015,
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.095,
                                      child: ListView.builder(
                                          itemCount: ListOfDepartments.listOfDoctorsDepartments.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                context.read<ChooseDoctorDepartmentCubit>().changeCategory(categoryIndex: index);
                                              },
                                              child: Container(
                                                width: FixedVariables.widthScreenQuery(context) * 0.2,
                                                margin: EdgeInsets.only(right: FixedVariables.widthScreenQuery(context) * 0.02),
                                                decoration: BoxDecoration(
                                                  color: (index == indexCategory) ? ColorHelper.mainColor : ColorHelper.mainShadow,
                                                  borderRadius: BorderRadius.circular(FixedVariables.radius16),
                                                ),
                                                child: Center(
                                                  child: (index == 0)
                                                      ? Text(
                                                    "All",
                                                    style: TextStyleHelper.style18B.copyWith(
                                                      color: (index == indexCategory)
                                                          ? ColorHelper.whiteColor
                                                          : ColorHelper.mainColor,
                                                    ),
                                                  )
                                                      : SvgPicture.asset(ListOfDepartments.listOfDoctorsDepartments[index].image,
                                                    height: FixedVariables.heightScreenQuery(context) * 0.05,
                                                    colorFilter: ColorFilter.mode((index == indexCategory) ? ColorHelper.whiteColor : ColorHelper.mainColor, BlendMode.srcIn),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.02,
                                    ),
                                    Text(
                                      "All Doctors",
                                      style: TextStyleHelper.style14B,
                                    ),
                                    SizedBox(
                                      height: FixedVariables.heightScreenQuery(context) * 0.015,
                                    ),

                                    (doctorState is LoadingGetPopularState)
                                        ? Container(
                                      height: FixedVariables.heightScreenQuery(context)*0.64,
                                      width:  FixedVariables.widthScreenQuery(context),
                                      padding: EdgeInsets.symmetric(vertical:  FixedVariables.heightScreenQuery(context) * 0.02, horizontal:  FixedVariables.widthScreenQuery(context)*0.04),
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
                                        : (doctorState is SuccessGetPopularState)
                                        ? Container(
                                      height: FixedVariables.heightScreenQuery(context) * 0.64,
                                      padding: EdgeInsets.only(
                                          right: FixedVariables.horizontalPaddingScreen(context)
                                      ),
                                      child: (doctorState.allDepartments[indexCategory].isNotEmpty)
                                          ? ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: doctorState.allDepartments[indexCategory].length,
                                          padding: EdgeInsets.all(0),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: FixedVariables.heightScreenQuery(context) * 0.01,
                                              ),
                                              child: CustomDoctorDepartmentItem(
                                                index: index,
                                                listOfPopularDoctorsData: doctorState.allDepartments[indexCategory],
                                              ),
                                            );
                                          })
                                          : Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Lottie.asset(ImageHelper.empty_state),
                                            SizedBox(
                                              height: FixedVariables.heightScreenQuery(context) * 0.04,
                                            ),
                                            Text(
                                              "There is no any Doctor ",
                                              style: TextStyleHelper.style14B
                                                  .copyWith(
                                                  color: ColorHelper.gray300
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                  ],
                                ),
                              );
                            });
                      }),
                  (removeDoctorState is LoadingDeleteDoctorState)?Container(
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
