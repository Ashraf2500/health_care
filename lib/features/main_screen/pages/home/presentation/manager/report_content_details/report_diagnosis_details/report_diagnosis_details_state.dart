part of 'report_diagnosis_details_cubit.dart';

@immutable
abstract class ReportDiagnosisDetailsState {}


class ReportDiagnosisDetailsInitial extends ReportDiagnosisDetailsState {
  final ReportDiagnosisDetailsStatus status;
  String? diagnosisDetails = "";

  ReportDiagnosisDetailsInitial({
    required this.status,
    required this.diagnosisDetails,
  });
}
