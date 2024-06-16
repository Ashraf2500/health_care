part of 'report_reason_details_cubit.dart';

@immutable
abstract class ReportReasonDetailsState {}

class ReportReasonDetailsInitial extends ReportReasonDetailsState {
  final ReportReasonDetailsStatus status;
  String? reasonDetails = "";

  ReportReasonDetailsInitial({
    required this.status,
    required this.reasonDetails,
  });
}
