import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'get_all_patients_state.dart';

class GetAllPatientsCubit extends Cubit<GetAllPatientsState> {
  GetAllPatientsCubit() : super(GetAllPatientsInitial());

  void getAllPatient({required BuildContext context})async{
    try{
      List<AllPatientData>  allPatients =[];

      emit(LoadingGetAllPatientsState());

      print("patient before repo  :${allPatients}");
      List<AllPatientData>  lostOfPatients = await getAllPatientRepo();
      print("patient after repo  :${lostOfPatients}");
      allPatients = lostOfPatients ;

      emit(SuccessGetAllPatientsState(allPatientData: lostOfPatients));


    }on DioException catch (exception) {
      print("$exception");
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetAllPatientsState(messageError: messageError));
    }
  }

}
