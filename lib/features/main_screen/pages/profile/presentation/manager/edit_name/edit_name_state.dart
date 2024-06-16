part of 'edit_name_cubit.dart';

@immutable
abstract class EditGeneralInfoState extends EditState {}

class EditGeneralInfoInitial extends EditGeneralInfoState {}

class EditNameChanged extends EditGeneralInfoState {
  bool canEditName = false ;
  EditNameChanged({required this.canEditName});
}

class EditPhoneChanged extends EditGeneralInfoState {
  bool canEditPhone = false;
  EditPhoneChanged({required this.canEditPhone});
}

class EditAvatarChanged extends EditGeneralInfoState {
  bool canEditAvatar = false;
  EditAvatarChanged({required this.canEditAvatar});
}
class SuccessEditNameState extends EditGeneralInfoState {}
class ErrorEditNameState extends EditGeneralInfoState {}
