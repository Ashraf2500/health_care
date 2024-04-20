import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomBackAppBar({
    super.key,
    required this.context,
    required this.title,
    this.centerTitle ,
    this.hasArrowBack = true,
    this.hasActions = false,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.arrowColor,
    this.appBarHeight,
    this.elevation,
    this.shadowColor,
  });

  String title;

  BuildContext context;
  bool? centerTitle;
  bool hasArrowBack;
  bool hasActions;
  List<Widget>? actions;
  Color? backgroundColor ;
  Color? titleColor ;
  Color? arrowColor ;
  double? appBarHeight ;
  double? elevation ;
  Color? shadowColor ;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return AppBar(
      scrolledUnderElevation: elevation??0,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.02),
        child: Text(
          "$title",
          style: TextStyleHelper.style16B.copyWith(color: titleColor),
        ),
      ),
      elevation: elevation,
      shadowColor: shadowColor,
      backgroundColor: backgroundColor?? ColorHelper.backWhiteColor,
      leading: (hasArrowBack != false)
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: _heightScreen * 0.02),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: arrowColor??ColorHelper.mainColor,
                ),
              ),
            )
          : SizedBox(),
      centerTitle: centerTitle??true,
      actions: (hasActions==true)?actions??[]:[],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(appBarHeight?? MediaQuery.of(context).size.height * 0.05);
}
