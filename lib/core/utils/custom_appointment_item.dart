import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomAppointmentItem extends StatelessWidget {
   CustomAppointmentItem({
    Key? key,
     this.showPhone,
     this.showSpecialist,
     this.withDetails,
     this.withCancel,
     this.withOptions,
     required this.index,
     required this.listOfItems,


  }) : super(key: key);

   int index ;
   List<AppointmentModel> listOfItems;

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
        padding: EdgeInsets.all( FixedVariables.padding12 ).copyWith(bottom: _heightScreen*0.015),
        decoration: BoxDecoration(
          color: ColorHelper.whiteColor,
          border: Border.all(
            color: ColorHelper.boxShadow.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(FixedVariables.radius12),

        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _heightScreen*0.08,
                  width: _widthScreen*.18,
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
                        style: TextStyleHelper.style14R.copyWith(color: ColorHelper.grayText),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ):SizedBox(),
                  ],
                ),
                Spacer(),
                (withOptions==true)?Icon(Icons.more_vert,size: 20,color: ColorHelper.grayText):SizedBox(),
              ],
            ),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageHelper.calenderIcon,width: 20,color: ColorHelper.grayText,),
                //Icon(Icons.calendar_month_outlined,size: 20,color: ColorHelper.grayText,),
                SizedBox(
                  width:4 ,
                ),
                Text(
                  "${listOfItems[index].date}",
                  style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                ),
                Spacer(),
                Icon(Icons.watch_later_outlined,size: 20,color: ColorHelper.grayText,),
                SizedBox(
                  width:4 ,
                ),
                Text(
                  "${listOfItems[index].time}",
                  style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                ),

              ],
            ),
            SizedBox(
              height:(withDetails==true || withCancel==true)?_heightScreen*0.02:0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (withDetails==true)?CustomButton(
                  onPressed: (){},
                  isOutlined: true,
                  text:"Details",
                  textStyle: TextStyleHelper.style14B,
                  heightButton: _heightScreen*0.06,
                  widthButton:  (withCancel==true)?_widthScreen*0.38:_widthScreen*0.83,
                  backgroundColor: ColorHelper.mainShadow,
                  outlinedBorderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(FixedVariables.radius100),
                ):SizedBox(),
                (withCancel==true)?CustomButton(
                  onPressed: (){},
                  isOutlined: true,
                  text:"Cancel",
                  textStyle: TextStyleHelper.style14B,
                  heightButton: _heightScreen*0.055,
                  widthButton: (withDetails==true)?_widthScreen*0.38:_widthScreen*0.8,
                  backgroundColor: ColorHelper.mainShadow,
                  outlinedBorderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(FixedVariables.radius100),
                ):SizedBox(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
