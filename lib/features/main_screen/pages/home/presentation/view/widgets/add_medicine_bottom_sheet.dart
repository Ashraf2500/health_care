import 'package:flutter/material.dart';

import 'package:health_care/features/features_exports.dart';

class AddMedicineBottomSheet extends StatefulWidget {
  @override
  _AddMedicineBottomSheetState createState() => _AddMedicineBottomSheetState();
}
class _AddMedicineBottomSheetState extends State<AddMedicineBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds:1 );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          transitionAnimationController: controller,
          showDragHandle: true,
          backgroundColor: ColorHelper.backWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(FixedVariables.radius24),
            ),
          ),

          builder: (context) {
            return Container(
              height: FixedVariables.heightScreenQuery(context)*0.4,
              padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.055 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Add Medicine",
                      style: TextStyleHelper.style20B.copyWith(color: ColorHelper.blackColor.withOpacity(0.8)),
                    ),
                  ),

                  SizedBox(
                    height:  FixedVariables.heightScreenQuery(context)*0.03,
                  ),
                  CustomTextFormField(
                    hintText: "Medicine name",
                    marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
                    prefixIcon: Icon(Icons.medical_information_outlined,color: ColorHelper.blackColor.withOpacity(0.6),),
                    borderColor: ColorHelper.blackColor.withOpacity(0.5),
                  ),
                  CustomTextFormField(
                    hintText: "Schedule",
                    marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
                    prefixIcon: Icon(Icons.schedule,color: ColorHelper.blackColor.withOpacity(0.6),),
                    borderColor: ColorHelper.blackColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    height:  FixedVariables.heightScreenQuery(context)*0.04,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      text: "Save",



                    ),
                  ),
                  SizedBox(
                    height:  FixedVariables.heightScreenQuery(context)*0.04,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: FixedVariables.heightScreenQuery(context)*0.06,
        width: FixedVariables.widthScreenQuery(context)*0.12,
        margin: EdgeInsets.only(
          bottom: FixedVariables.heightScreenQuery(context)*0.06,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.grayText.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.add , color: ColorHelper.whiteColor,size: 30,),
        ),
      ),
    );
    // return IconButton(
    //   onPressed: (){
    //     showModalBottomSheet(
    //       context: context,
    //       isScrollControlled: true,
    //       transitionAnimationController: controller,
    //       showDragHandle: true,
    //       backgroundColor: ColorHelper.backWhiteColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.vertical(
    //           top: Radius.circular(FixedVariables.radius24),
    //         ),
    //       ),
    //
    //       builder: (context) {
    //         return Container(
    //           height: FixedVariables.heightScreenQuery(context)*0.646,
    //           padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.055 ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Center(
    //                 child: Text(
    //                   "Change Password",
    //                   style: TextStyleHelper.style20B.copyWith(color: ColorHelper.blackColor.withOpacity(0.8)),
    //                 ),
    //               ),
    //
    //               SizedBox(
    //                 height:  FixedVariables.heightScreenQuery(context)*0.03,
    //               ),
    //               CustomTextFormField(
    //                 hintText: "Current Password",
    //                 marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
    //                 prefixIcon: Icon(Icons.lock_outline_rounded,color: ColorHelper.blackColor.withOpacity(0.6),),
    //                 borderColor: ColorHelper.blackColor.withOpacity(0.5),
    //               ),
    //               CustomTextFormField(
    //                 hintText: "New Password",
    //                 marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
    //                 prefixIcon: Icon(Icons.lock_outline_rounded,color: ColorHelper.blackColor.withOpacity(0.6),),
    //                 borderColor: ColorHelper.blackColor.withOpacity(0.5),
    //               ),
    //               CustomTextFormField(
    //                 hintText: "Confirm Password",
    //                 marginVerticalSides:  FixedVariables.heightScreenQuery(context)*0.01,
    //                 prefixIcon: Icon(Icons.lock_outline_rounded,color: ColorHelper.blackColor.withOpacity(0.6),),
    //                 borderColor: ColorHelper.blackColor.withOpacity(0.5),
    //               ),
    //               SizedBox(
    //                 height:  FixedVariables.heightScreenQuery(context)*0.01,
    //               ),
    //               Align(
    //                 alignment: Alignment.topRight,
    //                 child: InkWell(
    //                   onTap: (){
    //                     RoutingHelper.navToTakePhone(context);
    //                   },
    //                   child: Text(
    //                     "Forget Password",
    //                     style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height:  FixedVariables.heightScreenQuery(context)*0.08,
    //               ),
    //               Align(
    //                 alignment: Alignment.topRight,
    //                 child: CustomButton(
    //                   onPressed: (){
    //                     RoutingHelper.navToLoginReplace(context);
    //                   },
    //                   text: "Create",
    //
    //
    //
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     );
    //   },
    //   icon:Icon(Icons.arrow_forward_ios_rounded,color: ColorHelper.grayText,),
    // );
  }
}

