part of 'chat_bot_cubit.dart';

@immutable
abstract class ChatBotState {}

class ChatBotInitial extends ChatBotState {
   final List<Message> messages;
   final ChatStateStatus status;

  ChatBotInitial(this.messages, this.status);
}
