import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../features_exports.dart';



Future<List<PopularDoctorsData>> getPopularDoctorsRepo ()async{

  Response response = await ApiServices.dio.get(
    '/doctors?sort=rating',
    // data: {
    //   'sort':'rating'
    // },
    options: Options(
      headers: {
        'authorization': '${ApiServices.authorization}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  PopularDoctorsModel popularDoctorsData = PopularDoctorsModel.fromJson(responseData);

  return popularDoctorsData.data;
}