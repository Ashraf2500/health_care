part of 'delete_report_cubit.dart';

@immutable
abstract class DeleteReportState {}

class DeleteReportInitial extends DeleteReportState {}

class LoadingDeleteReportState extends DeleteReportState {}
class SuccessDeleteReportState extends DeleteReportState {}
class ErrorDeleteReportState extends DeleteReportState {
  final String messageError ;
  ErrorDeleteReportState({required this.messageError});
}
