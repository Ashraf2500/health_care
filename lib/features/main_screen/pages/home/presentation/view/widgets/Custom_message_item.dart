import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

class CustomMessageItem extends StatelessWidget {
  const CustomMessageItem({
    Key? key,
    this.message,
    this.image,
    required this.fromUser,
  }) : super(key: key);

  final String? message;
  final Image? image;
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
                if (image != null ) image!,
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
                      : ((context.read<ChatBotCubit>().canScroll == false) && (message == context.read<ChatBotCubit>().contentMessages.last.text))
                          ? AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 0,
                              onTap: () {
                                context.read<ChatBotCubit>().startScroll();
                              },
                              onFinished: () {
                                context.read<ChatBotCubit>().startScroll();
                              },
                              animatedTexts: [
                                TyperAnimatedText(
                                  message!.trim(),
                                  speed: Duration(milliseconds: 10),
                                  textStyle: TextStyleHelper.style14M,
                                  textAlign:
                                      (langdetect.detect(message!) == "ar")
                                          ? TextAlign.right
                                          : TextAlign.left,
                                ),
                              ],
                            )
                          : Text(
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
