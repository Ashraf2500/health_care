part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class ValidationLoginState extends LoginState {}
class LoadingLoginState extends LoginState {}
class SuccessLoginState extends LoginState {}
class ErrorLoginState extends LoginState {
  String messageError ;
  ErrorLoginState({required this.messageError});
}

