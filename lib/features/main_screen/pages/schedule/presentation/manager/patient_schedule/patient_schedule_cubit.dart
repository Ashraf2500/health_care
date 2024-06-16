import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:health_care/features/features_exports.dart';
part 'patient_schedule_state.dart';

class PatientScheduleCubit extends Cubit<PatientScheduleState> {
  PatientScheduleCubit() : super(PatientScheduleInitial());



  Future<void> getUerAppointments({required BuildContext context}) async{
    try{
      List<PatientAppointmentData> patientAppointmentsCompleted = [];
      List<PatientAppointmentData> patientAppointmentsNotCompleted = [];
      List<PatientAppointmentData> patientAppointmentsNotCompletedToday = [];
      emit(LoadingGetPatientAppointmentsState());
      //List<PatientAppointmentAllInfoModel> PatientAppointmentInfo = [];
      List<PatientAppointmentData> patientAppointmentsData = await getPatientAppointments();
      _checkCompletedAppointments(
          patientAppointmentsData: patientAppointmentsData,
          patientAppointmentsNotCompleted: patientAppointmentsNotCompleted,
          patientAppointmentsCompleted: patientAppointmentsCompleted,
          patientAppointmentsNotCompletedToday: patientAppointmentsNotCompletedToday
      );
      //await _getDoctorsOfAppointments(appointments: getPatientAppointmentsData,PatientAppointmentInfo: PatientAppointmentInfo);
      emit(SuccessGetPatientAppointmentsState(
          patientAppointmentsData: patientAppointmentsData,
          patientAppointmentsNotCompleted: patientAppointmentsNotCompleted,
          patientAppointmentsCompleted: patientAppointmentsCompleted,
          patientAppointmentsNotCompletedToday: patientAppointmentsNotCompletedToday

      ));
    }on DioException catch (exception) {
      UserTypeData? _userType = context.read<UserTypeCubit>().userType;
    ApiServices messageErrorServer = ApiServices();
    messageErrorServer.badResponseMessage = "The phone or password is incorrect";
    String messageError = messageErrorServer.handelDioException(exception: exception);
    emit(ErrorGetPatientAppointmentsState(messageError: messageError));
    (_userType==UserTypeData.patient)?showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500):null;
    }
  }

  void _checkCompletedAppointments({
    required List<PatientAppointmentData> patientAppointmentsData ,
    required List<PatientAppointmentData> patientAppointmentsNotCompleted,
    required List<PatientAppointmentData> patientAppointmentsCompleted,
    required List<PatientAppointmentData> patientAppointmentsNotCompletedToday,
  }){
    for(int i=0 ; i<patientAppointmentsData.length; i++){
      int? complete = patientAppointmentsData[i].completed;
      String? appDate = patientAppointmentsData[i].appDate;
      String year = "" ;
      String month = "" ;
      String day = "" ;
      int typeDate=1;
      DateTime timeNow = DateTime.now();

      if(complete==0){
        patientAppointmentsNotCompleted.add(patientAppointmentsData[i]);
      }
      if(complete==1){
        patientAppointmentsCompleted.add(patientAppointmentsData[i]);
      }

      if(appDate != null){
        for(int t=0 ;t<appDate.length ; t++){
          if(appDate[t]!="-"){
            if(typeDate==1){
              year+=appDate[t];
            }
            if(typeDate==2){
              month+=appDate[t];
            }
            if(typeDate==3){
              day+=appDate[t];
            }
          }
          else{
            typeDate+=1;
          }
        }
      }

      if(timeNow.day.toString() ==day){
        if(timeNow.month.toString() ==month){
          if(timeNow.year.toString() ==year){
            patientAppointmentsNotCompletedToday.add(patientAppointmentsData[i]);
          }
        }
      }

    }
  }


  // Future<void> _getDoctorsOfAppointments ({required List<PatientAppointmentData> appointments,required List<PatientAppointmentAllInfoModel> PatientAppointmentInfo})async{
  //   //todo ==> here we make one doctor for all appointments
  //    //GetDoctorModel  doctorData= await getDoctorRepo(DoctorId: appointments[0].doctorId!);
  //   for(int i =0 ; i<appointments.length; i++) {
  //     GetDoctorModel  doctorData= await getDoctorRepo(DoctorId: appointments[i].doctorId!);
  //     PatientAppointmentInfo.add(PatientAppointmentAllInfoModel(patientAppointmentData: appointments[i], doctorData: doctorData.data[0]));
  //   }
  //   /* todo get doctor appointment */ //    todo 6/4/2024
  //
  // }
}


