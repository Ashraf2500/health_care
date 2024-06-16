import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../features_exports.dart';

part 'get_doctor_appointments_state.dart';

class GetDoctorAppointmentsCubit extends Cubit<GetDoctorAppointmentsState> {
  GetDoctorAppointmentsCubit() : super(GetDoctorAppointmentsInitial());



  Future<void> getDoctorAppointments({required BuildContext context})async{

    try{
      List<DoctorAppointmentsData> doctorAppointmentsCompleted = [];
      List<DoctorAppointmentsData> doctorAppointmentsNotCompleted = [];
      List<DoctorAppointmentsData> doctorAppointmentsNotCompletedToday = [];
      emit(LoadingDoctorAppointmentsAppointmentsState());
      List<DoctorAppointmentsData> doctorAppointmentsData = await getDoctorAppointmentsRepo();
        _checkCompletedAppointments(
          doctorAppointmentsData: doctorAppointmentsData,
          doctorAppointmentsNotCompleted: doctorAppointmentsNotCompleted,
          doctorAppointmentsCompleted: doctorAppointmentsCompleted,
          doctorAppointmentsNotCompletedToday: doctorAppointmentsNotCompletedToday
        );
      emit(SuccessDoctorAppointmentsAppointmentsState(
        doctorAppointmentsData: doctorAppointmentsData,
        doctorAppointmentsCompleted: doctorAppointmentsCompleted,
        doctorAppointmentsNotCompleted: doctorAppointmentsNotCompleted,
        doctorAppointmentsNotCompletedToday: doctorAppointmentsNotCompletedToday,
      ));

    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorDoctorAppointmentsAppointmentsState(messageError: messageError));
      print("error get doctor appointments : $messageError");
    }
  }

  void _checkCompletedAppointments({
    required List<DoctorAppointmentsData> doctorAppointmentsData ,
    required List<DoctorAppointmentsData> doctorAppointmentsNotCompleted,
    required List<DoctorAppointmentsData> doctorAppointmentsCompleted,
    required List<DoctorAppointmentsData> doctorAppointmentsNotCompletedToday,
  }){
    for(int i=0 ; i<doctorAppointmentsData.length; i++){
      int? complete = doctorAppointmentsData[i].completed;
      String? appDate = doctorAppointmentsData[i].appDate;
      String year = "" ;
      String month = "" ;
      String day = "" ;
      int typeDate=1;
      DateTime timeNow = DateTime.now();

      String timeNowDay = (timeNow.day<10)?"0${timeNow.day}":"${timeNow.day}";
      String timeNowMonth = (timeNow.month<10)?"0${timeNow.month}":"${timeNow.month}";
      String timeNowYear = "${timeNow.year}";

      if(complete==0){
        doctorAppointmentsNotCompleted.add(doctorAppointmentsData[i]);
      }
      if(complete==1){
        doctorAppointmentsCompleted.add(doctorAppointmentsData[i]);
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


      if(timeNowDay ==day && timeNowMonth ==month && timeNowYear ==year){
        if(doctorAppointmentsData[i].completed==0){
          doctorAppointmentsNotCompletedToday.add(doctorAppointmentsData[i]);
        }
      }

    }
  }

}
