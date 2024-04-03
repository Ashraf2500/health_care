part of 'show_popular_doctors_cubit.dart';

@immutable
abstract class ShowMorePopularDoctorsState {}

class ShowMorePopularDoctorsInitial extends ShowMorePopularDoctorsState {}

class morePopularDoctorsChanged extends ShowMorePopularDoctorsState {
  bool enableShow = false;

  morePopularDoctorsChanged({required this.enableShow});
}
