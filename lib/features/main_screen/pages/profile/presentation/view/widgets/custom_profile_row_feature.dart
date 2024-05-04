import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomProfileRowFeature extends StatelessWidget {
  CustomProfileRowFeature({
    super.key,
    required this.iconSvg,
    required this.title,
    required this.onPressed,
    this.paddingBottom,
    this.isHasSwitch,
    this.switchWidget,

  });

  String iconSvg;
  String title;
  double? paddingBottom;
  bool? isHasSwitch;
  Widget? switchWidget ;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FixedVariables.radius4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom ?? 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  iconSvg,
                  colorFilter:
                      ColorFilter.mode(ColorHelper.mainColor, BlendMode.srcIn),
                  width: FixedVariables.widthScreenQuery(context) * 0.04,
                  height: FixedVariables.heightScreenQuery(context) * 0.04,
                ),
                SizedBox(
                  width: FixedVariables.widthScreenQuery(context) * 0.03,
                  height: FixedVariables.heightScreenQuery(context) * 0.05,
                ),
                Text(
                  title,
                  style: TextStyleHelper.style16M
                      .copyWith(color: ColorHelper.blackColor),
                ),

              ],
            ),
          ),
        ),
        Spacer(),
        (isHasSwitch==true)
            ?switchWidget??SizedBox()
            :SizedBox(),

        SizedBox(
          width: FixedVariables.widthScreenQuery(context)*0.04,
        ),
      ],
    );
  }
}

