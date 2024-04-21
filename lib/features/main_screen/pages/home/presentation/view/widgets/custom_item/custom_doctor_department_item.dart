import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomDoctorDepartmentItem extends StatelessWidget {
   CustomDoctorDepartmentItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index ;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.8,
      child: Container(
        height: FixedVariables.heightScreenQuery(context)*0.24,
        width: FixedVariables.widthScreenQuery(context),
        padding: EdgeInsets.symmetric(
            horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
            vertical: FixedVariables.heightScreenQuery(context) * 0.02),
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
                  height: FixedVariables.heightScreenQuery(context) * 0.12,
                  width: FixedVariables.widthScreenQuery(context) * 0.26,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(FixedVariables.radius12),
                    image: DecorationImage(
                      image: AssetImage(
                        "${listOfPopularDoctors[index].image}",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: FixedVariables.widthScreenQuery(context) * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: FixedVariables.widthScreenQuery(context)*0.45,
                      child: Text(
                        "${listOfPopularDoctors[index].name}",
                        style: TextStyleHelper.style14B,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${listOfPopularDoctors[index].specialist}",
                      style: TextStyleHelper.style12B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${listOfPopularDoctors[index].Experience}",
                      style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.01,
                    ),
                    RatingBar.builder(
                      initialRating: listOfPopularDoctors[index].evaluate,
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
              height: FixedVariables.heightScreenQuery(context) * 0.02,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Available",
                      style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: FixedVariables.heightScreenQuery(context) * 0.00,
                    ),
                    Text(
                      "10:00 AM tomorrow",
                      style: TextStyleHelper.style12M
                          .copyWith(color: ColorHelper.grayText),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Spacer(),
                CustomButton(
                  onPressed: () {
                    RoutingHelper.navToBookAppointmentTime(context);
                  },
                  text: "Book Now",
                  textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                  widthButton: FixedVariables.widthScreenQuery(context)*0.32,
                  heightButton: FixedVariables.heightScreenQuery(context)*0.05,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
