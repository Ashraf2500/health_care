import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'delete_report_state.dart';

class DeleteReportCubit extends Cubit<DeleteReportState> {
  DeleteReportCubit() : super(DeleteReportInitial());

  Future<void> deleteReport({required BuildContext context,required String? reportId})async{
    try{
      emit(LoadingDeleteReportState());

      await deleteReportRepo(reportId: reportId);

      emit(SuccessDeleteReportState());
      awesomeDialog(
          context: context ,
          message:  "Success Deleting" ,
          okOnPress:() {
            UserTypeData? _userData = context.read<UserTypeCubit>().userType;
            if( _userData == UserTypeData.doctor ){
              context.read<GetDoctorReportsCubit>().getDoctorReports(context: context);
            }
            else
            {
              context.read<GetPatientReportsCubit>().getPatientReports(context: context);
            }

          }
      );


    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorDeleteReportState(messageError: messageError));
      showSnackbar(context: context, message: messageError, backGroundColor: ColorHelper.redColor);
    }
  }

}
