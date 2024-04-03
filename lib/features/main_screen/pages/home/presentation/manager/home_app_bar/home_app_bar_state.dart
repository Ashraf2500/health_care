part of 'home_app_bar_cubit.dart';

@immutable
abstract class HomeAppBarState {}

class HomeAppBarInitial extends HomeAppBarState {}

class ScrollHomeAppBarChanged extends HomeAppBarState {
  bool isMoved = false ;

  ScrollHomeAppBarChanged({required this.isMoved });
}
