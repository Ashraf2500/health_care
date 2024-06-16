import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'get_all_appointments_state.dart';

class GetAllAppointmentsCubit extends Cubit<GetAllAppointmentsState> {
  GetAllAppointmentsCubit() : super(GetAllAppointmentsInitial());

  Future<void> geAllAppointments({required BuildContext context})async{

    try{
      List<AllAppointmentsData> allAppointmentsCompleted = [];
      List<AllAppointmentsData> allAppointmentsNotCompleted = [];
      List<AllAppointmentsData> allAppointmentsNotCompletedToday = [];
      emit(LoadingGetAllAppointmentsState());
      print(" get All appointments : loading");
      List<AllAppointmentsData> allAppointmentsData = await getAllAppointmentsRepo();
      _checkCompletedAppointments(
          allAppointmentsData: allAppointmentsData,
          allAppointmentsNotCompleted: allAppointmentsNotCompleted,
          allAppointmentsCompleted: allAppointmentsCompleted,
          allAppointmentsNotCompletedToday: allAppointmentsNotCompletedToday
      );
      emit(SuccessGetAllAppointmentsState(
        allAppointmentsData: allAppointmentsData,
        allAppointmentsCompleted: allAppointmentsCompleted,
        allAppointmentsNotCompleted: allAppointmentsNotCompleted,
        allAppointmentsNotCompletedToday: allAppointmentsNotCompletedToday,
      ));

    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorGetAllAppointmentsState(messageError: messageError));
    }
  }

  void _checkCompletedAppointments({
    required List<AllAppointmentsData> allAppointmentsData ,
    required List<AllAppointmentsData> allAppointmentsNotCompleted,
    required List<AllAppointmentsData> allAppointmentsCompleted,
    required List<AllAppointmentsData> allAppointmentsNotCompletedToday,
  }){
    for(int i=0 ; i<allAppointmentsData.length; i++){
      int? complete = allAppointmentsData[i].completed;
      String? appDate = allAppointmentsData[i].appDate;
      String year = "" ;
      String month = "" ;
      String day = "" ;
      int typeDate=1;
      DateTime timeNow = DateTime.now();

      String timeNowDay = (timeNow.day<10)?"0${timeNow.day}":"${timeNow.day}";
      String timeNowMonth = (timeNow.month<10)?"0${timeNow.month}":"${timeNow.month}";
      String timeNowYear = "${timeNow.year}";

      if(complete==0){
        allAppointmentsNotCompleted.add(allAppointmentsData[i]);
      }
      if(complete==1){
        allAppointmentsCompleted.add(allAppointmentsData[i]);
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
        if(allAppointmentsData[i].completed==0){
          allAppointmentsNotCompletedToday.add(allAppointmentsData[i]);
        }
      }

    }
  }

}
