import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/features/features_exports.dart";

Future<List<AllAppointmentsData>> getAllAppointmentsRepo()async{
  Response response =await ApiServices.dio.get(
    "/appointments",
    options: Options(
        headers: {
          'authorization':'${ApiServices.authorization}',
        }
    ),
  );
  print("response : ${response.data}");
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  AllAppointmentsModel allAppointmentsModel = AllAppointmentsModel.fromJson(responseData);
  return allAppointmentsModel.data;

}