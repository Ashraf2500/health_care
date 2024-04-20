import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/message_model.dart';
part 'chat_bot_state.dart';

enum ChatStateStatus { initial, loading, success, failure }

class ChatBotCubit extends Cubit<ChatBotState> {
  late final GenerativeModel _model;
  late final GenerativeModel _visionModel;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
   bool canScroll = true;
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ChatBotCubit() : super(ChatBotInitial([], ChatStateStatus.initial)) {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: _secretApiKeyGemini,
    );
    _visionModel = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: _secretApiKeyGemini,
    );
    _chat = _model.startChat();

  }


  void sendImagePrompt() async {
      canScroll = false;
       contentMessages.add(Message(fromUser: true));
      emit(ChatBotInitial(contentMessages, ChatStateStatus.loading));
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        final response = await _visionModel.generateContent([
          Content.data('image/jpeg',image.readAsBytesSync()),
        ]);
        final text = response.text;
        final textResponse =await _chat.sendMessage(Content.text(text!));

        contentMessages.add( Message(image: Image.file(image), text: textResponse.text, fromUser: false));
        //scrollListToEnd();
        emit(ChatBotInitial(contentMessages, ChatStateStatus.success));
      }
    } catch (e) {
      emit(ChatBotInitial(contentMessages, ChatStateStatus.failure));
    }
  }

  void sendMessage(String message) async {
    canScroll = false;
    contentMessages.add(Message(text: message, fromUser: true));
    emit(ChatBotInitial(contentMessages, ChatStateStatus.loading));
    try {
      final response = await _chat.sendMessage(Content.text(message));
      final text = response.text;

      contentMessages.add( Message(text: text, fromUser: false));
      lastAnswerMessage = text;

      //scrollListToEnd();
      emit(ChatBotInitial(contentMessages, ChatStateStatus.success));
    } catch (e) {
      emit(ChatBotInitial(contentMessages, ChatStateStatus.failure));
    }
  }

  void scrollListToEnd (){
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds:10),
        curve: Curves.easeOut,
    );
  }
  void startScroll (){
    canScroll = true;
  }
}
