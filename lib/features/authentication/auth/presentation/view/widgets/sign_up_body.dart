import 'package:flutter/material.dart';
import 'package:health_care/core/core_exports.dart';
import 'package:health_care/features/authentication/auth/auth_exports.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {

  late TextEditingController nameEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmPasswordEditingController;

  @override
  void initState() {
    nameEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    confirmPasswordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        //CustomBackgroundGradient(),
        CustomBackgroundImage(),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            SignUpCubit dataSignUpCubit = context.read<SignUpCubit>();
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(FixedVariables.ScreenPadding32),
                  child: Form(
                    key: dataSignUpCubit.signUpFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: _heightScreen * 0.14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Create",
                              style: TextStyleHelper.style24B,
                            ),
                            Text(
                              " Account",
                              style: TextStyleHelper.style24B
                                  .copyWith(color: ColorHelper.mainColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScreen * 0.02,
                        ),
                        CustomTextFormField(
                          controller: nameEditingController,
                          hintText: "Full name",
                          marginVerticalSides: _heightScreen * 0.018,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          heightFilled: dataSignUpCubit.heightFilledName,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          validation: (value) {
                            return dataSignUpCubit.nameValidation(value);
                          },
                        ),
                        CustomTextFormField(
                          controller: phoneEditingController,
                          hintText: "Phone",
                          //marginVerticalSides: _heightScreen * 0.01,
                          keyboardType: TextInputType.phone,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          heightFilled: dataSignUpCubit.heightFilledPhone,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          validation: (value) {
                            return dataSignUpCubit.phoneValidation(value);
                          },
                        ),
                        CustomTextFormField(
                          controller: passwordEditingController,
                          hintText: "Password",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.visibility_rounded,size: 22,color: ColorHelper.grayText.withOpacity(0.8),),
                          ),
                          marginVerticalSides: _heightScreen * 0.018,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          heightFilled: dataSignUpCubit.heightFilledPassword,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          validation: (value) {
                            return dataSignUpCubit.passwordValidation(value);
                          },
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordEditingController,
                          hintText: "Confirm Password",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.visibility_rounded,size: 22,color: ColorHelper.grayText.withOpacity(0.8),),
                          ),
                          //marginVerticalSides: _heightScreen * 0.01,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          heightFilled: dataSignUpCubit.heightFilledConfirmPassword,
                          validation: (value) {
                            return dataSignUpCubit.confirmPasswordValidation(value,passwordEditingController.text);
                          },
                        ),
                       Spacer(),
                        CustomButton(
                          onPressed: () {
                            dataSignUpCubit.signUp(
                                context: context,
                                fullName: nameEditingController.text,
                                phone: phoneEditingController.text,
                                password: passwordEditingController.text,
                                confirmPassword: confirmPasswordEditingController.text,
                            );
                          },
                          text: "Sign Up",
                        ),
                        SizedBox(
                          height: _heightScreen * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "already have account ?  ",
                              style: TextStyleHelper.style10B,
                            ),
                            InkWell(
                              onTap: () {
                                RoutingHelper.navToLogin(context);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyleHelper.style10B.copyWith(
                                    color: ColorHelper.mainColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorHelper.mainColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: _heightScreen * 0.12,
                        ),
                      ],
                    ),
                  ),
                ),
                (state is LoadingSignUpState)
                    ? Container(
                  color: ColorHelper.blackColor.withOpacity(0.3),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : SizedBox(),
              ],
            );

          },
        ),
      ],
    );
  }
}
