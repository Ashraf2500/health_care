part of 'get_doctor_reports_cubit.dart';

@immutable
abstract class GetDoctorReportsState {}

class GetDoctorReportsInitial extends GetDoctorReportsState {}

class LoadingGetDoctorReportsState extends GetDoctorReportsState {}
class SuccessGetDoctorReportsState extends GetDoctorReportsState {
  final List<DoctorReportData>  doctorsReports ;
  SuccessGetDoctorReportsState({required this.doctorsReports});
}
class ErrorGetDoctorReportsState extends GetDoctorReportsState {
  final String messageError ;
  ErrorGetDoctorReportsState({required this.messageError});
}
