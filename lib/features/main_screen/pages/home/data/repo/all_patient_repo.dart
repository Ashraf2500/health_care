
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<List<AllPatientData>> getAllPatientRepo()async{
  Response response = await ApiServices.dio.get(
    '/users',

    options: Options(
      headers: {
        'authorization': '${ApiServices.authorization}',
      },
    ),
  );
print("patient repo :${response}");
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  AllPatientsModel allPatientsModel = AllPatientsModel.fromJson(responseData);

  return allPatientsModel.data;

}