import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";


Future<void> deleteUserRepo({required String? userId})async{
  Response response =await ApiServices.dio.delete(
    "/users/$userId",
    options: Options(
        headers: {
          'authorization':'${ApiServices.authorization}',
        }
    ),
  );


}