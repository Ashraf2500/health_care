part of 'more_popular_doctors_cubit.dart';

@immutable
abstract class MorePopularDoctorsState {}

class MorePopularDoctorsInitial extends MorePopularDoctorsState {
  int? popularDoctorItems;
  bool? canMore ;

  MorePopularDoctorsInitial({required this.popularDoctorItems, required this.canMore});
}
class MorePopularDoctorState extends MorePopularDoctorsState {
  int? popularDoctorItems;
  bool? canMore ;
  MorePopularDoctorState({required this.popularDoctorItems, required this.canMore});
}
