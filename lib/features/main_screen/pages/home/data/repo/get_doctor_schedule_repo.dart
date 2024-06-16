
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<DoctorScheduleData> getDoctorScheduleRepo({required String doctorId})async{
  Response response = await ApiServices.dio.get(
    '/schedules/$doctorId',

    options: Options(
      headers: {
        'authorization': '${ApiServices.authorization}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  GetDoctorScheduleModel getDoctorScheduleModel = GetDoctorScheduleModel.fromJson(responseData);

  return getDoctorScheduleModel.data[0];

}