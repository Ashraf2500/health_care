import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomEditProfileItem extends StatelessWidget {
  CustomEditProfileItem({
     super.key,
     required this.title,
     required this.editingController,
     required this.value,
     required this.canEdit,
     required this.editState,
     this.onSubmitted,
     this.suffixOnTap,
  });

  final String title;
  final String value;
  final bool canEdit;
  final EditState editState;
  final TextEditingController editingController;
  final Function(String text)? onSubmitted;
  final Function()? suffixOnTap;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;

    return Container(
      height: (canEdit) ? _heightScreen * 0.12 : _heightScreen * 0.1,
      padding: EdgeInsets.symmetric(horizontal: _widthScreen * 0.06, vertical: _heightScreen * 0.01),
      decoration: BoxDecoration(
        color: ColorHelper.whiteColor,
        border: Border.all(color: ColorHelper.gray300,width: 0.5),
        borderRadius: BorderRadius.circular(FixedVariables.radius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyleHelper.style12B.copyWith(color: ColorHelper.mainColor),
          ),
          SizedBox(
            height: _heightScreen * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (canEdit)
                  ? CustomTextFormField(
                      hintText: "$value",
                      controller: editingController,
                      textStyle: TextStyleHelper.style12R,
                      hintStyle: TextStyleHelper.style12R,
                      widthFilled: _widthScreen * 0.72,
                      heightFilled: _heightScreen * 0.04,
                      enableBorder: false,
                      borderColor: ColorHelper.grayText.withOpacity(0.5),
                      enableFilled: false,
                      autofocus: true,
                      onSubmitted: onSubmitted,
                      suffixIcon: GestureDetector(
                          onTap:suffixOnTap,
                          child: Icon(Icons.check),
                       ),
                  )
                  : Text(
                      "$value",
                      style: TextStyleHelper.style16M.copyWith(color: ColorHelper.grayText),
                  ),
              GestureDetector(
                onTap: () {
                  if (editState is EditNameChanged) {
                    context.read<EditGeneralInfoCubit>().editProfileName(canEditName: !canEdit);
                  }
                  if (editState is EditPhoneChanged) {
                    context.read<EditGeneralInfoCubit>().editProfilePhone(canEditPhone: !canEdit);
                  }
                  if (editState is EditSpecialtyChanged) {
                    context.read<EditSpecialtyCubit>().editProfileSpecialty(canEdit: !canEdit);
                  }
                  // todo ::=> read cubit here ::
                },
                child: Container(
                  child: (canEdit)
                      ? SizedBox()
                      : SvgPicture.asset(
                    ImageHelper.pin,
                    width: _widthScreen * 0.05,
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