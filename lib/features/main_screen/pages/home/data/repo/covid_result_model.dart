import "dart:convert";

import "package:dio/dio.dart";
import "package:health_care/features/main_screen/pages/home/data/models/api_models/covid_result_model.dart";
import "package:image_picker/image_picker.dart";


Future<CovidResultModel> covidResultRepo({required XFile file})async{
  FormData formData = FormData();
  MultipartFile xRayFile = await MultipartFile.fromFile(file.path);
  formData.files.add(MapEntry('file', xRayFile));
  Response response =await Dio().post(
    "http://54.216.62.191:5000/predict",
    data: formData,
  );

  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  CovidResultModel xrayModel = CovidResultModel.fromJson(responseData);

  return xrayModel;

}