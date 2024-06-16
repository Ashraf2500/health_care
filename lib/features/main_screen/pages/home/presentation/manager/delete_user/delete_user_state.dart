part of 'delete_user_cubit.dart';

@immutable
abstract class DeleteUserState {}

class DeleteUserInitial extends DeleteUserState {}

class LoadingDeleteUserState extends DeleteUserState {}
class SuccessDeleteUserState extends DeleteUserState {}
class ErrorDeleteUserState extends DeleteUserState {
  final String messageError ;
  ErrorDeleteUserState({required this.messageError});
}
