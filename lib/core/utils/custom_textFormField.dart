import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../features/features_exports.dart';


class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    Key? key,
     this.hintText,
     this.hintStyle,
     this.labelText,
     this.labelStyle,
     this.textStyle,
     this.heightFilled,
     this.widthFilled,
     this.borderColor,
     this.focusBorderColor,
     this.enableFilled,
     this.enableBorder,
     this.backgroundFilled,
     this.prefixIcon,
     this.suffixIcon,
     this.sizePrefixIcon,
     this.sizeSuffixIcon,
     this.obscureText,
     this.textAlignVertical,
     this.keyboardType,
     this.autofocus,
     this.controller,
     this.validation,
     this.maxLength,
     this.maxLines,
     this.inputFormatters,
     this.marginHorizontalSides,
     this.marginVerticalSides,
     this.marginAllSides,
     this.onSubmitted,
     this.onChanged,



  }) : super(key: key);

   final String? hintText ;
   final TextStyle? hintStyle ;
   final String? labelText ;
   final TextStyle? labelStyle ;
   final TextStyle? textStyle ;
   final Color? borderColor ;
   final Color? focusBorderColor ;
   final bool? enableFilled ;
   final bool? enableBorder;
   final Color? backgroundFilled;
   final Widget? prefixIcon;
   final Widget? suffixIcon;
   final double? sizePrefixIcon;
   final double? sizeSuffixIcon;
   final bool? obscureText;
   final TextAlignVertical? textAlignVertical;
   final TextInputType? keyboardType;
   final bool? autofocus;
   final double? heightFilled ;
   final double? widthFilled;
   final int? maxLength;
   final int? maxLines;
   final TextEditingController? controller;
   final List<TextInputFormatter>? inputFormatters;
   final double? marginAllSides ;
   final double? marginHorizontalSides ;
   final double? marginVerticalSides ;
   final validation;
   void Function(String text)?  onSubmitted ;
   void Function(String text)?  onChanged ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  (marginAllSides!=null)?EdgeInsets.all(marginAllSides!)
          :EdgeInsets.symmetric(vertical:marginVerticalSides??0 ,
          horizontal: marginHorizontalSides??0),
      child: TextFormField(
        controller: controller,
        validator: validation,
        onFieldSubmitted:onSubmitted,
        onChanged:onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          labelText:labelText,
          labelStyle: labelStyle??TextStyleHelper.style12B.copyWith(color:ColorHelper.mainColor),
          filled: enableFilled ?? true,
          fillColor:backgroundFilled?? Color(0x0A000000),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: prefixIcon,
          ),
          suffixIcon: suffixIcon,
          prefixIconConstraints: BoxConstraints(
            maxHeight: (sizePrefixIcon!=null)?sizePrefixIcon!+25 :55*0.9,
            maxWidth: (sizePrefixIcon!=null)?sizePrefixIcon!+25 : 55*0.9,
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: (sizeSuffixIcon!=null)?sizeSuffixIcon!+25 :55*0.9,
            maxWidth: (sizeSuffixIcon!=null)?sizeSuffixIcon!+25 : 55*0.9
          ),
          constraints: BoxConstraints(
            maxHeight: heightFilled ?? 55,
            maxWidth:  widthFilled ?? MediaQuery.of(context).size.width,

          ),
          //contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: ),
          enabledBorder: (enableBorder==true || enableBorder==null)? _buildOutlineBorder() :_buildUnderlineInputBorder(),
          focusedBorder: (enableBorder==true || enableBorder==null)? _buildFocusedOutlineBorder():_buildFocusedUnderlineInputBorder(),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color:ColorHelper.redColor.shade300,
              width: 2,

            ),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color:ColorHelper.redColor.shade300,
              width: 1,


            ),
          ),
        ),
        style: textStyle,
        obscureText: obscureText?? false,
        textAlignVertical: textAlignVertical??TextAlignVertical.center,
        keyboardType:keyboardType ,
        autofocus:autofocus ?? false,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        maxLines: maxLines??1,

      ),
    );
  }



   OutlineInputBorder _buildOutlineBorder() {
     return  OutlineInputBorder(
       borderRadius:BorderRadius.all(Radius.circular(8.0)),
       borderSide: BorderSide(
         color: borderColor?? backgroundFilled?? Color(0x0A000000),
       ),
     );
   }


   OutlineInputBorder _buildFocusedOutlineBorder() {
     return OutlineInputBorder(
       borderRadius:BorderRadius.all(Radius.circular(8.0)),
       borderSide: BorderSide(
         width: 2,
         color: focusBorderColor ?? ColorHelper.mainColor,
       ),
     );
   }

   UnderlineInputBorder _buildUnderlineInputBorder() {
     return UnderlineInputBorder(
       borderSide: BorderSide(
         width: 1,
         color: borderColor ?? ColorHelper.mainColor,
       ),
     );
   }

   UnderlineInputBorder _buildFocusedUnderlineInputBorder() {
     return UnderlineInputBorder(
       borderSide: BorderSide(
         width: 2,
         color: focusBorderColor ?? ColorHelper.mainColor,
       ),
     );
   }


}



/*
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    Key? key,
     required this.hintText,
     this.textStyle,
     this.height,
     this.width,
     this.hintTextStyle,
     this.obscureText,
     this.textInputType,
     this.prefixWidget,
     this.suffixWidget,


   }) : super(key: key);

   TextStyle? textStyle ;
   TextStyle? hintTextStyle ;
   double? height;
   double? width;
   bool? obscureText;
   String hintText;
   TextInputType? textInputType ;
   Widget? prefixWidget ;
   Widget? suffixWidget ;

   double minusHeight=0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle??TextStyleHelper.textStyle12,
      cursorColor: ColorHelper.mainColor,
      obscureText: obscureText ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      textAlignVertical: TextAlignVertical.bottom,
      decoration:  InputDecoration(
        hintText: hintText,
        hintStyle: TextStyleHelper.textStyle12.copyWith(color: ColorHelper.text2Color),
        prefixIcon:  Padding(
          padding: const EdgeInsets.only(left : 16,right: 10),
          child: prefixWidget,
        ),
        suffixIcon: suffixWidget,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 48,
        ),
        constraints: BoxConstraints(
          maxHeight: height??48,
          maxWidth: width?? double.infinity,

        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: (height==null || height!<= 48 )? 0: (height!-48)*2  ),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildFocusedOutlineBorder(),


      ),
    );
  }
}
*/





