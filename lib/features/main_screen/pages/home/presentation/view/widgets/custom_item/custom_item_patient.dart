import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomItemPatient extends StatelessWidget {
  CustomItemPatient({
    Key? key,
    required this.index,
    required this.listOfAllPatientData,
  }) : super(key: key);

  int index;

  List<AllPatientData> listOfAllPatientData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.8,
      child: Container(
        height: FixedVariables.heightScreenQuery(context) * 0.24,
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
            ]),
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
                        "${listOfPopularDoctors[0].image}",
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
                      width: FixedVariables.widthScreenQuery(context) * 0.45,
                      child: Text(
                        "${listOfAllPatientData[index].name}",
                        style: TextStyleHelper.style14B,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${listOfAllPatientData[index].phone}",
                      style: TextStyleHelper.style12B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
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
                Spacer(),
                CustomButton(
                  onPressed: () {
                    context.read<DeleteUserCubit>().deleteUser(context: context, userId: listOfAllPatientData[index].id);
                  },
                  text: "Remove",
                  backgroundColor: ColorHelper.gray200,
                  textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                  widthButton: FixedVariables.widthScreenQuery(context) * 0.31,
                  heightButton: FixedVariables.heightScreenQuery(context) * 0.05,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Send Message",
                //       style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //     SizedBox(
                //       height: FixedVariables.heightScreenQuery(context) * 0.00,
                //     ),
                //     SizedBox(height: 25,width: 25,child: Image.asset(ImageHelper.chatIcon,color: ColorHelper.mainColor,)),
                //     Text(
                //       "tomorrow",
                //       style: TextStyleHelper.style12M
                //           .copyWith(color: ColorHelper.grayText),
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ],
                // ),

                // CustomButton(
                //   onPressed: () {
                //     context.read<GetDoctorInfoCubit>().getDoctorInfo(
                //         index: index,
                //         popularDoctorsData: listOfPopularDoctorsData[index]);
                //     RoutingHelper.navToDoctorInfo(context);
                //     context.read<GetDoctorScheduleCubit>().getDoctorSchedule(
                //         context: context,
                //         doctorId: listOfPopularDoctorsData[index].id ?? "");
                //   },
                //   text: "Details",
                //   textStyle: TextStyleHelper.style12B
                //       .copyWith(color: ColorHelper.whiteColor),
                //   widthButton: FixedVariables.widthScreenQuery(context) * 0.31,
                //   heightButton:
                //   FixedVariables.heightScreenQuery(context) * 0.05,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
