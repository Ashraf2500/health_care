

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/core/utils/current_user/data/models/current_Admin_model.dart';
import 'package:health_care/core/utils/current_user/data/models/current_doctor_model.dart';
import 'package:health_care/core/utils/current_user/data/models/current_patient_model.dart';

import '../../../constants/services.dart';
//import 'package:health_care/features/features_exports.dart';




Future<CurrentPatientModel> currentPatientRepo()async {

  Response response = await ApiServices().getDio.get(
    '/users/me',
    options: Options(
        headers: {
          'Authorization':'Bearer ${ApiServices.token}'
        }
    ),
  );
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  CurrentPatientModel currentPatientData = CurrentPatientModel.fromJson(responseData);
  return  currentPatientData;

}

Future<CurrentDoctorModel> currentDoctorRepo()async {
  print("---------- doctor repo ------------");

  Response response = await ApiServices().getDio.get(
    '/doctors/me',
    options: Options(
        headers: {
          'Authorization':'Bearer ${ApiServices.token}'
        }
    ),
  );
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  CurrentDoctorModel currentDoctorData = CurrentDoctorModel.fromJson(responseData);
  return  currentDoctorData;

}

Future<CurrentAdminModel> currentAdminsRepo()async {

  Response response = await ApiServices().getDio.get(
    '/admins/me',
    options: Options(
        headers: {
          'Authorization':'Bearer ${ApiServices.token}'
        }
    ),
  );
  Map<String, dynamic> responseData = response.data is String ? jsonDecode(response.data) : response.data;
  CurrentAdminModel currentAdminModel = CurrentAdminModel.fromJson(responseData);
  return  currentAdminModel;

}

