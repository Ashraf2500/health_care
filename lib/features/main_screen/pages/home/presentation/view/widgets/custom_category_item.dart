import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomCategoryItem extends StatelessWidget {
  CustomCategoryItem({
    Key? key,
    required this.index,

  }) : super(key: key);

  int index ;
  UserType? _userType;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen =  MediaQuery.of(context).size.width;
    _userType = context.read<UserCubit>().userType;
    return Container(
      width: _widthScreen*0.23,
      decoration: BoxDecoration(
        color: ColorHelper.mainShadow,
        borderRadius: BorderRadius.circular(FixedVariables.radius16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              (_userType == UserType.patient)
                  ? AllCategories[StringsApp.patientUser]![index].image
                  :(_userType == UserType.doctor)
                  ?AllCategories[StringsApp.doctorUser]![index].image
                  : AllCategories[StringsApp.adminUser]![index].image,
              height: _heightScreen*0.05,
            ),
            SizedBox(
              height: _heightScreen*0.01,
            ),
            Text(
              (_userType == UserType.patient)
                  ? AllCategories[StringsApp.patientUser]![index].label
                  :(_userType == UserType.doctor)
                  ?AllCategories[StringsApp.doctorUser]![index].label
                  : AllCategories[StringsApp.adminUser]![index].label,
              style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
