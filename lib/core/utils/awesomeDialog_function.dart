import 'package:flutter/material.dart';

import 'package:health_care/features/features_exports.dart';

AwesomeDialog awesomeDialog(
    {required BuildContext context,
    required String message,
    required void Function()? okOnPress,
    DialogType? dialogType}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType ?? DialogType.success,
    dismissOnTouchOutside: false,
    body: Center(
      child: Text(
        '$message',
        style: TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnCancelColor: ColorHelper.mainColor,
    btnOkColor: ColorHelper.mainColor,
    btnOkOnPress: okOnPress,
  )..show();
}
