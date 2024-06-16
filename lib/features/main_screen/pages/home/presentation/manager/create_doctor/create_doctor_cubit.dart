import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../features_exports.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  CreateDoctorCubit() : super(CreateDoctorInitial());


  double heightFilledName =FixedVariables.heightTextField;
  double heightFilledPhone =FixedVariables.heightTextField;
  double heightFilledPassword =FixedVariables.heightTextField;
  double heightFilledConfirmPassword =FixedVariables.heightTextField;
  double heightFilledSpeciality =FixedVariables.heightTextField;
  double heightFilledExpertment =FixedVariables.heightTextField;

  final GlobalKey<FormState> createDoctorFormKey = GlobalKey();


  String? nameValidation(value) {
    if (value!.isEmpty) {
      heightFilledName = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Full name is required !';
    }
    heightFilledName = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }
  String? phoneValidation(value) {
    if (value!.isEmpty) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Phone is required !';
    } else if (value.length != 11) {
      heightFilledPhone = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'The phone must be 11 numbers !';
    }
    heightFilledPhone = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }
  String? passwordValidation(value) {
    if (value!.isEmpty) {
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Password is required !';
    }
    else if(value!.length<6){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'The password must be at least 6 numbers !';
    }
    else if(value!.length>12){
      heightFilledPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'The password must be a maximum of 12 numbers !';
    }
    heightFilledPassword = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }
  String? confirmPasswordValidation(value , password) {
    if (value!.isEmpty) {
      heightFilledConfirmPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Confirm password is required !';
    }
    else if (value! != password) {
      heightFilledConfirmPassword = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Confirm password is not equal password !';
    }
    heightFilledConfirmPassword = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }
  String? specialityValidation(value) {
    if (value!.isEmpty) {
      heightFilledSpeciality = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Speciality is required !';
    }
    heightFilledSpeciality = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }
  String? expertmentValidation(value) {
    if (value!.isEmpty) {
      heightFilledExpertment = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Experience is required !';
    }
    else if (value! is double) {
      heightFilledExpertment = FixedVariables.heightTextFieldValidation;
      emit(ValidationCreateDoctorState());
      return 'Experience must be integer !';
    }
    heightFilledExpertment = FixedVariables.heightTextField;
    emit(ValidationCreateDoctorState());
    return null;
  }


  void createDoctor({required BuildContext context,required String fullName,required String phone, required String password , required String confirmPassword ,  required int speciality , required String expertment }) {
    if (createDoctorFormKey.currentState!.validate()) {
      createDoctorFormKey.currentState!.save();
      _create(context:context,fullName: fullName, phone: phone,  password: password , expertment: expertment , speciality: speciality);
    }

  }

  void _create({required BuildContext context, required String fullName ,required String phone, required String password ,   required int speciality , required String expertment }) async{
    try{
      emit(LoadingCreateDoctorState());
        await createDoctorRepo(fullName: fullName,phone: phone, password: password, speciality: speciality , expertment: expertment );
      emit(SuccessCreateDoctorState());
      showSnackbar(context:context,message:" Registration successful", backGroundColor: ColorHelper.greenColor.shade500);
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      messageErrorServer.badResponseMessage = "Ensure from your information and try again !";
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorCreateDoctorState(messageError: messageError));

    }
  }

}
