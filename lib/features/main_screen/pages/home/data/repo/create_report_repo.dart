import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";

Future<void> createReportRepo({
  required String? userId,
  required String? appointmentId,
  required String? diagnosis,
  required String? advices,
  required String? medicines,
})async{
  Response response =await ApiServices.dio.post(
    "/reports/$userId/$appointmentId",
    data:{
      "diagnosis":diagnosis,
      "advices": advices,
      "medicines": medicines,
      "reasons": "reasons",
      "treatments": " "
    },
    options: Options(
        headers: {
          'authorization':'${ApiServices.token}',
        }
    ),
  );

  print(response);
}
