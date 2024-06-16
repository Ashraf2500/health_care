part of 'get_doctor_schedule_cubit.dart';

@immutable
abstract class GetDoctorScheduleState {}

class GetDoctorScheduleInitial extends GetDoctorScheduleState {}

class LoadingGetDoctorScheduleState extends GetDoctorScheduleState {}
class SuccessGetDoctorScheduleState extends GetDoctorScheduleState {
  final DoctorScheduleData doctorSchedule;

  SuccessGetDoctorScheduleState({required this.doctorSchedule});
}
class ErrorGetDoctorScheduleState extends GetDoctorScheduleState {
  final String messageError ;
  ErrorGetDoctorScheduleState({required this.messageError});
}
