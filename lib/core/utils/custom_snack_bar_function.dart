import 'package:flutter/material.dart';

import '../../features/features_exports.dart';


void showSnackbar({required BuildContext context , required String message ,required  Color backGroundColor, TextStyle? contentTextStyle ,int? durationMSeconds,  }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: contentTextStyle?? TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
        ),
      ),
      backgroundColor: backGroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: FixedVariables.widthScreenQuery(context)*0.05,
        vertical: FixedVariables.heightScreenQuery(context)*0.025,
      ),
      duration: Duration(milliseconds:durationMSeconds?? 3000),

    ),
  );
}