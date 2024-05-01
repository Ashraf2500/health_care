import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../features_exports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  double heightFilledPhone =FixedVariables.heightTextField;
  double heightFilledPassword =FixedVariables.heightTextField;

  final GlobalKey<FormState> loginFormKey = GlobalKey();


  String? phoneValidation(value) {
    if (value!.isEmpty) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationLoginState());
      return 'Phone is required !';
    } else if (value.length != 11) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationLoginState());
      return 'The phone must be 11 numbers !';
    }
    heightFilledPhone = FixedVariables.heightTextField;
    emit(ValidationLoginState());
    return null;
  }
  String? passwordValidation(value) {
    if (value!.isEmpty) {
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationLoginState());
      return 'Password is required !';
    }
    else if(value!.length<6){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationLoginState());
      return 'The password must be at least 6 numbers !';
    }
    else if(value!.length>12){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationLoginState());
      return 'The password must be a maximum of 12 numbers !';
    }
    heightFilledPassword = FixedVariables.heightTextField;
    emit(ValidationLoginState());
    return null;
  }


  void login({required BuildContext context, required String phone, required String password}) {
    RoutingHelper.navToMainScreen(context); // todo delete this line
      //todo remove this comment
      // if (loginFormKey.currentState!.validate()) {
      //   loginFormKey.currentState!.save();
      //   _signIn(context:context, phone: phone,  password: password);
      // }

  }

  void _signIn({required BuildContext context, required String phone, required String password}) async{
    try{
      emit(LoadingLoginState());
      LoginModel loginData = await loginRepo(phone: phone, password: password);
      emit(SuccessLoginState(loginData: loginData.data));
      showSnackbar(context:context,message:"login Successful", backGroundColor: ColorHelper.greenColor.shade500);
      Future.delayed(const Duration(seconds: 4), () {
        RoutingHelper.navToMainScreen(context);
      });

    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      messageErrorServer.badResponseMessage = "The phone or password is incorrect";
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorLoginState(messageError: messageError));
    }
  }





}



