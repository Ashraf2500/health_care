import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../features_exports.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  double heightFilledName =FixedVariables.heightTextField;
  double heightFilledPhone =FixedVariables.heightTextField;
  double heightFilledPassword =FixedVariables.heightTextField;
  double heightFilledConfirmPassword =FixedVariables.heightTextField;

  final GlobalKey<FormState> signUpFormKey = GlobalKey();


  String? nameValidation(value) {
    if (value!.isEmpty) {
      heightFilledName = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'Full name is required !';
    }
    heightFilledName = FixedVariables.heightTextField;
    emit(ValidationSignUpState());
    return null;
  }
  String? phoneValidation(value) {
    if (value!.isEmpty) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'Phone is required !';
    } else if (value.length != 11) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'The phone must be 11 numbers !';
    }
    heightFilledPhone = FixedVariables.heightTextField;
    emit(ValidationSignUpState());
    return null;
  }
  String? passwordValidation(value) {
    if (value!.isEmpty) {
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'Password is required !';
    }
    else if(value!.length<6){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'The password must be at least 6 numbers !';
    }
    else if(value!.length>12){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'The password must be a maximum of 12 numbers !';
    }
    heightFilledPassword = FixedVariables.heightTextField;
    emit(ValidationSignUpState());
    return null;
  }
  String? confirmPasswordValidation(value , password) {
    if (value!.isEmpty) {
      heightFilledConfirmPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'Confirm password is required !';
    }
    else if (value! != password) {
      heightFilledConfirmPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationSignUpState());
      return 'Confirm password is not equal password !';
    }
    heightFilledConfirmPassword = FixedVariables.heightTextField;
    emit(ValidationSignUpState());
    return null;
  }



  void signUp({required BuildContext context,required String fullName,required String phone, required String password , required String confirmPassword}) {
    if (signUpFormKey.currentState!.validate()) {
      signUpFormKey.currentState!.save();
      _register(context:context,fullName: fullName, phone: phone,  password: password);
    }

  }

  void _register({required BuildContext context, required String fullName ,required String phone, required String password }) async{
    try{
      emit(LoadingSignUpState());
      SignUpModel signUpData = await signUpRepo(fullName: fullName,phone: phone, password: password );
      emit(SuccessSignUpState(signUpData: signUpData));
      showSnackbar(context:context,message:" Registration successful", backGroundColor: ColorHelper.greenColor.shade500);
      Future.delayed(const Duration(seconds: 3), () {
        RoutingHelper.navToLogin(context);
      });
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      messageErrorServer.badResponseMessage = "The phone is already exist";
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorSignUpState(messageError: messageError));

    }
  }

}
