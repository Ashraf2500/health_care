import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care/core/constants/routing_helper.dart';
import 'package:health_care/features/main_screen/pages/home/data/models/message_model.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/view/widgets/report_details_by_ai.dart';

part 'report_advice_details_state.dart';

enum ReportAdviceDetailsStatus { initial, loading, success, failure }
class ReportAdviceDetailsCubit extends Cubit<ReportAdviceDetailsState> {

  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";
  bool isLoading = false ;

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ReportAdviceDetailsCubit() : super(ReportAdviceDetailsInitial(status: ReportAdviceDetailsStatus.initial,advicesDetails: "",)){
    _model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: _secretApiKeyGemini,
        safetySettings: [
          SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
          //  SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
          //  SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
          //  SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
          //  SafetySetting(HarmCategory.unspecified, HarmBlockThreshold.none),
        ]
    );
    _chat = _model.startChat();


  }

  Future<void> sendMessage({required String advicesDoctor , required BuildContext context } ) async {
    String adviceMessage = "I have a medical report containing the doctor’s advices. I want you to explain this advices to me. This advices is \" $advicesDoctor \" ,and start answer by advice";

    try {
      emit(ReportAdviceDetailsInitial(status:ReportAdviceDetailsStatus.loading,advicesDetails:""));
      print("THE Loading  ");



      final advicesResponse = await _chat.sendMessage(Content.text(adviceMessage));
      print("advicesDetails =====> \" ${advicesResponse.text} \" ");
      //-----------------------------------------------------------------------------------------------




      //contentMessages.add( Message(text: DiagnosisContent, fromUser: false));
      //lastAnswerMessage = DiagnosisContent;

      //scrollListToEnd();
      emit(ReportAdviceDetailsInitial(
        status: ReportAdviceDetailsStatus.success ,
        advicesDetails:"${advicesResponse.text}",
      ));
      print("THE Success  ");
      // Navigator.push(context, MaterialPageRoute(builder: (context){
      //   return ReportDetailsByAi(
      //     diagnosisDetails:DiagnosisResponse.text,
      //     reasonsDetails:reasonsResponse.text,
      //     advicesDetails:advicesResponse.text,
      //     treatmentDetails:advicesResponse.text,
      //     listOfMedicine:listOfMedicines,
      //     listOfMedicineDetails:listMedicinesDetails,
      //   );
      // }));

    } catch (e) {
      print("THE ERROR ::: \" $e  \" ");
      emit(ReportAdviceDetailsInitial(status: ReportAdviceDetailsStatus.failure ,advicesDetails:"$e"));
    }
  }
}
