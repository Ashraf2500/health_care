
import 'package:dio/dio.dart';

import '../../../../../../core/constants/services.dart';

//import 'package:health_care/features/features_exports.dart';


Future<void> ratingRepo({required String doctorId , required double rate})async{
  Response response = await ApiServices.dio.put(
    '/ratings/$doctorId/$rate',
    data: {
      "rating" :rate
    },
    options: Options(
      headers: {
        'Authorization': '${ApiServices.token}',
      },
    ),
  );

}
