import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:meta/meta.dart';

part 'more_popular_doctors_state.dart';

class MorePopularDoctorsCubit extends Cubit<MorePopularDoctorsState> {

  MorePopularDoctorsCubit() : super(MorePopularDoctorState(
      popularDoctorItems: (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
          ? FixedVariables.initialNumPopularDoctors
          : listOfPopularDoctors.length,
      canMore: (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
          ? true
          : false));


  int newPopularDoctorItems = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
      ? FixedVariables.initialNumPopularDoctors*2
      : listOfPopularDoctors.length;

  bool canMore = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)?true:false;



  int numberAllItemsList = listOfPopularDoctors.length;
  int initialNumItems = FixedVariables.initialNumPopularDoctors;
  int step = FixedVariables.stepMorePopularDoctor;


  void morePopularDoctor() {
    if(newPopularDoctorItems+step<numberAllItemsList){
      newPopularDoctorItems += step;
    }
    else {
      newPopularDoctorItems = numberAllItemsList;
      canMore = false ;
    }

    emit(MorePopularDoctorState(popularDoctorItems: newPopularDoctorItems, canMore: canMore));
  }

  void lessPopularDoctor(){
     newPopularDoctorItems = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
        ? FixedVariables.initialNumPopularDoctors*2
        : listOfPopularDoctors.length;

     canMore = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)?true:false;

     emit(MorePopularDoctorState(popularDoctorItems: newPopularDoctorItems, canMore: canMore));
  }
}
