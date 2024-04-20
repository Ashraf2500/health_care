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
                    SvgPicture.asset(
                      ImageHelper.rectangleSvg1,
                      colorFilter: ColorFilter.mode(ColorHelper.mainShadow, BlendMode.srcIn),
                      width: _widthScreen * 0.484,
                      height: _heightScreen * 0.143,
                      // width: _widthScreen * 0.484,
                      // height: _heightScreen * 0.167, //142
                    ),
                    SvgPicture.asset(
                      ImageHelper.rectangleSvg1,
                      colorFilter: ColorFilter.mode(ColorHelper.mainColor, BlendMode.srcIn),
                      height: _heightScreen * 0.134, //114
                      //height: _heightScreen * 0.134, //114
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
                    SvgPicture.asset(
                      ImageHelper.rectangleSvg2,
                      colorFilter: ColorFilter.mode(ColorHelper.mainShadow, BlendMode.srcIn),
                      width: _widthScreen * 0.339,
                      height: _heightScreen * 0.076,
                      // width: _widthScreen * 0.339,
                      // height: _heightScreen * 0.098,
                    ),
                    SvgPicture.asset(
                      ImageHelper.rectangleSvg2,
                      colorFilter: ColorFilter.mode(ColorHelper.mainColor, BlendMode.srcIn),
                      height: _heightScreen * 0.072,
                      //height: _heightScreen * 0.065,
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
