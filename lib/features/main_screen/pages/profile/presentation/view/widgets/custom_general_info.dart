import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class CustomGeneralInfo extends StatelessWidget {
  CustomGeneralInfo({Key? key}) : super(key: key);

  UserType? _userType;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _userType = context.read<UserCubit>().userType;

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
                Navigator.pop(context);
                },
              child: Icon(Icons.arrow_back_ios_new,color: ColorHelper.whiteColor,),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)  * 0.08,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.21,
                width: FixedVariables.widthScreenQuery(context)*0.44,
                child: Stack(
                  children: [
                    Container(
                      height: FixedVariables.heightScreenQuery(context)*0.21,
                      width: FixedVariables.widthScreenQuery(context)*0.44,
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
                        image: DecorationImage(
                          image: AssetImage(ImageHelper.person12),
                          fit:BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
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
                  ],
                ),
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)  * 0.02,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal:  FixedVariables.widthScreenQuery(context)* 0.05,
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<EditNameCubit, EditNameState>(
                        builder: (context, state) {
                          bool canEdit = (state is EditNameChanged) ? state.canEdit : false ;
                          String value =  context.read<EditNameCubit>().getName ;
                          return CustomEditProfileItem(
                            title: "Name",
                            editingController: nameController,
                            editState: EditNameChanged(canEdit: false),
                            canEdit: canEdit,
                            value:value,
                            onSubmitted: (text) {
                              if (RegExp(r'[a-zA-Z0-9]').hasMatch(text)) {
                                context.read<EditNameCubit>().setName = text;
                                context.read<EditNameCubit>().editProfileName(canEdit: !canEdit);
                              }
                              else if(text.trim().isEmpty){
                                context.read<EditNameCubit>().editProfileName(canEdit: !canEdit);
                              }
                              else{
                                context.read<EditNameCubit>().editProfileName(canEdit: !canEdit);
                              }
                            },
                            suffixOnTap: () {
                              context.read<EditNameCubit>().editProfileName(canEdit: !canEdit);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height:  FixedVariables.heightScreenQuery(context) * 0.02,
                      ),

                      //------------------------------------------------------------------------

                      BlocBuilder<EditPhoneCubit, EditPhoneState>(
                        builder: (context, state) {
                          bool canEdit = (state is EditPhoneChanged) ? state.canEdit : false ;
                          String value =  context.read<EditPhoneCubit>().getPhone ;
                          return CustomEditProfileItem(
                            title: "Contact Number",
                            editingController: phoneController,
                            editState: EditPhoneChanged(canEdit: false),
                            canEdit: canEdit,
                            value:value,
                            onSubmitted: (text) {
                              if (RegExp(r'[a-zA-Z0-9]').hasMatch(text)) {
                                context.read<EditPhoneCubit>().setPhone = text;
                                context.read<EditPhoneCubit>().editProfilePhone(canEdit: !canEdit);
                              }
                              else if(text.trim().isEmpty){
                                context.read<EditPhoneCubit>().editProfilePhone(canEdit: !canEdit);
                              }
                              else{
                                context.read<EditPhoneCubit>().editProfilePhone(canEdit: !canEdit);
                              }
                            },
                            suffixOnTap: () {
                              context.read<EditPhoneCubit>().editProfilePhone(canEdit: !canEdit);
                            },
                          );
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


