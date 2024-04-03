part of 'get_doctor_info_cubit.dart';

@immutable
abstract class GetDoctorInfoState {}

class GitDoctorInfoInitial extends GetDoctorInfoState {}

class GitDoctorInfoChanged extends GetDoctorInfoState {
  int index ;
  GitDoctorInfoChanged({required this.index});

}
