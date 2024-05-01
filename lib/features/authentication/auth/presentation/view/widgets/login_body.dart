import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;

  @override
  void initState() {
    phoneEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CustomBackgroundImage(),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            LoginCubit dataLoginCubit = context.read<LoginCubit>();
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(FixedVariables.ScreenPadding32),
                  child: Form(
                    key: dataLoginCubit.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _heightScreen * 0.14,
                        ),
                        Row(
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyleHelper.style24B,
                            ),
                            Text(
                              " Back !",
                              style: TextStyleHelper.style24B
                                  .copyWith(color: ColorHelper.mainColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScreen * 0.01,
                        ),
                        Text(
                          "Sign in",
                          style: TextStyleHelper.style16B.copyWith(
                              color: ColorHelper.blackColor.withOpacity(0.7)),
                        ),
                        SizedBox(
                          height: _heightScreen * 0.04,
                        ),
                        CustomTextFormField(
                          controller: phoneEditingController,
                          hintText: "Phone",
                          keyboardType: TextInputType.phone,
                          marginVerticalSides: _heightScreen * 0.01,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          heightFilled:dataLoginCubit.heightFilledPhone,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          validation: (value) {
                            return dataLoginCubit.phoneValidation(value);
                          },
                        ),
                        CustomTextFormField(
                          controller: passwordEditingController,
                          hintText: "Password",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.visibility_rounded,size: 22,color: ColorHelper.grayText.withOpacity(0.8),),
                          ),
                          marginVerticalSides: _heightScreen * 0.01,
                          borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          heightFilled:dataLoginCubit.heightFilledPassword,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: ColorHelper.blackColor.withOpacity(0.6),
                          ),
                          validation: (value) {
                            return dataLoginCubit.passwordValidation(value);
                          },
                        ),
                        SizedBox(
                          height: _heightScreen * 0.01,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              RoutingHelper.navToTakePhone(context);
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyleHelper.style12B
                                  .copyWith(color: ColorHelper.mainColor),
                            ),
                          ),
                        ),

                        Spacer(),
                        CustomButton(
                          onPressed: () {
                            dataLoginCubit.login(
                                context: context,
                                phone: phoneEditingController.text,
                                password: passwordEditingController.text);
                          },
                          text: "Sign in",
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
                                RoutingHelper.navToSignUp(context);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyleHelper.style10B.copyWith(
                                    color: ColorHelper.mainColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorHelper.mainColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: _heightScreen * 0.19,
                        ),


                      ],
                    ),
                  ),
                ),
                (state is LoadingLoginState)
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
