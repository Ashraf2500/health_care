import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'get_doctor_schedule_state.dart';

class GetDoctorScheduleCubit extends Cubit<GetDoctorScheduleState> {
  GetDoctorScheduleCubit() : super(GetDoctorScheduleInitial());

  Future<void> getDoctorSchedule({required BuildContext context , required String doctorId})async{
    try{
      emit(LoadingGetDoctorScheduleState());
      DoctorScheduleData  doctorSchedule = await getDoctorScheduleRepo(doctorId: doctorId);
      emit(SuccessGetDoctorScheduleState(doctorSchedule: doctorSchedule));
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetDoctorScheduleState(messageError: messageError));
    }
  }

}
