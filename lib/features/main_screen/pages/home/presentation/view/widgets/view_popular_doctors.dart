import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomViewPopularDoctors extends StatelessWidget {
  const CustomViewPopularDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<ShowMorePopularDoctorsCubit,
        ShowMorePopularDoctorsState>(
      builder: (context, state) {
        if (state is morePopularDoctorsChanged) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: FixedVariables.ScreenPadding22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Doctors",
                      style: TextStyleHelper.style14B,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ShowMorePopularDoctorsCubit>()
                            .morePopularDoctors();
                        if (state.enableShow == false) {
                          context
                              .read<MorePopularDoctorsCubit>()
                              .lessPopularDoctor();
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            (state.enableShow) ? "See Less" : "See More",
                            style: TextStyleHelper.style10B.copyWith(
                              color: ColorHelper.grayText.withOpacity(0.7),
                            ),
                          ),
                          Icon(
                            (state.enableShow)
                                ? Icons.arrow_drop_down_rounded
                                : Icons.arrow_right_rounded,
                            color: ColorHelper.grayText.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _heightScreen * 0.02,
              ),
              (state.enableShow)
                  ? Container(
                      width: _widthScreen,
                      margin: EdgeInsets.only(
                          right: FixedVariables.ScreenPadding22),
                      padding: EdgeInsets.symmetric(
                        horizontal: _widthScreen * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: ColorHelper.whiteColor,
                        borderRadius:
                            BorderRadius.circular(FixedVariables.radius16),
                      ),
                      child: BlocBuilder<MorePopularDoctorsCubit,
                          MorePopularDoctorsState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: FixedVariables.countItemOfPerRow,
                                    crossAxisSpacing: _widthScreen*0.03,
                                    childAspectRatio: 1 / 1.5,
                                    mainAxisSpacing: _heightScreen*0.01,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: _heightScreen * 0.011),
                                  itemCount: context
                                      .read<MorePopularDoctorsCubit>()
                                      .newPopularDoctorItems,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomPopularDoctorItem(
                                        index: index);
                                  }),
                              (state is MorePopularDoctorState)
                                  ? TextButton(
                                      onPressed: () {
                                        if (state.canMore == true) {
                                          context
                                              .read<MorePopularDoctorsCubit>()
                                              .morePopularDoctor();
                                        } else {
                                          context
                                              .read<
                                                  ShowMorePopularDoctorsCubit>()
                                              .morePopularDoctors();
                                        }
                                      },
                                      child: Text(
                                        (state.canMore == true)
                                            ? "More ... ?"
                                            : "Show Less  ?",
                                        style: TextStyleHelper.style12S
                                            .copyWith(
                                                color: (state.canMore == true)
                                                    ? ColorHelper.mainColor
                                                    : ColorHelper.grayText
                                                        .withOpacity(0.7)),
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: _heightScreen * 0.02,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Container(
                      height: _heightScreen * 0.3,
                      padding: EdgeInsets.only(left: _widthScreen * .01),
                      decoration: BoxDecoration(
                        color: ColorHelper.whiteColor,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(FixedVariables.radius12),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: (listOfPopularDoctors.length >= 5)
                            ? FixedVariables.initialNumPopularDoctors
                            : listOfPopularDoctors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: _widthScreen * 0.42,
                            padding: EdgeInsets.symmetric(
                                horizontal: _widthScreen * 0.015,
                                vertical: _heightScreen * 0.011),
                            child: CustomPopularDoctorItem(
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
