import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'create_report_state.dart';

class CreateReportCubit extends Cubit<CreateReportState> {
  CreateReportCubit() : super(CreateReportInitial());

  TextEditingController diagnosisTextEditingController =TextEditingController();
  TextEditingController adviceTextEditingController =TextEditingController();



  void createReport({
    required BuildContext context,
    required String? userId,
    required String? appointmentId,
   // required String? diagnosis,
    //required String? reasons,
    //required String? advices,
    required String? medicines,
})async{
    try{
      emit(LoadingCreateReportState());
      await createReportRepo(userId: userId, appointmentId: appointmentId, diagnosis: diagnosisTextEditingController.text , advices: adviceTextEditingController.text, medicines: medicines);
      emit(SuccessCreateReportState());
      awesomeDialog(
          context: context ,
          message:  "Success Creating Report" ,
          okOnPress:() {
            context.read<CreateMedicineCubit>().lisOfMedicine.clear();
            Navigator.pop(context);
          }
      );

    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorCreateReportState(messageError: messageError));

    }


  }
}
