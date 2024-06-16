import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'get_doctor_reports_state.dart';

class GetDoctorReportsCubit extends Cubit<GetDoctorReportsState> {
  GetDoctorReportsCubit() : super(GetDoctorReportsInitial());

  void getDoctorReports({required BuildContext context})async{
    try{
      List<DoctorReportData>  allDoctorReports =[];

      emit(LoadingGetDoctorReportsState());
      List<DoctorReportData>  doctorsReports = await getDoctorReportRepo();
      allDoctorReports = doctorsReports ;

      emit(SuccessGetDoctorReportsState(doctorsReports: doctorsReports));

    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetDoctorReportsState(messageError: messageError));
    }
  }
}
