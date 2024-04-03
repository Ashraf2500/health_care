import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_doctor_info_state.dart';

class GetDoctorInfoCubit extends Cubit<GetDoctorInfoState> {
  GetDoctorInfoCubit() : super(GitDoctorInfoInitial());

  int indexChoose = 0 ;
  void getDoctorInfo(int index){
    indexChoose = index;
     emit(GitDoctorInfoChanged(index: index));

  }
}
