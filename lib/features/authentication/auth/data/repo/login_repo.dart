import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';

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

