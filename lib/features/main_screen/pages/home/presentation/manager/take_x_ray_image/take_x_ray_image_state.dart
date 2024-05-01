part of 'take_x_ray_image_cubit.dart';

@immutable
abstract class TakeXRayImageState {}

class TakeXRayImageInitial extends TakeXRayImageState {}

class LoadingTakeImageXRayState extends TakeXRayImageState {}
class SuccessTakeImageXRayState extends TakeXRayImageState {
  File image;
  SuccessTakeImageXRayState({required this.image});
}
class ErrorTakeImageXRayState extends TakeXRayImageState {}


