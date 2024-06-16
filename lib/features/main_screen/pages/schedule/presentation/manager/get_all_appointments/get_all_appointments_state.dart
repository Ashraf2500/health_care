part of 'get_all_appointments_cubit.dart';

@immutable
abstract class GetAllAppointmentsState {}

class GetAllAppointmentsInitial extends GetAllAppointmentsState {}

  class LoadingGetAllAppointmentsState extends GetAllAppointmentsState {}
class SuccessGetAllAppointmentsState extends GetAllAppointmentsState {
  final List<AllAppointmentsData> allAppointmentsData ;
  final List<AllAppointmentsData> allAppointmentsCompleted ;
  final List<AllAppointmentsData> allAppointmentsNotCompleted;
  final List<AllAppointmentsData> allAppointmentsNotCompletedToday;

  SuccessGetAllAppointmentsState({
    required this.allAppointmentsData,
    required this.allAppointmentsCompleted,
    required this.allAppointmentsNotCompleted,
    required this.allAppointmentsNotCompletedToday
  });
}
class ErrorGetAllAppointmentsState extends GetAllAppointmentsState {
  final String messageError ;
  ErrorGetAllAppointmentsState({required this.messageError});
}
