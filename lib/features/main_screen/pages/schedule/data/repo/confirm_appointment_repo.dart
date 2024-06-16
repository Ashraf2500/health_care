import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";


Future<void> confirmAppointmentRepo({required String? appointmentId})async{
  Response response =await ApiServices.dio.post(
    "/appointments/$appointmentId/completed",
    options: Options(
        headers: {
          'authorization':'${ApiServices.token}',
        }
    ),
  );

  print(response);


}