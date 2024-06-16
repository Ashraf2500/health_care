

import 'package:dio/dio.dart';

import '../../../../../features_exports.dart';

Future<void> createDoctorRepo({required String fullName,required String phone,required  String password, required int speciality , required String expertment })async{
  Response response = await ApiServices.dio.post(
      '/doctors',
      data: {
        'name': fullName,
        'phone': phone,
        'pass': password,
        'speciality': speciality,
        'expertment':"$expertment years",
      },
      options: Options(
          headers: {
            "authorization":ApiServices.authorization,
          }
      )
  );


}