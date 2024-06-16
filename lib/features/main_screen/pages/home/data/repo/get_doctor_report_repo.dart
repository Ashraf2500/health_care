
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<List<DoctorReportData>> getDoctorReportRepo()async{
  Response response = await ApiServices.dio.get(
    '/reports/doctors/me',

    options: Options(
      headers: {
        'Authorization': '${ApiServices.token}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  DoctorReportsModel doctorReportsModel = DoctorReportsModel.fromJson(responseData);

  return doctorReportsModel.data;

}