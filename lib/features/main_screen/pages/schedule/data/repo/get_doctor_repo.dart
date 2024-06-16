import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../features_exports.dart';


Future<GetDoctorModel> getDoctorRepo({required String DoctorId})async{

  Response response =await ApiServices.dio.get(
    "/doctors/$DoctorId",
    options: Options(
        headers: {
          'authorization':'${ApiServices.authorization}',
        }
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  GetDoctorModel getDoctorModel = GetDoctorModel.fromJson(responseData);
  return getDoctorModel;

}