import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:health_care/features/features_exports.dart';
part 'get_doctor_schedule_sharf_state.dart';

class GetScheduleSharfModel {
  String? day;
  String? time;
  GetScheduleSharfModel({required this.day,required this.time});
}

class GetDoctorScheduleSharfCubit extends Cubit<GetDoctorScheduleSharfState> {
  GetDoctorScheduleSharfCubit() : super(GetDoctorScheduleSharfInitial());
  Future<void> getDoctorSchedule(
      {required BuildContext context, required String doctorId}) async {
    try {
      List <GetScheduleSharfModel> listOfDoctorScheduleSharf = [];
      emit(LoadingGetDoctorScheduleSharfState());
      DoctorScheduleData doctorSchedule = await getDoctorScheduleRepo(doctorId: doctorId);
      print("data---------------> ${doctorSchedule.tuesday}");

       if (doctorSchedule.saturday != null){
        listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"saturday", time: doctorSchedule.saturday));
      }
       if (doctorSchedule.sunday != null){
         listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"sunday", time: doctorSchedule.sunday));

       }
       if (doctorSchedule.monday != null){
         listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"monday", time: doctorSchedule.monday));

       }
       if (doctorSchedule.tuesday != null){
         listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"tuesday", time: doctorSchedule.tuesday));

       }
       if (doctorSchedule.wednesday != null){
         listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"wednesday", time: doctorSchedule.wednesday));

       }
       if (doctorSchedule.thursday != null){
         listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"thursday", time: doctorSchedule.thursday));

       }
       if (doctorSchedule.friday != null){
        listOfDoctorScheduleSharf.add (GetScheduleSharfModel(day:"friday", time: doctorSchedule.friday));
      }

      emit(SuccessGetDoctorScheduleSharfState(listOfDoctorSchedule: listOfDoctorScheduleSharf));
    } on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError =
          messageErrorServer.handelDioException(exception: exception);
      showSnackbar(
          context: context,
          message: messageError,
          backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetDoctorScheduleSharfState(messageError: messageError));
    }
  }
  void deleteDay ({required List <GetScheduleSharfModel> listOfDoctorSchedule ,required GetScheduleSharfModel getScheduleSharfModel }){
    listOfDoctorSchedule.remove(getScheduleSharfModel);
    emit(SuccessGetDoctorScheduleSharfState(listOfDoctorSchedule: listOfDoctorSchedule));
  }

  void addDay ({required List <GetScheduleSharfModel> listOfDoctorSchedule ,required GetScheduleSharfModel getScheduleSharfModel }){
    listOfDoctorSchedule.add(getScheduleSharfModel);
    print(listOfDoctorSchedule.length);
    print(listOfDoctorSchedule);
    emit(SuccessGetDoctorScheduleSharfState(listOfDoctorSchedule: listOfDoctorSchedule));
  }
}
