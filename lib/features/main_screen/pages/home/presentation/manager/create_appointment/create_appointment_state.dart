part of 'create_appointment_cubit.dart';

@immutable
abstract class CreateAppointmentState {}

class CreateAppointmentInitial extends CreateAppointmentState {}

class ValidationCreateAppointmentState extends CreateAppointmentState {}
class LoadingCreateAppointmentState extends CreateAppointmentState {}
class SuccessCreateAppointmentState extends CreateAppointmentState {}
class ErrorCreateAppointmentState extends CreateAppointmentState {
  final String messageError ;
  ErrorCreateAppointmentState({required this.messageError});
}
