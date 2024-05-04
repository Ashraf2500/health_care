import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class SelectTimeItem extends StatelessWidget {
  const SelectTimeItem({
    Key? key,
    required this.text,
    required this.isChosen,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.paddingHorizontal,
    this.paddingVertical,
    this.marginHorizontal,
    this.marginVertical,

  }) : super(key: key);

  final String text ;
  final bool isChosen  ;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? marginHorizontal;
  final double? marginVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "$text",
          style: textStyle?? TextStyleHelper.style12B.copyWith(color: textColor??ColorHelper.mainColor),
        ),
      ),
      decoration: BoxDecoration(
          color:backgroundColor?? ColorHelper.mainShadow.withOpacity(0.5),
          borderRadius: BorderRadius.circular(FixedVariables.radius8)
      ),

    );
  }
}
