import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class CustomReportViewDoctor extends StatelessWidget {
  CustomReportViewDoctor({
    Key? key,
    this.removeIconColor,
    this.dateColor,
    required this.listOfItems,


  }) : super(key: key);

  DoctorReportData listOfItems;
  Color? removeIconColor ;
  Color? dateColor;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: _widthScreen,
          decoration: BoxDecoration(
              gradient:ColorHelper().shadowLinearGradient,
              border: Border.all(
                color: ColorHelper.gray200,
              ),
              borderRadius: BorderRadius.circular(FixedVariables.radius12),
              boxShadow: [
                BoxShadow(
                  color: ColorHelper.gray200,
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(3, 1.5),
                ),
              ]

          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.02 , vertical: _heightScreen*0.015 ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _heightScreen*0.06,
                  width: _widthScreen*.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImageHelper.doctor_1),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: _widthScreen*0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _heightScreen*0.006,
                    ),
                    Text(
                      "${listOfItems.user?.name}",
                      style: TextStyleHelper.style14B,
                    ),
                    Container(
                      width: _widthScreen*0.51,
                      child: Text(
                        "${listOfItems.createdAt.toString().replaceRange(listOfItems.createdAt.toString().length-8,listOfItems.createdAt.toString().length , "")}",
                        style: TextStyleHelper.style10B.copyWith(color:dateColor??ColorHelper.mainColor.withOpacity(0.9)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              margin: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.03 ).copyWith(top: _heightScreen*0.02),
              child: GestureDetector(
                onTap: (){
                  context.read<DeleteReportCubit>().deleteReport(context: context, reportId: listOfItems.id);
                },
                child: Icon(Icons.delete,size: 18,color: ColorHelper.grayText.withOpacity(0.7),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}