part of 'edit_name_cubit.dart';

@immutable
abstract class EditNameState extends EditState {}

class EditNameInitial extends EditNameState {}

class EditNameChanged extends EditNameState {
  bool canEdit ;

  EditNameChanged({required this.canEdit});
}
