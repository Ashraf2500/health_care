import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:health_care/features/features_exports.dart';
import 'package:health_care/features/main_screen/pages/home/data/repo/popular_doctors_repo.dart';

part 'get_popular_doctors_state.dart';

class GetPopularDoctorsCubit extends Cubit<GetPopularDoctorsState> {
  GetPopularDoctorsCubit() : super(GetPopularDoctorsInitial());


  void getPopularDoctors({required BuildContext context})async{
    try{
      List<PopularDoctorsData>  allPopularDoctors =[];

      List<PopularDoctorsData>  doctors_0 =[];
      List<PopularDoctorsData>  doctors_1 =[];
      List<PopularDoctorsData>  doctors_2 =[];
      List<PopularDoctorsData>  doctors_3 =[];
      List<PopularDoctorsData>  doctors_4 =[];
      List<PopularDoctorsData>  doctors_5 =[];
      List<PopularDoctorsData>  doctors_6 =[];
      List<PopularDoctorsData>  doctors_7 =[];
      List<PopularDoctorsData>  doctors_8 =[];
      List<PopularDoctorsData>  doctors_9 =[];
      List<List<PopularDoctorsData>> allDepartments = [];

      emit(LoadingGetPopularState());
      List<PopularDoctorsData>  popularDoctors = await getPopularDoctorsRepo();
      allPopularDoctors = popularDoctors ;
      _checkDepartment(
        allDoctors: popularDoctors,
        doctors_0: doctors_0,
        doctors_1: doctors_1,
        doctors_2: doctors_2,
        doctors_3: doctors_3,
        doctors_4: doctors_4,
        doctors_5: doctors_5,
        doctors_6: doctors_6,
        doctors_7: doctors_7,
        doctors_8: doctors_8,
        doctors_9: doctors_9,
        allDepartments: allDepartments
      );
      emit(SuccessGetPopularState(listOfPopularDoctors: popularDoctors , allDepartments:allDepartments ));
      context.read<MorePopularDoctorsCubit>().initPopularDoctor(doctors: popularDoctors);
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      messageErrorServer.badResponseMessage = "The data is incorrect";
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorGetPopularState(messageError: messageError));
    }
  }

  void _checkDepartment({
    required List<PopularDoctorsData> allDoctors ,
    required List<PopularDoctorsData> doctors_0 ,
    required List<PopularDoctorsData> doctors_1,
    required List<PopularDoctorsData> doctors_2,
    required List<PopularDoctorsData> doctors_3,
    required List<PopularDoctorsData> doctors_4,
    required List<PopularDoctorsData> doctors_5,
    required List<PopularDoctorsData> doctors_6,
    required List<PopularDoctorsData> doctors_7,
    required List<PopularDoctorsData> doctors_8,
    required List<PopularDoctorsData> doctors_9,
    required List<List<PopularDoctorsData>> allDepartments,


  }){
    for(int i=0 ; i<allDoctors.length;i++){
      if(allDoctors[i].speciality==0){
        doctors_0.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==1){
        doctors_1.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==2){
        doctors_2.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==3){
        doctors_3.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==4){
        doctors_4.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==5){
        doctors_5.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==6){
        doctors_6.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==7){
        doctors_7.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==8){
        doctors_8.add(allDoctors[i]);
      }
      if(allDoctors[i].speciality==9){
        doctors_9.add(allDoctors[i]);
      }
    }
    allDepartments.add(allDoctors);
    allDepartments.add(doctors_0);
    allDepartments.add(doctors_1);
    allDepartments.add(doctors_2);
    allDepartments.add(doctors_3);
    allDepartments.add(doctors_4);
    allDepartments.add(doctors_5);
    allDepartments.add(doctors_6);
    allDepartments.add(doctors_7);
    allDepartments.add(doctors_8);
    allDepartments.add(doctors_9);
  }


}







