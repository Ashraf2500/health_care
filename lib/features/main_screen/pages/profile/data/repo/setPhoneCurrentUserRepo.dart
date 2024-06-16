import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care/features/features_exports.dart';

void setPhoneCurrentUser(
    {required BuildContext context, required String? newPhone}) {
  UserTypeData? _userTypeData = context.read<UserTypeCubit>().userType;

  if (_userTypeData == UserTypeData.patient) {
    _setPhone(userType: "users", newPhone: newPhone);
  } else if (_userTypeData == UserTypeData.doctor) {
    _setPhone(userType: "doctors", newPhone: newPhone);
  } else if (_userTypeData == UserTypeData.admin) {
    _setPhone(userType: "admins", newPhone: newPhone);
  }
}

Future<void> _setPhone(
    {required String userType, required String? newPhone}) async {
  if (newPhone != null) {
    Response response = await ApiServices.dio.patch(
          '/$userType/me',
          data: FormData.fromMap({
            'name': '$newPhone',
            'phone': '$newPhone',
          }),
          options: Options(
              headers: {'Authorization': 'Bearer ${ApiServices.token}'}),
        );
    print("------------ response ---------------:$response");
  }
}
