import 'dart:ffi';

import 'package:health_care/features/features_exports.dart';
import 'package:meta/meta.dart';

part 'more_popular_doctors_state.dart';

class MorePopularDoctorsCubit extends Cubit<MorePopularDoctorsState> {

  MorePopularDoctorsCubit() : super(
      MorePopularDoctorsInitial()
      // MorePopularDoctorState(
      // popularDoctorItems: (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
      //     ? FixedVariables.initialNumPopularDoctors
      //     : listOfPopularDoctors.length,
      // canMore: (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
      //     ? true
      //     : false
      // )
  );


  // int newPopularDoctorItems = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)
  //     ? FixedVariables.initialNumPopularDoctors*2
  //     : listOfPopularDoctors.length;
  int newPopularDoctorItems = 0;

  //bool canMore = (listOfPopularDoctors.length > FixedVariables.initialNumPopularDoctors)?true:false;
  bool canMore = false;



  // int numberAllItemsList = listOfPopularDoctors.length;
  // int initialNumItems = FixedVariables.initialNumPopularDoctors;
  // int step = FixedVariables.stepMorePopularDoctor;


  int initialNumItems = FixedVariables.initialNumPopularDoctors;
  int step = FixedVariables.stepMorePopularDoctor;


  void initPopularDoctor({ required List<PopularDoctorsData> doctors}){
      newPopularDoctorItems = (doctors.length >= FixedVariables.initialNumPopularDoctors*2)
        ? FixedVariables.initialNumPopularDoctors*2
         : doctors.length;

     canMore = (doctors.length > FixedVariables.initialNumPopularDoctors)?true:false;
  }

  void morePopularDoctor( { required List<PopularDoctorsData> doctors} ) {
    if(newPopularDoctorItems+step<doctors.length){
      newPopularDoctorItems += step;
    }
    else {
      newPopularDoctorItems = doctors.length;
      canMore = false ;
    }

    emit(MorePopularDoctorState(popularDoctorItems: newPopularDoctorItems, canMore: canMore));
  }

  void lessPopularDoctor({ required List<PopularDoctorsData> doctors}){
     newPopularDoctorItems = (doctors.length > FixedVariables.initialNumPopularDoctors)
        ? FixedVariables.initialNumPopularDoctors*2
        : doctors.length;

     canMore = (doctors.length > FixedVariables.initialNumPopularDoctors)?true:false;

     emit(MorePopularDoctorState(popularDoctorItems: newPopularDoctorItems, canMore: canMore));
  }
}
