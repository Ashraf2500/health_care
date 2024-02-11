import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPinOtpFields extends StatelessWidget {
  const CustomPinOtpFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      autoFocus: true,
      obscureText: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: ColorHelper.mainColor,
        inactiveColor:  ColorHelper.mainColor,
        inactiveFillColor: ColorHelper.whiteColor,
        activeFillColor: Colors.grey.shade100,
        selectedColor: ColorHelper.mainColor,
        selectedFillColor: ColorHelper.whiteColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: ColorHelper.backWhiteColor,
      enableActiveFill: true,
      onCompleted: (code) {
        //otpCode = code;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },

    );
  }
}
