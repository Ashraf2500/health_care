import 'package:meta/meta.dart';
import 'package:health_care/features/features_exports.dart';

part 'edit_specialty_state.dart';

class EditSpecialtyCubit extends Cubit<EditSpecialtyState> {
  EditSpecialtyCubit() : super(EditSpecialtyInitial());


  String _Specialty = "Teethes Dentist";
  bool _canEdit = false;

  void editProfileSpecialty({required bool canEdit}) {
    _canEdit = canEdit;

    emit(EditSpecialtyChanged(canEdit: canEdit));
  }

  void set setSpecialty(String newSpecialty) {
    if (_canEdit) {
      _Specialty = newSpecialty;
      emit(EditSpecialtyInitial());
    }
  }

  String get getSpecialty => _Specialty;

}
