part of 'edit_specialty_cubit.dart';

@immutable
abstract class EditSpecialtyState extends EditState {}

class EditSpecialtyInitial extends EditSpecialtyState {}

class EditSpecialtyChanged extends EditSpecialtyState {
  bool canEdit ;
  EditSpecialtyChanged({required this.canEdit});
}
