part of 'convert_sound_cubit.dart';

@immutable
abstract class ConvertSoundState {}

class ConvertSoundInitial extends ConvertSoundState {}

class SpeechInitialized extends ConvertSoundState {
  final bool speechEnabled;
  SpeechInitialized({required this.speechEnabled});
}

class SpeechListening extends ConvertSoundState {}

class SpeechStopped extends ConvertSoundState {
  final String lastWordsDiagnosis;
  final String lastWordsAdvices;
  SpeechStopped({required this.lastWordsDiagnosis ,required this.lastWordsAdvices});
}

class SpeechResult extends ConvertSoundState {
  final String lastWordsDiagnosis;
  final String lastWordsAdvices;
  SpeechResult({required this.lastWordsDiagnosis ,required this.lastWordsAdvices});
}