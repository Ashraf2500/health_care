import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../../../../../features_exports.dart';

part 'convert_sound_state.dart';

class ConvertSoundAdviceCubit extends Cubit<ConvertSoundAdviceState> {
  ConvertSoundAdviceCubit() : super(ConvertSoundAdviceInitial());


  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String lastWordsAdvice = '';
  int currentIndex = 0 ;


  void initSpeechAdvice() async {
    _speechEnabled = await _speechToText.initialize();
    emit(SpeechInitializedAdvice(speechEnabled: _speechEnabled));
  }

  void startListeningAdvice({required BuildContext context }) async {
    await _speechToText.listen(onResult: _onSpeechResultAdvice);
    emit(SpeechListeningAdvice(text: lastWordsAdvice));
    print("::::sharaf $lastWordsAdvice");
  }

  void stopListeningAdvice() async {
    await _speechToText.stop();
    emit(SpeechStoppedAdvice(lastWordsAdvices: lastWordsAdvice ));
  }

  void _onSpeechResultAdvice(SpeechRecognitionResult result) {
       lastWordsAdvice = result.recognizedWords;
    emit(SpeechResultAdvice(lastWordsAdvices: lastWordsAdvice ));
  }
}
