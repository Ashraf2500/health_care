import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choose_doctor_department_state.dart';

class ChooseDoctorDepartmentCubit extends Cubit<ChooseDoctorDepartmentState> {
  ChooseDoctorDepartmentCubit() : super(ChooseDoctorDepartmentInitial());

  int indexCategory = 0 ;
  void changeCategory({required int categoryIndex}){
    indexCategory = categoryIndex;
    emit(ChangedDoctorDepartmentState());
  }
}
