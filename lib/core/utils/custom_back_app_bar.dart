import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomBackAppBar({
    super.key,
    required this.context,
    required this.title,
    this.centerTitle ,
    this.hasArrowBack = true,
    this.backgroundColor,
    this.titleColor,
    this.arrowColor,
  });

  String title;

  BuildContext context;
  bool? centerTitle;
  bool hasArrowBack;
  Color? backgroundColor ;
  Color? titleColor ;
  Color? arrowColor ;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return AppBar(
      scrolledUnderElevation: 0,
      title: Padding(
        padding: EdgeInsets.only(top: _heightScreen * 0.02),
        child: Text(
          "$title",
          style: TextStyleHelper.style16B.copyWith(color: titleColor),
        ),
      ),
      backgroundColor: backgroundColor?? ColorHelper.backWhiteColor,
      leading: (hasArrowBack != false)
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: _heightScreen * 0.02),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: arrowColor??ColorHelper.mainColor,
                ),
              ),
            )
          : SizedBox(),
      centerTitle: centerTitle??true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.05);
}
