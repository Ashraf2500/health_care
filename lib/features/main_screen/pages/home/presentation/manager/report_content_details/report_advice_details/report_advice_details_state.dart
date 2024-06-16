part of 'report_advice_details_cubit.dart';

@immutable
abstract class ReportAdviceDetailsState {}


class ReportAdviceDetailsInitial extends ReportAdviceDetailsState {
  final ReportAdviceDetailsStatus status;
  String? advicesDetails = "";

  ReportAdviceDetailsInitial({
    required this.status,
    required this.advicesDetails,
  });
}
