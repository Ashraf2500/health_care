part of 'profile_chat_cubit.dart';

@immutable
abstract class ProfileChatState {}

class ProfileChatInitial extends ProfileChatState {}

class LoadingProfileChatState extends ProfileChatState {}
class SuccessProfileChatState extends ProfileChatState {
  final List<AllProfileChatData>  listOfProfileChatData ;

  SuccessProfileChatState({required this.listOfProfileChatData});
}
class ErrorProfileChatState extends ProfileChatState {
  final String messageError ;

  ErrorProfileChatState({required this.messageError});
}
