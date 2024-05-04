import 'package:bloc/bloc.dart';
import 'package:health_care/core/utils/shared/cache_helper.dart';
import 'package:meta/meta.dart';

part 'switch_fingerprint_state.dart';


class SwitchFingerprintCubit extends Cubit<SwitchFingerprintState> {

   bool isSwitchOn = false ;
  SwitchFingerprintCubit() : super((FingerSwitchState())){
    fetchInitialFingerSwitch();
  }

  void fetchInitialFingerSwitch() async {
    isSwitchOn = await CacheHelper.getData(key: 'finger') ?? false;
    emit(FingerSwitchState());
  }

  void changeFingerSwitch() {

    isSwitchOn = !isSwitchOn;
    emit(FingerSwitchState());
    CacheHelper.saveData(key: 'finger', value: isSwitchOn);
  }

}
