part of 'create_report_cubit.dart';

@immutable
abstract class CreateReportState {}

class CreateReportInitial extends CreateReportState {}

class LoadingCreateReportState extends CreateReportState {}
class SuccessCreateReportState extends CreateReportState {}
class ErrorCreateReportState extends CreateReportState {
  final String messageError ;
  ErrorCreateReportState({required this.messageError});
}
