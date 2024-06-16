part of 'get_doctor_appointments_cubit.dart';

@immutable
abstract class GetDoctorAppointmentsState {}

class GetDoctorAppointmentsInitial extends GetDoctorAppointmentsState {}

class LoadingDoctorAppointmentsAppointmentsState extends GetDoctorAppointmentsState {}
class SuccessDoctorAppointmentsAppointmentsState extends GetDoctorAppointmentsState {
  final List<DoctorAppointmentsData> doctorAppointmentsData ;
  final List<DoctorAppointmentsData> doctorAppointmentsCompleted ;
  final List<DoctorAppointmentsData> doctorAppointmentsNotCompleted;
  final List<DoctorAppointmentsData> doctorAppointmentsNotCompletedToday;

  SuccessDoctorAppointmentsAppointmentsState({
   required this.doctorAppointmentsData,
   required this.doctorAppointmentsCompleted,
   required this.doctorAppointmentsNotCompleted,
   required this.doctorAppointmentsNotCompletedToday
  });
}
class ErrorDoctorAppointmentsAppointmentsState extends GetDoctorAppointmentsState {
  final String messageError ;
  ErrorDoctorAppointmentsAppointmentsState({required this.messageError});
}
