import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:health_care/features/main_screen/pages/profile/presentation/manager/edit_phone/edit_phone_cubit.dart';
import 'package:health_care/features/main_screen/pages/profile/presentation/manager/edit_photo/edit_photo_cubit.dart';
import 'package:image_picker/image_picker.dart';


class CustomGeneralInfo extends StatelessWidget {
  CustomGeneralInfo({Key? key,}) : super(key: key);


TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();

  UserTypeData? _userType;

  @override
  Widget build(BuildContext context) {

    _userType = context.read<UserTypeCubit>().userType;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: FixedVariables.heightScreenQuery(context)*0.2,
            width: FixedVariables.widthScreenQuery(context),
            color: ColorHelper.mainColor,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top:  FixedVariables.heightScreenQuery(context)  * 0.05,left:FixedVariables.widthScreenQuery(context)*0.04  ),
            child:InkWell(
              onTap: (){
                context.read<CurrentUserDataCubit>().currentUserData(context: context);
                Navigator.pop(context);
                },
              child: Icon(Icons.arrow_back_ios_new,color: ColorHelper.whiteColor,),
            ),
          ),
          BlocBuilder<EditGeneralInfoCubit, EditGeneralInfoState>(
            builder: (context,state) {
              bool canEditName = (state is EditNameChanged) ? state.canEditName : false ;
              bool canEditPhone = (state is EditPhoneChanged) ? state.canEditPhone : false ;
              bool canEditAvatar = (state is EditAvatarChanged) ? state.canEditAvatar : false ;
              String? nameValue =  context.read<EditGeneralInfoCubit>().getName ;
              String? phoneValue=  context.read<EditGeneralInfoCubit>().getPhone ;
              XFile? avatarValue =  context.read<EditGeneralInfoCubit>().getAvatar ;
              return Column(
                children: [
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)  * 0.08,
                  ),
                  BlocBuilder<EditPhotoCubit, EditPhotoState>(
                    builder: (context,photoState) {
                      XFile? image = context.read<EditPhotoCubit>().image;
                      return SizedBox(
                        height: FixedVariables.heightScreenQuery(context)*0.21,
                        width: FixedVariables.widthScreenQuery(context)*0.44,
                        child: Stack(
                          children: [
                            Container(
                              height: FixedVariables.heightScreenQuery(context)*0.21,
                              width: FixedVariables.widthScreenQuery(context)*0.44,
                              child:(image!=null)
                                  ?ClipOval(
                                    child: Image.file(
                                      File(image.path),
                                      fit: BoxFit.fill,
                                      ),
                                  )
                                  :SizedBox(),
                              decoration: BoxDecoration(
                                color: ColorHelper.whiteColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorHelper.backWhiteColor,width: 1.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, -1),
                                  ),
                                ],
                                image:(image==null)
                                    ? DecorationImage(
                                        image: AssetImage(ImageHelper.person12),
                                        fit:BoxFit.fill,
                                    ):null,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: (){
                                  _choose_method_of_take_photo(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin:EdgeInsets.only(
                                      bottom: FixedVariables.heightScreenQuery(context)*0.015,
                                      right: FixedVariables.widthScreenQuery(context)*0.015,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorHelper.grayText.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.camera_alt,size: 24, color: ColorHelper.whiteColor,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)  * 0.02,
                  ),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal:  FixedVariables.widthScreenQuery(context)* 0.05,
                      ),
                      child: Column(
                        children: [
                          CustomEditProfileItem(
                            title: "Name",
                            editingController: nameController,
                            editState: EditNameChanged(canEditName: false),
                            canEdit: canEditName,
                            value:nameValue??context.read<CurrentUserDataCubit>().currentName??"Unknown",
                            onSubmitted: (text) {
                              if (RegExp(r'[a-zA-Z0-9]').hasMatch(text)) {
                                context.read<EditGeneralInfoCubit>().setName= text;
                                context.read<EditGeneralInfoCubit>().editProfileName(canEditName: !canEditName);
                              }
                              else if(text.trim().isEmpty){
                                context.read<EditGeneralInfoCubit>().editProfileName(canEditName: !canEditName);
                              }
                              else{
                                context.read<EditGeneralInfoCubit>().editProfileName(canEditName: !canEditName);
                              }
                            },
                            suffixOnTap: () {
                              context.read<EditGeneralInfoCubit>().editProfileName(canEditName: !canEditName);
                            },
                          ),
                          SizedBox(
                            height:  FixedVariables.heightScreenQuery(context) * 0.02,
                          ),

                          //------------------------------------------------------------------------

                          CustomEditProfileItem(
                            title: "Contact Number",
                            editingController: phoneController,
                            editState: EditPhoneChanged(canEditPhone: false),
                            canEdit: canEditPhone,
                            value:phoneValue??context.read<CurrentUserDataCubit>().currentPhone??"Unknown",
                            onSubmitted: (text) {
                              if (RegExp(r'[a-zA-Z0-9]').hasMatch(text)) {
                                context.read<EditGeneralInfoCubit>().setPhone = text;
                                context.read<EditGeneralInfoCubit>().editProfilePhone(canEditPhone: !canEditPhone);
                              }
                              else if(text.trim().isEmpty){
                                context.read<EditGeneralInfoCubit>().editProfilePhone(canEditPhone: !canEditPhone);
                              }
                              else{
                                context.read<EditGeneralInfoCubit>().editProfilePhone(canEditPhone: !canEditPhone);
                              }
                            },
                            suffixOnTap: () {
                              context.read<EditGeneralInfoCubit>().editProfilePhone(canEditPhone: !canEditPhone);
                            },
                          ),
                          SizedBox(
                            height:  FixedVariables.heightScreenQuery(context) * 0.02,
                          ),

                          //------------------------------------------------------------------------
                          // todo
                          // BlocBuilder<EditSpecialtyCubit, EditSpecialtyState>(
                          //   builder: (context, state) {
                          //     bool canEdit = (state is EditSpecialtyChanged) ? state.canEdit : false ;
                          //     String value =  context.read<EditSpecialtyCubit>().getSpecialty ;
                          //     return CustomEditProfileItem(
                          //       title: "Specialty",
                          //       editingController: specialtyController,
                          //       editState: EditSpecialtyChanged(canEdit: false),
                          //       canEdit: canEdit,
                          //       value:value,
                          //       onSubmitted: (text) {
                          //         if (RegExp(r'[a-zA-Z0-9]').hasMatch(text)) {
                          //           context.read<EditSpecialtyCubit>().setSpecialty = text;
                          //           context.read<EditSpecialtyCubit>().editProfileSpecialty(canEdit: !canEdit);
                          //         }
                          //         else if(text.trim().isEmpty){
                          //           //context.read<EditSpecialtyCubit>().setSpecialty = context.read<EditSpecialtyCubit>().getSpecialty;
                          //           context.read<EditSpecialtyCubit>().editProfileSpecialty(canEdit: !canEdit);
                          //         }
                          //         else{
                          //           //context.read<EditSpecialtyCubit>().setSpecialty = context.read<EditSpecialtyCubit>().getSpecialty;
                          //           context.read<EditSpecialtyCubit>().editProfileSpecialty(canEdit: !canEdit);
                          //         }
                          //       },
                          //       suffixOnTap: () {
                          //        //context.read<EditSpecialtyCubit>().setSpecialty = specialtyController.text;
                          //         context.read<EditSpecialtyCubit>().editProfileSpecialty(canEdit: !canEdit);
                          //       },
                          //     );
                          //   },
                          // ),
                          // SizedBox(
                          //   height:  FixedVariables.heightScreenQuery(context) * 0.02,
                          // ),

                          //------------------------------------------------------------------------

                          Container(
                            height: FixedVariables.heightScreenQuery(context)*0.09,
                            padding:  EdgeInsets.symmetric(
                              horizontal: FixedVariables.widthScreenQuery(context)*0.06,
                              vertical: FixedVariables.heightScreenQuery(context)*0.01,
                            ),
                            decoration: BoxDecoration(
                              color: ColorHelper.whiteColor,
                              border: Border.all(color: ColorHelper.gray300,width: 0.5),
                              borderRadius: BorderRadius.circular(FixedVariables.radius12),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Set Password",
                                  style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
                                ),
                                SetPasswordBottomSheet(),

                              ],
                            ),
                          ),
                          Spacer(),
                          CustomButton(
                            onPressed: (){
                              context.read<EditGeneralInfoCubit>().saveNewInfo(context: context,newName: nameValue, newPhone:phoneValue,newAvatar: avatarValue);
                            },
                            text: "Save",
                          ),
                          SizedBox(
                            height: FixedVariables.heightScreenQuery(context)*0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ],
      ),
    );
  }

  void _choose_method_of_take_photo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //transitionAnimationController: controller,
      showDragHandle: true,
      backgroundColor: ColorHelper.backWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(FixedVariables.radius24),
        ),
      ),

      builder: (context) {
        return custom_method_take_photo();
      },
    );
  }
}




