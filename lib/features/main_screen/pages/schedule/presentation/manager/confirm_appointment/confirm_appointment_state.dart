part of 'confirm_appointment_cubit.dart';

@immutable
abstract class ConfirmAppointmentState {}

class ConfirmAppointmentInitial extends ConfirmAppointmentState {}

class LoadingConfirmAppointmentState extends ConfirmAppointmentState {}
class SuccessConfirmAppointmentState extends ConfirmAppointmentState {}
class ErrorConfirmAppointmentState extends ConfirmAppointmentState {
  final String messageError ;
  ErrorConfirmAppointmentState({required this.messageError});
}

