part of 'delete_appointment_cubit.dart';

@immutable
abstract class DeleteAppointmentState {}

class DeleteAppointmentInitial extends DeleteAppointmentState {}

class LoadingDeleteAppointmentState extends DeleteAppointmentState {}
class SuccessDeleteAppointmentState extends DeleteAppointmentState {}
class ErrorDeleteAppointmentState extends DeleteAppointmentState {
  final String messageError ;
  ErrorDeleteAppointmentState({required this.messageError});
}
