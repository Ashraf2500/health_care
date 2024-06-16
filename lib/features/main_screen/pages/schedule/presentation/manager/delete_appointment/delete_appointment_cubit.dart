import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'delete_appointment_state.dart';

class DeleteAppointmentCubit extends Cubit<DeleteAppointmentState> {
  DeleteAppointmentCubit() : super(DeleteAppointmentInitial());

  Future<void> deleteAppointment({required BuildContext context,required String? appointmentId})async{
    try{
      emit(LoadingDeleteAppointmentState());

      await deleteAppointmentRepo(appointmentId: appointmentId);

      emit(SuccessDeleteAppointmentState());
      awesomeDialog(
          context: context ,
          message:  "Success Deleting" ,
          okOnPress:() {
            UserTypeData? _userType = context.read<UserTypeCubit>().userType;
            (_userType == UserTypeData.patient)?context.read<PatientScheduleCubit>().getUerAppointments(context: context)
                :(_userType == UserTypeData.doctor)?context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context)
                :context.read<GetAllAppointmentsCubit>().geAllAppointments(context: context);
          }
      );

    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorDeleteAppointmentState(messageError: messageError));
      showSnackbar(context: context, message: messageError, backGroundColor: ColorHelper.redColor);
      print("error get doctor : $messageError");
    }
  }


}
