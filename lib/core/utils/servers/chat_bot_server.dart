import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
//import 'package:health_care/features/features_exports.dart';

class ChatBotServers {

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  final Dio _dioChatBot = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
    ),
  );

  // Future<void> sendMessage(String text) async {
  //
  //   //--------- Body -------------------------------
  //   final body = {
  //     "contents": [
  //       {
  //         "parts": [
  //           {
  //             "text": text
  //           }
  //         ]
  //       }
  //     ]
  //   };
  //
  //   //--------- Response  --------------------------
  //
  //   final response =await _dioChatBot.post(
  //     _baseUrl,
  //     data: body,
  //     options:Options(
  //       headers: {
  //         "Content-Type":"application/json",
  //       }
  //     ),
  //   );
  //
  //   ChatBotModel chatBotModel = ChatBotModel.fromJson(response.data);
  //
  //   print(chatBotModel.candidates);
  // }

   Future<void> sendMessage2(String text)async{

     // final apiKey = Platform.environment['AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY'];
     // if (apiKey == null) {
     //   print('No \$API_KEY environment variable');
     //   exit(1);
     // }
     // For text-only input, use the gemini-pro model
     final model = GenerativeModel(model: 'gemini-pro', apiKey: "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY");
     final content = [Content.text('summary last answer ')];
     final response = await model.generateContent(content);
     print(response.text);

   }

  Future<void> sendMessage3() async {
    // Access your API key as an environment variable (see "Set up your API key" above)
    final apiKey = Platform.environment['AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY'];

    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY",
        generationConfig: GenerationConfig(maxOutputTokens: 100));
    // Initialize the chat
    final chat = model.startChat(history: [
      Content.text('what is last question'),
      Content.model([TextPart('Great to meet you. What would you like to know?')])
    ]);
    var content = Content.text('How many paws are in my house?');
    var response = await chat.sendMessage(content);
    print(response.text);
  }
}


void main (){
  ChatBotServers().sendMessage3();
}
