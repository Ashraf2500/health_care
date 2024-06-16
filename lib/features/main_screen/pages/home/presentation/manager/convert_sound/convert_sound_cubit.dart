import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../../../../../features_exports.dart';

part 'convert_sound_state.dart';

class ConvertSoundCubit extends Cubit<ConvertSoundState> {
  ConvertSoundCubit() : super(ConvertSoundInitial());


  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String lastWordsDiagnosis = '';
  String lastWordsAdvice = '';
  int currentIndex = 0 ;


  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    emit(SpeechInitialized(speechEnabled: _speechEnabled));
  }

  void startListening({required BuildContext context , required int index}) async {
    index = currentIndex;
    await _speechToText.listen(onResult: _onSpeechResult);
    emit(SpeechListening());
  }

  void stopListening() async {
    await _speechToText.stop();
    emit(SpeechStopped(lastWordsDiagnosis:lastWordsDiagnosis ,lastWordsAdvices: lastWordsAdvice ));
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
     if(currentIndex==0){
       lastWordsDiagnosis = result.recognizedWords;
     }
     else{
     lastWordsAdvice = result.recognizedWords;
     }
    emit(SpeechResult(lastWordsDiagnosis:lastWordsDiagnosis ,lastWordsAdvices: lastWordsAdvice ));
  }
}
