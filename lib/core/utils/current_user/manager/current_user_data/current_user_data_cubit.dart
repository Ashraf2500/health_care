import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care/core/core_exports.dart';
import 'package:health_care/core/utils/current_user/data/models/current_Admin_model.dart';
import 'package:health_care/core/utils/current_user/data/models/current_doctor_model.dart';
import 'package:health_care/features/authentication/auth/auth_exports.dart';

part 'current_user_data_state.dart';

class CurrentUserDataCubit extends Cubit<CurrentUserDataState> {
  CurrentUserDataCubit() : super(CurrentUserDataInitial());

  Future<void>  currentUserData ({required BuildContext context})async{
    UserTypeData? _userTypeData = context.read<UserTypeCubit>().userType;
    try{
      emit(LoadingCurrentUserDataState());
      if(_userTypeData == UserTypeData.patient){
        CurrentPatientModel currentPatient = await currentPatientRepo();
        emit(SuccessCurrentUserDataState(dataCurrentPatient: currentPatient.data[0]));
      }
      else if(_userTypeData == UserTypeData.doctor){
        CurrentDoctorModel currentDoctor = await currentDoctorRepo();
        emit(SuccessCurrentUserDataState(dataCurrentDoctor: currentDoctor.data[0]));
      }
      else{
        CurrentAdminModel currentAdmin = await currentAdminsRepo();
        emit(SuccessCurrentUserDataState(dataCurrentAdmin: currentAdmin.data[0]));
      }

      print("------------------ Success --------------");
    }on DioException catch (exception) {

      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorCurrentUserDataState(messageError: messageError));
      print("------------------ Error --------------: $messageError");
    }


  }


}
