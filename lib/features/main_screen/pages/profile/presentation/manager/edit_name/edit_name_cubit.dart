import 'package:bloc/bloc.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:meta/meta.dart';

part 'edit_name_state.dart';

class EditNameCubit extends Cubit<EditNameState> {
  EditNameCubit() : super(EditNameInitial());

  String _name = "Ashraf Hatem Omara";
  bool _canEdit = false;

  void editProfileName({required bool canEdit}) {
    _canEdit = canEdit;
    emit(EditNameChanged(canEdit: canEdit));
  }

  void set setName(String newName) {
    if (_canEdit) {
      _name = newName;
      emit(EditNameInitial());
    }
  }

  String get getName => _name;
}
