import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:meta/meta.dart';

part 'get_doctor_state.dart';

class GetDoctorCubit extends Cubit<GetDoctorState> {
  GetDoctorCubit() : super(GetDoctorInitial());


  Future<void> getDoctor({required BuildContext context , required String DoctorId})async{
    try{
      emit(LoadingGetDoctorState());
      print(" get doctor : loading");
      GetDoctorModel doctorData = await getDoctorRepo(DoctorId: DoctorId);

      emit(SuccessGetDoctorState(getDoctorData: doctorData.data[0]));

      print("Success get doctor : ${doctorData.data[0].name}");

    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorGetDoctorState(messageError: messageError));
      print("error get doctor : $messageError");
    }
  }
}
