import 'package:meta/meta.dart';
import 'package:health_care/features/features_exports.dart';


part 'edit_phone_state.dart';

class EditPhoneCubit extends Cubit<EditPhoneState> {
  EditPhoneCubit() : super(EditPhoneInitial());

  String _phone = "01054397562";
  bool _canEdit = false;

  void editProfilePhone({required bool canEdit}) {
    _canEdit = canEdit;

    emit(EditPhoneChanged(canEdit: canEdit));
  }

  void set setPhone(String newPhone) {
    if (_canEdit) {
      _phone = newPhone;
      emit(EditPhoneInitial());
    }
  }

  String get getPhone => _phone;
}
