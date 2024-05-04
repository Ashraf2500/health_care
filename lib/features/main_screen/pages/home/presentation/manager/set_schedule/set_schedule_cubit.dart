import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_schedule_state.dart';

class SetScheduleCubit extends Cubit<SetScheduleState> {
  SetScheduleCubit() : super(SetScheduleInitial());

  List<String> days = ["Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"];

  void chooseDay (){

  }


}
