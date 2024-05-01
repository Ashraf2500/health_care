part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}


class ValidationSignUpState extends SignUpState {}
class LoadingSignUpState extends SignUpState {}
class SuccessSignUpState extends SignUpState {
  SignUpModel? signUpData ;
  SuccessSignUpState({required this.signUpData});
}
class ErrorSignUpState extends SignUpState {
  String messageError ;
  ErrorSignUpState({required this.messageError});
}