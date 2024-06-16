
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<List<PrivateChatData>> getAllPrivateChatRepo({required String? destinationId})async{
  Response response = await ApiServices.dio.get(
    '/chat/$destinationId',

    options: Options(
      headers: {
        'Authorization': '${ApiServices.token}',
      },
    ),
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  AllPrivateChatModel allPrivateChatModel = AllPrivateChatModel.fromJson(responseData);

  return allPrivateChatModel.data;

}