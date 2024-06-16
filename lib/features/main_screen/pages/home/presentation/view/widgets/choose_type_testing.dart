//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:health_care/features/features_exports.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Choose_type_testing extends StatefulWidget {
//   const Choose_type_testing({Key? key}) : super(key: key);
//
//   @override
//   State<Choose_type_testing> createState() => _Choose_type_testingState();
// }
//
// class _Choose_type_testingState extends State<Choose_type_testing> {
//   bool isLoading = false ;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           appBar: CustomBackAppBar(
//             context: context,
//             title: "Check X-Ray",
//             centerTitle: true,
//             hasArrowBack: true,
//             titleColor: ColorHelper.whiteColor,
//             backgroundColor: ColorHelper.mainColor,
//             arrowColor: ColorHelper.whiteColor,
//             elevation: 3.5,
//             shadowColor: ColorHelper.mainColor,
//             appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
//           ),
//           body: Stack(
//             children: [
//               Container(
//                 width: FixedVariables.widthScreenQuery(context),
//                 height: FixedVariables.heightScreenQuery(context),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       "assets/images/png_images/background_chatbot.png",
//                     ),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: FixedVariables.heightScreenQuery(context) * 0.04,
//                   horizontal: FixedVariables.widthScreenQuery(context) * 0.06,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: FixedVariables.widthScreenQuery(context) * 0.3,
//                       height: FixedVariables.heightScreenQuery(context) * 0.2,
//                       child: Image.asset(
//                         ImageHelper.xRayTest1,
//                         color: Color(0xff0c9ca6),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           horizontal:
//                           FixedVariables.widthScreenQuery(context) * 0.12,
//                           vertical:
//                           FixedVariables.heightScreenQuery(context) *
//                               0.1),
//                       decoration: BoxDecoration(
//                           color: ColorHelper.mainShadow,
//                           shape: BoxShape.circle
//                         //borderRadius: BorderRadius.circular(FixedVariables.radius12),
//                       ),
//                     ),
//                     Spacer(),
//                     CustomButton(
//                       onPressed: (){
//
//                       },
//                       text: "Next",
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomButton(
//                           onPressed: () {
//                             context.read<TakeXRayImageCubit>().takeImage(
//                                 context: context, imageSource: ImageSource.gallery);
//                           },
//                           backgroundColor: Color(0xff0c9ca6),
//                           widthButton:
//                           FixedVariables.widthScreenQuery(context) * 0.42,
//                           borderRadius: BorderRadius.horizontal(
//                             left: Radius.circular(FixedVariables.radius8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.image,
//                                 size: 35,
//                                 color: ColorHelper.whiteColor,
//                               ),
//                               SizedBox(
//                                 width:
//                                 FixedVariables.widthScreenQuery(context) * 0.02,
//                               ),
//                               Text(
//                                 "Gallery",
//                                 style: TextStyleHelper.style14B
//                                     .copyWith(color: ColorHelper.whiteColor),
//                               ),
//                             ],
//                           ),
//                         ),
//                         CustomButton(
//                           onPressed: () {
//                             context.read<TakeXRayImageCubit>().takeImage(
//                                 context: context, imageSource: ImageSource.camera);
//                           },
//                           backgroundColor: Color(0xffb3b3b3),
//                           widthButton:
//                           FixedVariables.widthScreenQuery(context) * 0.42,
//                           borderRadius: BorderRadius.horizontal(
//                             right: Radius.circular(FixedVariables.radius8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.camera_alt,
//                                 size: 35,
//                                 color: ColorHelper.whiteColor,
//                               ),
//                               SizedBox(
//                                 width:
//                                 FixedVariables.widthScreenQuery(context) * 0.02,
//                               ),
//                               Text(
//                                 "Camera",
//                                 style: TextStyleHelper.style14B
//                                     .copyWith(color: ColorHelper.whiteColor),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         (isLoading)?Container(
//             height:FixedVariables.heightScreenQuery(context),
//             width: FixedVariables.widthScreenQuery(context),
//             color: ColorHelper.blackColor.withOpacity(0.4),
//             child: Center(child: CircularProgressIndicator())):SizedBox(),
//       ],
//     );
//   }
// }
