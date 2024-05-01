
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/core/constants/services.dart';
import 'package:health_care/features/authentication/auth/data/models/sign_up_mpdel.dart';



Future<SignUpModel> signUpRepo({required String fullName,required String phone,required  String password})async{
  Response response = await ApiServices().getDio.post(
    '/users',
    data: {
      'name': fullName,
      'phone': phone,
      'pass': password,
    },
    options: Options(
      headers: {
        "authorization":ApiServices.authorization,
      }
    )
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  SignUpModel signUpData = SignUpModel.fromJson(responseData);

  return signUpData ;

}