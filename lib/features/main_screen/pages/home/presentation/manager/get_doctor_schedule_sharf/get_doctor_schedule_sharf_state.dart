part of 'get_doctor_schedule_sharf_cubit.dart';

@immutable
abstract class GetDoctorScheduleSharfState {}

class GetDoctorScheduleSharfInitial extends GetDoctorScheduleSharfState {}

class LoadingGetDoctorScheduleSharfState extends GetDoctorScheduleSharfState {}
class SuccessGetDoctorScheduleSharfState extends GetDoctorScheduleSharfState {

  List <GetScheduleSharfModel> listOfDoctorSchedule;

  SuccessGetDoctorScheduleSharfState({required this.listOfDoctorSchedule});
}
class ErrorGetDoctorScheduleSharfState extends GetDoctorScheduleSharfState {
  final String messageError ;
  ErrorGetDoctorScheduleSharfState({required this.messageError});
}

class SuccessAddedGetDoctorScheduleSharfState extends GetDoctorScheduleSharfState {

  List <GetScheduleSharfModel> listOfDoctorSchedule;

  SuccessAddedGetDoctorScheduleSharfState({required this.listOfDoctorSchedule});
}