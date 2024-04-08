import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomAppointmentItem extends StatelessWidget {
   CustomAppointmentItem({
    Key? key,
     this.showPhone,
     this.showSpecialist,
     this.specialistColor,
     this.dateColor,
     this.timeColor,
     this.colorRowDateTime,
     this.withDetails,
     this.withCancel,
     this.withOptions,
     required this.index,
     required this.listOfItems,


  }) : super(key: key);

   int index ;
   List<AppointmentModel> listOfItems;
   Color? specialistColor ;
   Color? dateColor ;
   Color? timeColor ;
   Color? colorRowDateTime;

   bool? showPhone = true;
   bool? showSpecialist = false;

   bool? withDetails = false;
   bool? withCancel = false;
   bool? withOptions = false;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Card(

      child: Container(
        //height: _heightScreen*0.234,
        height:(withDetails==true || withCancel==true)? _heightScreen*0.24 :_heightScreen*0.17,
        //height: _heightScreen*0.24,
        width: _widthScreen,
        decoration: BoxDecoration(
          color: ColorHelper.whiteColor,
          border: Border.all(
            color: ColorHelper.boxShadow.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(FixedVariables.radius12),

        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.02 ).copyWith(top: _heightScreen*0.015),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: _heightScreen*0.09,
                    width: _widthScreen*.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(listOfItems[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _widthScreen*0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _heightScreen*0.006,
                      ),
                      Text(
                        "${listOfItems[index].name}",
                        style: TextStyleHelper.style14B,
                      ),
                      (showPhone==true)?Text(
                        "${listOfItems[index].phone}",
                        style: TextStyleHelper.style14R.copyWith(color: ColorHelper.grayText),
                      ):SizedBox(),
                      (showSpecialist==true)?Container(
                        width: _widthScreen*0.51,
                        child: Text(
                          "${listOfItems[index].specialist}",
                          style: TextStyleHelper.style14R.copyWith(color:specialistColor??ColorHelper.grayText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ):SizedBox(),
                    ],
                  ),
                  Spacer(),
                  (withOptions==true)?Icon(Icons.more_vert,size: 20,color: ColorHelper.grayText):SizedBox(),
                ],
              ),
            ),
           Spacer(),
            Transform.translate(
              offset: Offset(0,FixedVariables.heightScreenQuery(context)*0.001),
              child: Container(
                height: FixedVariables.heightScreenQuery(context)*0.04,
                padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ),
                decoration: BoxDecoration(
                  color: colorRowDateTime,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(FixedVariables.radius12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageHelper.calenderIcon2,width: 15,color: dateColor??ColorHelper.grayText,),
                    SizedBox(
                      width:4 ,
                    ),
                    Text(
                      "${listOfItems[index].date}",
                      style: TextStyleHelper.style12R.copyWith(color: dateColor?? ColorHelper.grayText),
                    ),
                    Spacer(),
                    Icon(Icons.watch_later_outlined,size: 20,color: timeColor?? ColorHelper.grayText,),
                    SizedBox(
                      width:4 ,
                    ),
                    Text(
                      "${listOfItems[index].time}",
                      style: TextStyleHelper.style12R.copyWith(color: timeColor?? ColorHelper.grayText),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height:(withDetails==true || withCancel==true)?_heightScreen*0.014:0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.03 ).copyWith(bottom: (colorRowDateTime==null)?_heightScreen*0.012:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (withDetails==true)?CustomButton(
                    onPressed: (){},
                    isOutlined: true,
                    text:"Details",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.whiteColor),
                    heightButton: _heightScreen*0.05,
                    widthButton:  (withCancel==true)?_widthScreen*0.4:_widthScreen*0.83,
                    backgroundColor: ColorHelper.mainColor,
                    outlinedBorderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(FixedVariables.radius8),
                  ):SizedBox(),
                  (withCancel==true)?CustomButton(
                    onPressed: (){},
                    isOutlined: true,
                    text:"Cancel",
                    textStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                    heightButton: _heightScreen*0.05,
                    widthButton: (withDetails==true)?_widthScreen*0.4:_widthScreen*0.8,
                    backgroundColor: ColorHelper.gray300.withOpacity(0.9),
                    outlinedBorderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(FixedVariables.radius8),
                  ):SizedBox(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
