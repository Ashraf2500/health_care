part of 'create_doctor_cubit.dart';

@immutable
abstract class CreateDoctorState {}

class CreateDoctorInitial extends CreateDoctorState {}


class ValidationCreateDoctorState extends CreateDoctorState {}
class LoadingCreateDoctorState extends CreateDoctorState {}
class SuccessCreateDoctorState extends CreateDoctorState {
}
class ErrorCreateDoctorState extends CreateDoctorState {
  final String messageError ;
  ErrorCreateDoctorState({required this.messageError});
}