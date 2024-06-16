part of 'edit_photo_cubit.dart';

@immutable
abstract class EditPhotoState {}

class EditPhotoInitial extends EditPhotoState {}

class LoadingEditPhotoState extends EditPhotoState {}
class SuccessEditPhotoState extends EditPhotoState {
  XFile image;
  SuccessEditPhotoState({required this.image});
}
class ErrorEditPhotoState extends EditPhotoState {}