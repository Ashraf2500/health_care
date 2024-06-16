import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../features_exports.dart';
import '../../../../features_exports.dart';
import '../../../../features_exports.dart';

part 'get_doctor_info_state.dart';

class GetDoctorInfoCubit extends Cubit<GetDoctorInfoState> {
  GetDoctorInfoCubit() : super(GitDoctorInfoInitial());

  int indexChoose = 0 ;
  void getDoctorInfo({required int index ,required  PopularDoctorsData popularDoctorsData}){
    indexChoose = index;
     emit(GitDoctorInfoChanged(index: index , popularDoctorsData: popularDoctorsData));

  }
}
