
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:image_picker/image_picker.dart';

import '../../manager/edit_photo/edit_photo_cubit.dart';

class custom_method_take_photo extends StatelessWidget {
  const custom_method_take_photo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top :FixedVariables.heightScreenQuery(context) * 0.02,
        bottom :FixedVariables.heightScreenQuery(context) * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              context.read<EditPhotoCubit>().takeImage(
                  context: context, imageSource: ImageSource.gallery);
            },
            backgroundColor: Color(0xff0c9ca6),
            widthButton:
            FixedVariables.widthScreenQuery(context) * 0.42,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(FixedVariables.radius8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: 35,
                  color: ColorHelper.whiteColor,
                ),
                SizedBox(
                  width:
                  FixedVariables.widthScreenQuery(context) * 0.02,
                ),
                Text(
                  "Gallery",
                  style: TextStyleHelper.style14B
                      .copyWith(color: ColorHelper.whiteColor),
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {
              context.read<EditPhotoCubit>().takeImage(
                  context: context, imageSource: ImageSource.camera);
            },
            backgroundColor: Color(0xffb3b3b3),
            widthButton:
            FixedVariables.widthScreenQuery(context) * 0.42,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(FixedVariables.radius8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 35,
                  color: ColorHelper.whiteColor,
                ),
                SizedBox(
                  width:
                  FixedVariables.widthScreenQuery(context) * 0.02,
                ),
                Text(
                  "Camera",
                  style: TextStyleHelper.style14B
                      .copyWith(color: ColorHelper.whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}