import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care/core/constants/routing_helper.dart';
import 'package:health_care/features/main_screen/pages/home/data/models/message_model.dart';
import 'package:health_care/features/main_screen/pages/home/presentation/view/widgets/report_details_by_ai.dart';
import 'package:meta/meta.dart';


part 'report_medicine_details_state.dart';

enum ReportMedicineDetailsStatus { initial, loading, success, failure }

class ReportMedicineDetailsCubit extends Cubit<ReportMedicineDetailsState> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController textController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  List<Message> contentMessages = [];
  String? lastAnswerMessage = "";
  bool isLoading = false ;

  static const _secretApiKeyGemini = "AIzaSyDVfEQaV-wFxWSn62R9sQS0sHnIlgqARIY";
  static const _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_secretApiKeyGemini";

  ReportMedicineDetailsCubit() :super(ReportMedicineDetailsInitial(status: ReportMedicineDetailsStatus.initial,listOfMedicine: [],listOfMedicineDetails: [])) {
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

  Future<void> sendMessage({required String medicinesDoctor,required BuildContext context } ) async {
    String medicineListString = "I have some medicines names in this text. These text is \" $medicinesDoctor \" I would like to extract these names into a list  to use in dart program language code , store this list in variable called \" listOfMedicine \" ";
    String medicineListContent = "";
    List<String> listOfMedicines = [];
    List<String> listMedicinesDetails = [];

    try {
      emit(ReportMedicineDetailsInitial(status:ReportMedicineDetailsStatus.loading,listOfMedicine: [],listOfMedicineDetails: []));
      print("THE Loading  ");

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

      for (int i =0; i < listOfMedicines.length; i++) {
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
      emit(ReportMedicineDetailsInitial(
        status: ReportMedicineDetailsStatus.success ,
        listOfMedicine: listOfMedicines,
        listOfMedicineDetails: listMedicinesDetails,
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
      emit(ReportMedicineDetailsInitial(status: ReportMedicineDetailsStatus.failure ,listOfMedicine: ["$e"],listOfMedicineDetails: ["$e"]));
    }
  }
}
