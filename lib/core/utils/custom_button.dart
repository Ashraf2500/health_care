import 'package:flutter/material.dart';
import '../core_exports.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key,
     this.backgroundColor,
     this.heightButton,
     this.widthButton,
     this.elevation,
     this.textStyle,
     this.borderRadius,
     this.isOutlined,
     this.outlinedBorderColor,
     this.marginAllSides,
     this.marginHorizontalSides,
     this.marginVerticalSides,
     required this.onPressed,
     required this.text,
  }) : super(key: key);

   final String text ;
   final VoidCallback onPressed;
   final bool? isOutlined ;
   final Color? backgroundColor ;
   final double? heightButton ;
   final double? widthButton ;
   final double? elevation ;
   final TextStyle? textStyle ;
   final Color? outlinedBorderColor ;
   final BorderRadiusGeometry? borderRadius ;
   final double? marginAllSides ;
   final double? marginHorizontalSides ;
   final double? marginVerticalSides ;


  @override
  Widget build(BuildContext context) {
    return (isOutlined==null || isOutlined==false) ?
           _buildElevatedButton(context):
           _buildOutlinedButton(context);

  }

  Widget _buildElevatedButton(BuildContext context) {
     return Padding(
       padding:  (marginAllSides!=null)?EdgeInsets.all(marginAllSides!)
                 :EdgeInsets.symmetric(vertical:marginVerticalSides??0 ,
                                       horizontal: marginHorizontalSides??0),
       child: ElevatedButton(
         onPressed: onPressed,
         style: ElevatedButton.styleFrom(
           elevation: elevation,
           backgroundColor: backgroundColor ?? ColorHelper.mainColor,
           fixedSize: Size(
             widthButton?? MediaQuery.of(context).size.width,
             heightButton?? FixedVariables.heightButton,
           ),
           shape: RoundedRectangleBorder(
             borderRadius: borderRadius ?? BorderRadius.circular(FixedVariables.radius),
           ),
         ),

         child: Text(
           text,
           style: textStyle?? TextStyleHelper.style16B.copyWith(color: ColorHelper.whiteColor) ,
         ),
       ),
     );
   }

  Widget _buildOutlinedButton(BuildContext context) {
    return Padding(
           padding:  (marginAllSides!=null)?EdgeInsets.all(marginAllSides!)
                     :EdgeInsets.symmetric(vertical:marginVerticalSides??0 ,
                                           horizontal: marginHorizontalSides??0),
           child: OutlinedButton(
             onPressed: onPressed,
             style: OutlinedButton.styleFrom(
               elevation: elevation,
               backgroundColor: backgroundColor ?? Colors.transparent,
               fixedSize: Size(
                 widthButton?? MediaQuery.of(context).size.width,
                 heightButton?? FixedVariables.heightButton,
               ),
               side: BorderSide(color: outlinedBorderColor??ColorHelper.mainColor),
               shape: RoundedRectangleBorder(
                 borderRadius: borderRadius ??
                     BorderRadius.circular(FixedVariables.radius),
               ),
             ),

             child: Text(
                   text,
                   style: textStyle?? TextStyleHelper.style16B.copyWith(color: ColorHelper.mainColor) ,
                 ),
               ),
         );
  }

}



