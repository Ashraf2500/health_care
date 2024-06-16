part of 'get_patient_reports_cubit.dart';

@immutable
abstract class GetPatientReportsState {}

class GetPatientReportsInitial extends GetPatientReportsState {}

class LoadingGetPatientReportsState extends GetPatientReportsState {}
class SuccessGetPatientReportsState extends GetPatientReportsState {
  final List<PatientReportData>  patientReports ;
  SuccessGetPatientReportsState({required this.patientReports});
}
  class ErrorGetPatientReportsState extends GetPatientReportsState {
  final String messageError ;
  ErrorGetPatientReportsState({required this.messageError});
}

