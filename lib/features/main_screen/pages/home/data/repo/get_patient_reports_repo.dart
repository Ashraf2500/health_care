
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<List<PatientReportData>> getPatientReportRepo()async{
  Response response = await ApiServices.dio.get(
    '/reports/users/me',

    options: Options(
      headers: {
        'Authorization': '${ApiServices.token}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  PatientReportsModel patientReportsModel = PatientReportsModel.fromJson(responseData);

  return patientReportsModel.data;

}