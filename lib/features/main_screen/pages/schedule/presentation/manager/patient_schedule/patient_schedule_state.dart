part of 'patient_schedule_cubit.dart';

@immutable
abstract class PatientScheduleState {}

class PatientScheduleInitial extends PatientScheduleState {}

class LoadingGetPatientAppointmentsState extends PatientScheduleState {}
class SuccessGetPatientAppointmentsState extends PatientScheduleState {
  final List<PatientAppointmentData> patientAppointmentsData ;
  final List<PatientAppointmentData> patientAppointmentsCompleted ;
  final List<PatientAppointmentData> patientAppointmentsNotCompleted;
  final List<PatientAppointmentData> patientAppointmentsNotCompletedToday;

  SuccessGetPatientAppointmentsState({
    required this.patientAppointmentsData,
    required this.patientAppointmentsCompleted,
    required this.patientAppointmentsNotCompleted,
    required this.patientAppointmentsNotCompletedToday
  });
}
class ErrorGetPatientAppointmentsState extends PatientScheduleState {
  final String messageError ;
  ErrorGetPatientAppointmentsState({required this.messageError});
}
