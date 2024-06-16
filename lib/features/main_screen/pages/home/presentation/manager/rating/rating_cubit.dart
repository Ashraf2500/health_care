import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:health_care/features/features_exports.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  Future<void> sendRating({required BuildContext context , required String doctorId , required double rate})async{
    try{
      emit(LoadingRatingState());
      await ratingRepo(doctorId: doctorId, rate: rate);
      emit(SuccessRatingState());
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message:messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorRatingState(messageError: messageError));
    }
  }

}
