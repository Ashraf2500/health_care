import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care/core/constants/routing_helper.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/view/widgets/report_details_by_ai.dart';
import 'package:meta/meta.dart';

import '../../../data/models/message_model.dart';

part 'report_details_state.dart';

enum ReportDetailsStatus { initial, loading, success, failure }

class ReportDetailsCubit extends Cubit<ReportDetailsState> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";
  bool isLoading = false ;

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ReportDetailsCubit() :super(ReportDetailsInitial(status: ReportDetailsStatus.initial,diagnosisDetails: "",reasonsDetails: "",advicesDetails: "", treatmentDetails: "",listOfMedicine: [],listOfMedicineDetails: [])) {
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

  Future<void> sendMessage({required String diagnosisDoctor , required String advicesDoctor , required String medicinesDoctor,required BuildContext context , required List<String> listMeds  } ) async {
    String diagnosisMessage = "I have a medical report containing the doctor’s diagnosis. I want you to explain the diagnosis to me. This diagnosis is \" $diagnosisDoctor \" ";
    String adviceMessage = "I have a medical report containing the doctor’s advices. I want you to explain this advices to me. This advices is \" $advicesDoctor \" ,and start answer by advice";
    String reasonMessage = "I have a medical report that contains the doctor’s diagnosis. Based on this report, I just want you to explain to me what are the reasons that lead to the occurrence of the disease mentioned in the diagnosis. This diagnosis is \" $diagnosisDoctor \" ";
    String medicineListString = "I have some medicines names in this text. These text is \" $medicinesDoctor \" I would like to extract these names into a list  to use in dart program language code , store this list in variable called \" listOfMedicine \" ";
    String medicineListContent = "";
    List<String> listOfMedicines = [];
    List<String> listMedicinesDetails = [];

    //String medicineMessage = "I have a medical report that contains medications. Based on these medications, I just want to know what are the reasons for using each medication separately, in addition to what are the side effects of each medication and what are the cases of not using each medication. These medications are in this report.\" $medicinesDoctor \" .i want the answer by arabic ";
    //contentMessages.add(Message(text: message, fromUser: true));
    try {
      emit(ReportDetailsInitial(status:ReportDetailsStatus.loading,diagnosisDetails:"",advicesDetails:"",reasonsDetails:"",treatmentDetails:"",listOfMedicine: [],listOfMedicineDetails: []));
      print("THE Loading  ");

      final DiagnosisResponse = await _chat.sendMessage(Content.text(diagnosisMessage));
      print("diagnosisDetails =====> \" ${ DiagnosisResponse.text} \" ");

      final reasonsResponse = await _chat.sendMessage(Content.text(reasonMessage));
      print("reasonsDetails =====> \" ${ reasonsResponse.text} \" ");

      final advicesResponse = await _chat.sendMessage(Content.text(adviceMessage));
      print("advicesDetails =====> \" ${advicesResponse.text} \" ");
      //-----------------------------------------------------------------------------------------------
       final medicineListStringResponse = await _chat.sendMessage(Content.text(medicineListString));
       print("medicineListStringResponse =====> \" ${medicineListStringResponse.text} \" ");

      int indexStartBracket = medicineListStringResponse.text!.indexOf("[");
      int indexEndBracket = medicineListStringResponse.text!.indexOf("]");
      for (int i = indexStartBracket + 1; i < indexEndBracket; i++) {
        medicineListContent = medicineListContent + medicineListStringResponse.text![i];
      }
      print("medicineListContent =====> $medicineListContent ");
      listOfMedicines = medicineListContent.split(',').toList();
      print("medicineListContent =====>  ");
      print(listOfMedicines);

      for (int i =0; i < listMeds.length; i++) {
        String medicineMessageItem = "${listOfMedicines[i]} this is medicine , What are the cases in which it is recommended to use this medication, what are the cases in which it is not recommended to use this medication, and what are the side effects of this medication? ";
        final medicineListStringResponse = await _chat.sendMessage(Content.text(medicineMessageItem));
        print("medicineListStringResponse =====> \" ${medicineListStringResponse.text} \" ");
        listMedicinesDetails.add(medicineListStringResponse.text!);
        print("medicineListStringResponse ======>* ${medicineListStringResponse.text}");
      }

      print("listMedicinesDetails ======>* ${listMedicinesDetails}");


      //contentMessages.add( Message(text: DiagnosisContent, fromUser: false));
      //lastAnswerMessage = DiagnosisContent;

      //scrollListToEnd();
      emit(ReportDetailsInitial(
          status: ReportDetailsStatus.success ,
          diagnosisDetails:"${DiagnosisResponse.text}",
          advicesDetails:"${advicesResponse.text}",
          reasonsDetails: "${reasonsResponse.text}",
          treatmentDetails: "${advicesResponse.text}",
          listOfMedicine: listOfMedicines,
        listOfMedicineDetails: listMedicinesDetails,
      ));
      print("THE Success  ");
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ReportDetailsByAi(
          diagnosisDetails:DiagnosisResponse.text,
          reasonsDetails:reasonsResponse.text,
          advicesDetails:advicesResponse.text,
          treatmentDetails:advicesResponse.text,
          listOfMedicine: listMeds,
          //listOfMedicine:listOfMedicines,
          listOfMedicineDetails:listMedicinesDetails,
        );
      }));

    } catch (e) {
      print("THE ERROR ::: \" $e  \" ");
      emit(ReportDetailsInitial(status: ReportDetailsStatus.failure ,diagnosisDetails:"$e",advicesDetails:"$e",reasonsDetails: "$e",treatmentDetails: "$e",listOfMedicine: ["$e"],listOfMedicineDetails: ["$e"]));
    }
  }

}

