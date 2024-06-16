import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

class CustomMessageChat extends StatelessWidget {
  const CustomMessageChat({
    Key? key,
    this.message,
    this.file,
    required this.fromUser,
  }) : super(key: key);

  final String? message;
  final String? file;
  final bool fromUser;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment:
      (fromUser) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            //margin: (message)?EdgeInsets.only(left: 100),
            padding: EdgeInsets.symmetric(
                horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
                vertical: FixedVariables.heightScreenQuery(context) * 0.01),
            decoration: (!fromUser)
                ? BoxDecoration(
              //color: ColorHelper.mainShadow.withOpacity(0.6),
                color: ColorHelper.gray300.withOpacity(0.6),
                borderRadius: BorderRadius.circular(FixedVariables.radius8))
                : BoxDecoration(
              //color: ColorHelper.mainShadow.withOpacity(0.6),
                color: ColorHelper.mainColor,
                borderRadius:
                BorderRadius.circular(FixedVariables.radius8)),

            child: Column(
              children: [
               // if (file != null || file!=null ) Image.network("https://graduation-9a7o.onrender.com/src/files/avatar/$file"),
                //-----------------------------------------
                SizedBox(
                  height: FixedVariables.heightScreenQuery(context)*0.02,
                ),
                if (message != null)
                  (fromUser)
                      ? Text(
                    "$message",
                    textDirection: (langdetect.detect(message!) == "ar")
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    //style: TextStyleHelper.style14M,
                    style: TextStyleHelper.style14M
                        .copyWith(color: ColorHelper.whiteColor),
                  )
                      :  Text(
                    "$message",
                    textDirection:
                    (langdetect.detect(message!) == "ar")
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    //style: TextStyleHelper.style14M,
                    style: TextStyleHelper.style14M,
                  ),



              ],
            ),
          ),
        )
      ],
    );
  }
}