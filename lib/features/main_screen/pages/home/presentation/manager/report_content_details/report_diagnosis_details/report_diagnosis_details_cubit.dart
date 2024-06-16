import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care/core/constants/routing_helper.dart';
import 'package:health_care/features/main_screen/pages/home/data/models/message_model.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/view/widgets/report_details_by_ai.dart';
part 'report_diagnosis_details_state.dart';

enum ReportDiagnosisDetailsStatus { initial, loading, success, failure }
class ReportDiagnosisDetailsCubit extends Cubit<ReportDiagnosisDetailsState> {

  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";
  bool isLoading = false ;

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ReportDiagnosisDetailsCubit() : super(ReportDiagnosisDetailsInitial(status: ReportDiagnosisDetailsStatus.initial,diagnosisDetails: "",)){
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
    String diagnosisMessage = "I have a medical report containing the doctor’s diagnosis. I want you to explain the diagnosis to me. This diagnosis is \" $diagnosisDoctor \" ";

    try {
      emit(ReportDiagnosisDetailsInitial(status:ReportDiagnosisDetailsStatus.loading,diagnosisDetails:""));
      print("THE Loading  ");

      final DiagnosisResponse = await _chat.sendMessage(Content.text(diagnosisMessage));
      print("diagnosisDetails (): =====> \" ${ DiagnosisResponse.text} \" ");


      //-----------------------------------------------------------------------------------------------



      //contentMessages.add( Message(text: DiagnosisContent, fromUser: false));
      //lastAnswerMessage = DiagnosisContent;

      //scrollListToEnd();
      emit(ReportDiagnosisDetailsInitial(
        status: ReportDiagnosisDetailsStatus.success ,
        diagnosisDetails:"${DiagnosisResponse.text}",
      ));


    } catch (e) {
      print("THE ERROR ::: \" $e  \" ");
      emit(ReportDiagnosisDetailsInitial(status: ReportDiagnosisDetailsStatus.failure ,diagnosisDetails:"$e"));
    }
  }







}
