part of 'current_user_data_cubit.dart';

@immutable
abstract class CurrentUserDataState {}

class CurrentUserDataInitial extends CurrentUserDataState {}

class LoadingCurrentUserDataState extends CurrentUserDataState {}
class SuccessCurrentUserDataState extends CurrentUserDataState {
  DataCurrentPatient? dataCurrentPatient ;
  DataCurrentDoctor? dataCurrentDoctor ;
  DataCurrentAdmin? dataCurrentAdmin ;
  SuccessCurrentUserDataState({this.dataCurrentPatient,this.dataCurrentDoctor, this.dataCurrentAdmin});
}
class ErrorCurrentUserDataState extends CurrentUserDataState {
  String messageError ;
  ErrorCurrentUserDataState({required this.messageError});
}
