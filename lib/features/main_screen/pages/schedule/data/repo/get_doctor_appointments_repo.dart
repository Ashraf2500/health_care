import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/features/features_exports.dart";

Future<List<DoctorAppointmentsData>> getDoctorAppointmentsRepo()async{
  Response response =await ApiServices.dio.get(
    "/appointments/doctors/me",
    options: Options(
        headers: {
          'Authorization':'${ApiServices.token}',
        }
    ),
  );
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  DoctorAppointmentsModel getDoctorAppointmentsModel = DoctorAppointmentsModel.fromJson(responseData);
  return getDoctorAppointmentsModel.data;

}