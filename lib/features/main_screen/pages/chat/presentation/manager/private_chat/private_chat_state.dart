part of 'private_profile_cubit.dart';

@immutable
abstract class PrivateChatState {}

class PrivateChatInitial extends PrivateChatState {}

class LoadingPrivateChatState extends PrivateChatState {}
class SuccessPrivateChatState extends PrivateChatState {
  final List<PrivateChatData>  listOfPrivateChatData ;

  SuccessPrivateChatState({required this.listOfPrivateChatData});
}
class ErrorPrivateChatState extends PrivateChatState {
  final String messageError ;

  ErrorPrivateChatState({required this.messageError});
}
