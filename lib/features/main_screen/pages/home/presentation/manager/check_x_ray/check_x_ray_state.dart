part of 'check_x_ray_cubit.dart';

@immutable
abstract class CheckXRayState {}

class CheckXRayInitial extends CheckXRayState {}

class LoadingCheckXRayState extends CheckXRayState {}
class SuccessCheckXRayState extends CheckXRayState {
  final CovidResultModel  x_ry_result ;
  SuccessCheckXRayState({required this.x_ry_result});
}
class ErrorCheckXRayState extends CheckXRayState {
  final String messageError ;
  ErrorCheckXRayState({required this.messageError});
}
