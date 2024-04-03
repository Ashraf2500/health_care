import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/main_screen/main_screen_exports.dart';

part 'main_nav_bar_state.dart';


List<Widget> MainNavPage = [ HomeView(), ScheduleView(), ChatView() , ProfileView() ];

class MainNavBarCubit extends Cubit<MainNavBarState> {
  int currentPage = 0;
  Widget navBody = HomeView();

  MainNavBarCubit() : super(MainNavBarInitial());


  void chooseNavPage ({required int indexPage}){
    currentPage = indexPage;
    navBody = MainNavPage[indexPage];
     emit(MainScreenChanged(currentPge:currentPage,page: navBody));
  }

}
