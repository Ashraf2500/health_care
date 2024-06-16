import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';

Future<List<PatientAppointmentData>> getPatientAppointments ()async {

  Response response = await ApiServices.dio.get(
    '/appointments/users/me',
    options: Options(
      headers: {
        'Authorization':'${ApiServices.token}',
      }
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;

  GetPatientAppointmentsModel getPatientAppointmentsData = GetPatientAppointmentsModel.fromJson(responseData);

  return getPatientAppointmentsData.data;


}