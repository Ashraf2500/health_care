import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";


Future<void> deleteDoctorRepo({required String? doctorId})async{
  Response response =await ApiServices.dio.delete(
    "/doctors/$doctorId",
    options: Options(
        headers: {
          'authorization':'${ApiServices.authorization}',
        }
    ),
  );


}

