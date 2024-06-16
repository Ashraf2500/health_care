import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPersonChatItem extends StatelessWidget {
  CustomPersonChatItem({
    Key? key,
    this.messageColor,
    this.timeColor,
    required this.index,
    required this.listOfItems,
    this.newMessage = false,


  }) : super(key: key);

  int index ;
  List<AllProfileChatData> listOfItems;
  Color? messageColor ;
  Color? timeColor ;
  bool newMessage ;


  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height:_heightScreen*0.12,
          width: _widthScreen,
          margin: EdgeInsets.symmetric(horizontal: _widthScreen*0.01,),
          decoration: BoxDecoration(
            color: ColorHelper.whiteColor,
            border: Border.all(
              color: ColorHelper.boxShadow.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(FixedVariables.radius12),

            boxShadow: [
              BoxShadow(
                color: ColorHelper.gray200,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(2, 1.5),
              ),
            ],
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.02 ).copyWith(top: _heightScreen*0.015),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _heightScreen*0.08,
                  width: _widthScreen*.19,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImageHelper.person1),// todo listOfItems[index].destination?.avatar
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
                      "${listOfItems[index].destination?.name}",
                      style: TextStyleHelper.style14B,
                    ),
                    Container(
                      width: _widthScreen*0.51,
                      child: Text(
                        "${listOfItems[index].content??"Hello"}",
                        style: TextStyleHelper.style14R.copyWith(color:messageColor??ColorHelper.grayText),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: FixedVariables.widthScreenQuery(context)*0.57,
                        ),
                        //todo

                      ],
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
              margin: EdgeInsets.symmetric(horizontal:FixedVariables.widthScreenQuery(context)*0.04 ).copyWith(top: _heightScreen*0.01),
              child: Center(
                child: Text(
                  "0${listOfItems[index].destination?.createdAt?.hour}:0${listOfItems[index].destination?.createdAt?.minute}",
                  style: TextStyleHelper.style10R,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
