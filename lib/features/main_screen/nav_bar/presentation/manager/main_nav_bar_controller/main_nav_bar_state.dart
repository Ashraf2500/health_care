part of 'main_nav_bar_cubit.dart';

@immutable
abstract class MainNavBarState {}

class MainNavBarInitial extends MainNavBarState {}

// ignore: must_be_immutable
class MainScreenChanged extends MainNavBarState {
  int currentPge = 0 ;
  Widget? page = HomeView() ;

  MainScreenChanged({required this.currentPge , required this.page});

}
