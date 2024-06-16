part of 'get_popular_doctors_cubit.dart';

@immutable
abstract class GetPopularDoctorsState {}

class GetPopularDoctorsInitial extends GetPopularDoctorsState {}

class LoadingGetPopularState extends GetPopularDoctorsState {}
class SuccessGetPopularState extends GetPopularDoctorsState {
  final List<PopularDoctorsData> listOfPopularDoctors ;
  final List<List<PopularDoctorsData>> allDepartments ;
  SuccessGetPopularState({required this.listOfPopularDoctors , required this.allDepartments});
}
class ErrorGetPopularState extends GetPopularDoctorsState {
  final String messageError ;
  ErrorGetPopularState({required this.messageError});
}
