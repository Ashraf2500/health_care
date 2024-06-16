import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";


Future<void> deleteAppointmentRepo({required String? appointmentId})async{
  Response response =await ApiServices.dio.delete(
    "/appointments/$appointmentId",
    options: Options(
        headers: {
          'Authorization':'${ApiServices.token}',
        }
    ),
  );


}

