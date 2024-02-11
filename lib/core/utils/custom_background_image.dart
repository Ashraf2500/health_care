import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomBackgroundImage extends StatelessWidget {
  CustomBackgroundImage({
    Key? key,
    this.top,
    this.bottom,
  }) : super(key: key);

  final bool? top;

  final bool? bottom;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (top==true || top == null)
            ? Align(
                alignment: Alignment.topRight,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      ImageHelper.rectangle1,
                      color: ColorHelper.mainShadow,
                      width: _widthScreen * 0.484,
                      height: _heightScreen * 0.167, //142
                    ),
                    Image.asset(
                      ImageHelper.rectangle1,
                      color: ColorHelper.mainColor,
                      height: _heightScreen * 0.134, //114
                    ),
                  ],
                ),
              )
            : SizedBox(),
        (bottom==true || bottom == null)
            ? Align(
                alignment: Alignment.bottomLeft,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      ImageHelper.rectangle2,
                      color: ColorHelper.mainShadow,
                      width: _widthScreen * 0.339,
                      height: _heightScreen * 0.098,
                    ),
                    Image.asset(
                      ImageHelper.rectangle2,
                      color: ColorHelper.mainColor,
                      height: _heightScreen * 0.065,
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
