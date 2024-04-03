import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_popular_doctors_state.dart';

class ShowMorePopularDoctorsCubit extends Cubit<ShowMorePopularDoctorsState> {
  ShowMorePopularDoctorsCubit() : super(morePopularDoctorsChanged(enableShow: false));
  bool enableShow = false ;
  void morePopularDoctors(){
     enableShow = !enableShow ;
     emit(morePopularDoctorsChanged(enableShow: enableShow));
  }
}
