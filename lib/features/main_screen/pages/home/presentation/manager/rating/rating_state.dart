part of 'rating_cubit.dart';

@immutable
abstract class RatingState {}

class RatingInitial extends RatingState {}

class LoadingRatingState extends RatingState {}
class SuccessRatingState extends RatingState {}
class ErrorRatingState extends RatingState {
  final String messageError ;
  ErrorRatingState({required this.messageError});
}
