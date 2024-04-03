part of 'edit_phone_cubit.dart';

@immutable
abstract class EditPhoneState extends EditState{}

class EditPhoneInitial extends EditPhoneState {}

class EditPhoneChanged extends EditPhoneState {
  bool canEdit ;
  EditPhoneChanged({required this.canEdit});
}