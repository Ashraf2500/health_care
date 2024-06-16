import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care/core/core_exports.dart';
import 'package:health_care/features/authentication/auth/auth_exports.dart';

import '../../../../../../features_exports.dart';

part 'current_user_data_state.dart';

class CurrentUserDataCubit extends Cubit<CurrentUserDataState> {
  CurrentUserDataCubit() : super(CurrentUserDataInitial());

  String? currentUserId;
  String? currentName;
  String? currentPhone;
  String? currentPassword;
  String? currentAvatar;

  Future<void>  currentUserData ({required BuildContext context})async{
    UserTypeData? _userTypeData = context.read<UserTypeCubit>().userType;
    try{
      emit(LoadingCurrentUserDataState());
      if(_userTypeData == UserTypeData.patient){
        CurrentPatientModel currentPatient = await currentPatientRepo();
        currentUserId = currentPatient.data[0].id;
        currentName = currentPatient.data[0].name;
        currentPhone = currentPatient.data[0].phone;
        currentPassword = currentPatient.data[0].pass;
        currentAvatar = currentPatient.data[0].avatar;

        emit(SuccessCurrentUserDataState(dataCurrentPatient: currentPatient.data[0]));
      }
      else if(_userTypeData == UserTypeData.doctor){
        CurrentDoctorModel currentDoctor = await currentDoctorRepo();
        currentUserId = currentDoctor.data[0].id;
        currentName = currentDoctor.data[0].name;
        currentPhone = currentDoctor.data[0].phone;
        currentPassword = currentDoctor.data[0].pass;
        currentAvatar = currentDoctor.data[0].avatar;

        emit(SuccessCurrentUserDataState(dataCurrentDoctor: currentDoctor.data[0]));
      }
      else{
        CurrentAdminModel currentAdmin = await currentAdminsRepo();
        currentUserId = currentAdmin.data[0].id;
        currentName = currentAdmin.data[0].name;
        currentPhone = currentAdmin.data[0].phone;
        currentPassword = currentAdmin.data[0].pass;
        currentAvatar = currentAdmin.data[0].avatar;
        emit(SuccessCurrentUserDataState(dataCurrentAdmin: currentAdmin.data[0]));
      }
      Future.delayed(const Duration(seconds: 1), () async{
        RoutingHelper.navToMainScreen(context);
         //await context.read<PatientScheduleCubit>().getUerAppointments(context: context );
      });
      // (_userTypeData==UserTypeData.patient)?await context.read<PatientScheduleCubit>().getUerAppointments(context: context,userId:currentUserId ):
      // (_userTypeData==UserTypeData.doctor)?await context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context):SizedBox();
      print("------------------ Success --------------");

    }on DioException catch (exception) {

      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorCurrentUserDataState(messageError: messageError));
      print("------------------ Error --------------: $messageError");
    }


  }


}
