import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'get_patient_reports_state.dart';

class GetPatientReportsCubit extends Cubit<GetPatientReportsState> {
  GetPatientReportsCubit() : super(GetPatientReportsInitial());

  void getPatientReports({required BuildContext context})async{
    try{
      List<PatientReportData>  allPatientReports =[];

      emit(LoadingGetPatientReportsState());
      List<PatientReportData>  patientReports = await getPatientReportRepo();
      allPatientReports = patientReports ;

      emit(SuccessGetPatientReportsState(patientReports: patientReports));

    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetPatientReportsState(messageError: messageError));
    }
  }

}
