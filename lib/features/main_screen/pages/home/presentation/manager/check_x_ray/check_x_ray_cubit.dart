import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/main_screen/pages/home/data/models/api_models/covid_result_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../../features_exports.dart';

part 'check_x_ray_state.dart';

class CheckXRayCubit extends Cubit<CheckXRayState> {
  CheckXRayCubit() : super(CheckXRayInitial());


  Future<void> checkXrayFunc({required BuildContext context ,required  XFile file ,required File image })async{
    try{


      emit(LoadingCheckXRayState());
      CovidResultModel x_ry_result = await covidResultRepo(file: file);

      emit(SuccessCheckXRayState(x_ry_result: x_ry_result));
      Navigator.push(context, PageTransition(
        child: CheckXRayDiagnosis(image: image , results: x_ry_result,),
        type: PageTransitionType.fade,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: Duration(milliseconds: FixedVariables.pageTransition),

      ));

    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorCheckXRayState(messageError: messageError));
    }
  }
}
