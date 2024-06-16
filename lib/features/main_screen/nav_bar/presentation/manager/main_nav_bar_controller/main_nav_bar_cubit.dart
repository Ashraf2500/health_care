import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/core/constants/constants_exports.dart';
import 'package:health_care/features/authentication/auth/presentation/auth_presentation_exports.dart';
import 'package:health_care/features/main_screen/main_screen_exports.dart';

part 'main_nav_bar_state.dart';


List<Widget> MainNavPage = [ HomeView(), ScheduleView(), ChatView() , ProfileView() ];

class MainNavBarCubit extends Cubit<MainNavBarState> {
  int currentPage = 0;
  Widget navBody = HomeView();

  MainNavBarCubit() : super(MainNavBarInitial());


  void chooseNavPage ({required BuildContext context,required int indexPage}){
    currentPage = indexPage;
    navBody = MainNavPage[indexPage];
    checkIndex(context: context,index: indexPage);
     emit(MainScreenChanged(currentPge:currentPage,page: navBody));
  }

  void checkIndex({required BuildContext context , required int index}){//3423107228712

    UserTypeData? _userTyp =  context.read<UserTypeCubit>().userType;
    if(index==1){
      //(_userTyp == UserTypeData.patient)?context.read<PatientScheduleCubit>().getUerAppointments(context: context ):null;
    }
  }
}


//---------
