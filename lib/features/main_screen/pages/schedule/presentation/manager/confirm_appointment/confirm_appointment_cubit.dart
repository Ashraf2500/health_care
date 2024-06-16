import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'confirm_appointment_state.dart';

class ConfirmAppointmentCubit extends Cubit<ConfirmAppointmentState> {
  ConfirmAppointmentCubit() : super(ConfirmAppointmentInitial());

  Future<void> confirmAppointment({required BuildContext context,required String? appointmentId})async{
    try{
      emit(LoadingConfirmAppointmentState());

      await confirmAppointmentRepo(appointmentId: appointmentId);
      awesomeDialog(
          context: context ,
          message:  "Detected successfully" ,
          okOnPress:() {
            context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context);
          }
      );

      emit(SuccessConfirmAppointmentState());


    }on DioException catch(exception){
      print("exception : $exception");
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorConfirmAppointmentState(messageError: messageError));
      showSnackbar(context: context, message: messageError, backGroundColor: ColorHelper.redColor);
      print("error get doctor : $messageError");
    }
  }
}
