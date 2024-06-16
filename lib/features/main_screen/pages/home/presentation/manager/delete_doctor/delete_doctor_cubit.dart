import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:flutter/material.dart';
part 'delete_doctor_state.dart';

class DeleteDoctorCubit extends Cubit<DeleteDoctorState> {
  DeleteDoctorCubit() : super(DeleteDoctorInitial());

  Future<void> deleteDoctor({required BuildContext context,required String? doctorId})async{
    try{
      emit(LoadingDeleteDoctorState());

      await deleteDoctorRepo(doctorId: doctorId);

      emit(SuccessDeleteDoctorState());
      awesomeDialog(
          context: context ,
          message:  "Success Deleting" ,
          okOnPress:() {
            context.read<GetPopularDoctorsCubit>().getPopularDoctors(context: context);
          }
      );


    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorDeleteDoctorState(messageError: messageError));
      showSnackbar(context: context, message: messageError, backGroundColor: ColorHelper.redColor);
    }
  }

}
