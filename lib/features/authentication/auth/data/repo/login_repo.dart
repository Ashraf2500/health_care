import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/core/constants/services.dart';
import 'package:health_care/features/authentication/auth/data/models/login_model.dart';


Future<LoginModel> loginRepo({required String phone,required  String password})async{
    Response response = await ApiServices().getDio.post(
      '/login',
      data: {
        'phone': phone,
        'pass': password,
      },
    );

    Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
   LoginModel loginData = LoginModel.fromJson(responseData);
   return loginData ;

}

