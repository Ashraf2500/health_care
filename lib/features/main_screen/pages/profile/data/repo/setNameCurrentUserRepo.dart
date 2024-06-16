

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:health_care/features/features_exports.dart';
import 'package:image_picker/image_picker.dart';

void setCurrentGeneralInfoUser ({required BuildContext context,required String? newName , required String? newPhone , required XFile? newAvatar}){
  UserTypeData? _userTypeData = context.read<UserTypeCubit>().userType;

  if(_userTypeData==UserTypeData.patient){
    _setInfo(userType: "users", newName: newName , newPhone: newPhone , newAvatar: newAvatar);
  }
  else if(_userTypeData==UserTypeData.doctor){
    _setInfo(userType: "doctors", newName: newName, newPhone: newPhone , newAvatar: newAvatar);
  }
  else if(_userTypeData==UserTypeData.admin){
    _setInfo(userType: "admins", newName: newName, newPhone: newPhone , newAvatar: newAvatar);
  }

}

Future<void> _setInfo({
  required String userType,
  required String? newName,
  required String? newPhone,
  required XFile? newAvatar,
}) async {
  if (newName != null || newPhone != null || newAvatar != null) {
    FormData formData = FormData();

    if (newAvatar != null) {
      print("avatarFile =========> ${newAvatar.path}");
      // Convert XFile to MultipartFile
      MultipartFile avatarFile = await MultipartFile.fromFile(newAvatar.path);
      formData.files.add(MapEntry('avatar', avatarFile));
      print("avatarFile =========> ${avatarFile.filename}");
    }else{
      print("avater null");
    }

    List<MapEntry<String, String>> fields = [];
    if (newName != null) {
      fields.add(MapEntry('name', newName));
    }
    if (newPhone != null) {
      fields.add(MapEntry('phone', newPhone));
    }
    formData.fields.addAll(fields);

    try {
      Response response = await ApiServices.dio.patch(
        '/$userType/me',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiServices.token}',
          },
        ),
      );

      // Handle response
    } catch (e) {
      // Handle error
    }
  }
}


// Future<void>  _setInfo  ({required String userType,required String? newName, required String? newPhone , required XFile? newAvatar}) async{
//   if(newName!=null || newPhone!=null || newAvatar!=null){
//     print("newName ===> $newName");
//     print("newPhone ===> $newPhone");
//     //print("newAvatar ===> $newAvatar");
//     Response response = await ApiServices().getDio.patch(
//       '/$userType/me',
//       data: FormData.fromMap({
//         'name': '$newName',
//         'phone': '$newPhone',
//       }),
//       options: Options(
//           headers: {
//             'Authorization':'Bearer ${ApiServices.token}'
//           }
//       ),
//     );
//   }
// }
