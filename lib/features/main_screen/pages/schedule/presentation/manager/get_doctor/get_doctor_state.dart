part of 'get_doctor_cubit.dart';

@immutable
abstract class GetDoctorState {}

class GetDoctorInitial extends GetDoctorState {}

class LoadingGetDoctorState extends GetDoctorState {}
class SuccessGetDoctorState extends GetDoctorState {
  final GetDoctorData getDoctorData ;
  SuccessGetDoctorState({required this.getDoctorData});
}
class ErrorGetDoctorState extends GetDoctorState {
  final String messageError ;
  ErrorGetDoctorState({required this.messageError});
}
