part of 'delete_doctor_cubit.dart';

@immutable
abstract class DeleteDoctorState {}

class DeleteDoctorInitial extends DeleteDoctorState {}


class LoadingDeleteDoctorState extends DeleteDoctorState {}
class SuccessDeleteDoctorState extends DeleteDoctorState {}
class ErrorDeleteDoctorState extends DeleteDoctorState {
  final String messageError ;
  ErrorDeleteDoctorState({required this.messageError});
}
