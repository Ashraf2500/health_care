import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_app_bar_state.dart';

class HomeAppBarCubit extends Cubit<HomeAppBarState> {
  bool isMoved = false;
  double pastScrollOffset = 0.0;

  HomeAppBarCubit() : super((ScrollHomeAppBarChanged(isMoved: false)));

  void scrollHomeAppBar({required ScrollController scrollController}) {
    if (scrollController.offset == 0) {                                           //scrollController.offset < pastScrollOffset
      isMoved = false;
    } else if (scrollController.offset > pastScrollOffset) {
      isMoved = true;
    }
    pastScrollOffset = scrollController.offset;
    emit(ScrollHomeAppBarChanged(isMoved: isMoved ));
  }
}
