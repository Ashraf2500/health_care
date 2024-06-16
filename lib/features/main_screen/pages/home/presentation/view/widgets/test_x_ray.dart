
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/manager/check_x_ray/check_x_ray_cubit.dart';
import 'package:image_picker/image_picker.dart';

class TestXRay extends StatefulWidget {
  const TestXRay({Key? key}) : super(key: key);

  @override
  State<TestXRay> createState() => _TestXRayState();
}

class _TestXRayState extends State<TestXRay> {
 // bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckXRayCubit,CheckXRayState>(
      builder: (context , stateResult) {
        return Stack(
          children: [
            Scaffold(
              appBar: CustomBackAppBar(
                context: context,
                title: "Check X-Ray",
                centerTitle: true,
                hasArrowBack: true,
                titleColor: ColorHelper.whiteColor,
                backgroundColor: ColorHelper.mainColor,
                arrowColor: ColorHelper.whiteColor,
                elevation: 3.5,
                shadowColor: ColorHelper.mainColor,
                appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
              ),
              body: Stack(
                children: [
                  Container(
                    width: FixedVariables.widthScreenQuery(context),
                    height: FixedVariables.heightScreenQuery(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/png_images/background_chatbot.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: FixedVariables.heightScreenQuery(context) * 0.04,
                      horizontal: FixedVariables.widthScreenQuery(context) * 0.06,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<TakeXRayImageCubit, TakeXRayImageState>(
                          builder: (context, state) {
                            File? image = context.read<TakeXRayImageCubit>().image;
                            if (image == null) {
                              return Column(
                                children: [
                                  Container(
                                    width: FixedVariables.widthScreenQuery(context) * 0.6,
                                    height: FixedVariables.heightScreenQuery(context) * 0.4,
                                    child: Image.asset(
                                      ImageHelper.xRayTest1,
                                      color: Color(0xff0c9ca6),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            FixedVariables.widthScreenQuery(context) * 0.12,
                                        vertical:
                                            FixedVariables.heightScreenQuery(context) *
                                                0.1),
                                    decoration: BoxDecoration(
                                        color: ColorHelper.mainShadow,
                                        shape: BoxShape.circle
                                        //borderRadius: BorderRadius.circular(FixedVariables.radius12),
                                        ),
                                  ),
                                  SizedBox(
                                    height: FixedVariables.widthScreenQuery(context) * 0.02,
                                  ),
                                  Text(
                                    "Choose an image from the camera or from the gallery, but it is preferable that it be from the image from the gallery and that it has been scanned to ensure the quality of the image.",
                                    style: TextStyleHelper.style12B.copyWith(
                                        color: ColorHelper.grayText.withOpacity(0.4)),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: FixedVariables.widthScreenQuery(context) * 0.1,
                                  ),

                                  Container(
                                    child: Text(
                                      "Chest diagnosis (Covid 19)",
                                      style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor.withOpacity(0.8)),
                                    ),
                                  ),

                                ],
                              );
                            }
                            return Column(
                              children: [
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(context) * 0.04,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(FixedVariables.radius8),
                                  ),
                                  child: Container(
                                    width: FixedVariables.widthScreenQuery(context) * 0.9,
                                    height: FixedVariables.heightScreenQuery(context) * 0.4,
                                    child: Image.file(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorHelper.gray300,

                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: FixedVariables.widthScreenQuery(context),
                                  color: ColorHelper.whiteColor,
                                ),
                                GestureDetector(
                                  onTap: (){

                                    context.read<CheckXRayCubit>().checkXrayFunc(context: context, file: XFile(image.path), image: image);
                                    /*setState(() {
                                      isLoading = true;
                                    });
                                    Future.delayed(const Duration(seconds: 1), () {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckXRayDiagnosis(image: image)));
                                    });
        */
                                  },
                                  child: Container(
                                    height: FixedVariables.heightScreenQuery(context)*0.065,
                                    width: FixedVariables.widthScreenQuery(context),
                                    decoration: BoxDecoration(
                                      color: Color(0xff0c9ca6),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(FixedVariables.radius8)
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check",
                                            style: TextStyleHelper.style16B.copyWith(color:ColorHelper.whiteColor),
                                          ),
                                          SizedBox(
                                            width: FixedVariables.widthScreenQuery(context)*0.02,
                                          ),
                                          Icon(Icons.arrow_right_outlined,size: 35,color: ColorHelper.whiteText,),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                context.read<TakeXRayImageCubit>().takeImage(
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
                                context.read<TakeXRayImageCubit>().takeImage(
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

                      ],
                    ),
                  ),
                ],
              ),
            ),
            (stateResult is LoadingCheckXRayState)?Container(
                height:FixedVariables.heightScreenQuery(context),
                width: FixedVariables.widthScreenQuery(context),
                color: ColorHelper.blackColor.withOpacity(0.4),
                child: Center(child: CircularProgressIndicator())):SizedBox(),
          ],
        );
      }
    );
  }
}
