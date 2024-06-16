
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<List<AllProfileChatData>> getAllProfileChatRepo()async{
  Response response = await ApiServices.dio.get(
    '/chat',

    options: Options(
      headers: {
        'authorization': '${ApiServices.authorization}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  AllProfileChatModel allProfileChatModel = AllProfileChatModel.fromJson(responseData);

  return allProfileChatModel.data;

}