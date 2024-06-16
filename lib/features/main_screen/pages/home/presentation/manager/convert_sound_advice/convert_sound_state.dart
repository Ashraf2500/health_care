part of 'convert_sound_cubit.dart';

@immutable
abstract class ConvertSoundAdviceState {}

class ConvertSoundAdviceInitial extends ConvertSoundAdviceState {}

class SpeechInitializedAdvice extends ConvertSoundAdviceState {
  final bool speechEnabled;
  SpeechInitializedAdvice({required this.speechEnabled});
}

class SpeechListeningAdvice extends ConvertSoundAdviceState {
  String text ;
  SpeechListeningAdvice({required this.text});
}

class SpeechStoppedAdvice extends ConvertSoundAdviceState {
  final String lastWordsAdvices;
  SpeechStoppedAdvice({required this.lastWordsAdvices});
}

class SpeechResultAdvice extends ConvertSoundAdviceState {
  final String lastWordsAdvices;
  SpeechResultAdvice({required this.lastWordsAdvices});
}