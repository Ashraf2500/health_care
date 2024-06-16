import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care/core/constants/routing_helper.dart';
import 'package:health_care/features/main_screen/pages/home/data/models/message_model.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/view/widgets/report_details_by_ai.dart';

part 'report_reason_details_state.dart';

enum ReportReasonDetailsStatus { initial, loading, success, failure }
class ReportReasonDetailsCubit extends Cubit<ReportReasonDetailsState> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";
  bool isLoading = false ;

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ReportReasonDetailsCubit() : super(ReportReasonDetailsInitial(status: ReportReasonDetailsStatus.initial,reasonDetails: "",)){
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

  Future<void> sendMessage({required String diagnosisDoctor , required BuildContext context } ) async {
    String reasonMessage = "I have a medical report that contains the doctor’s diagnosis. Based on this report, I just want you to explain to me what are the reasons that lead to the occurrence of the disease mentioned in the diagnosis. This diagnosis is \" $diagnosisDoctor \" ";

    try {
      emit(ReportReasonDetailsInitial(status:ReportReasonDetailsStatus.loading,reasonDetails:""));
      print("THE Loading  ");



      final reasonsResponse = await _chat.sendMessage(Content.text(reasonMessage));
      print("reasonsDetails =====> \" ${ reasonsResponse.text} \" ");
      //-----------------------------------------------------------------------------------------------




      //contentMessages.add( Message(text: DiagnosisContent, fromUser: false));
      //lastAnswerMessage = DiagnosisContent;

      //scrollListToEnd();
      emit(ReportReasonDetailsInitial(
        status: ReportReasonDetailsStatus.success ,
        reasonDetails:"${reasonsResponse.text}",
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
      emit(ReportReasonDetailsInitial(status: ReportReasonDetailsStatus.failure ,reasonDetails:"$e"));
    }
  }
}
