part of 'get_all_patients_cubit.dart';

@immutable
abstract class GetAllPatientsState {}

class GetAllPatientsInitial extends GetAllPatientsState {}

class LoadingGetAllPatientsState extends GetAllPatientsState {}
class SuccessGetAllPatientsState extends GetAllPatientsState {
  final List<AllPatientData>  allPatientData;
  SuccessGetAllPatientsState({required this.allPatientData});
}
class ErrorGetAllPatientsState  extends GetAllPatientsState {
  final String messageError ;
  ErrorGetAllPatientsState({required this.messageError});
}
