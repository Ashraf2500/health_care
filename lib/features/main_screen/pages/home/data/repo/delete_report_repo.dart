import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/core/constants/services.dart";


Future<void> deleteReportRepo({required String? reportId})async{
  Response response =await ApiServices.dio.delete(
    "/reports/$reportId",
    options: Options(
        headers: {
          'authorization':'${ApiServices.authorization}',
        }
    ),
  );


}