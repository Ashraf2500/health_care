import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/setNameCurrentUserRepo.dart';

part 'edit_name_state.dart';

class EditGeneralInfoCubit extends Cubit<EditGeneralInfoState> {
  EditGeneralInfoCubit() : super(EditGeneralInfoInitial());

  String? _name;
  String? _phone;
  XFile? _avatar;
  bool _canEditName = false;
  bool _canEditPhone = false;
  bool _canEditAvatar = false;

  void editProfileName({required bool canEditName}) {
    _canEditName = canEditName;

    emit(EditNameChanged(canEditName: canEditName));
  }

  void editProfilePhone({required bool canEditPhone}) {
    _canEditPhone = canEditPhone;

    emit(EditPhoneChanged(canEditPhone: canEditPhone));
  }

  void editProfileAvatar({required bool canEditAvatar}) {
    _canEditAvatar = canEditAvatar;

    emit(EditAvatarChanged(canEditAvatar: canEditAvatar));
  }

  void set setName(newName){
    _name = newName;
  }

  void set setPhone(newPhone){
    _phone = newPhone;
  }

  void set setAvatar(newAvatar){
    _avatar = newAvatar;
  }

  void saveNewInfo({required BuildContext context ,required String? newName ,required String? newPhone ,required XFile? newAvatar}) {
    if ( true) {
      try{

        setCurrentGeneralInfoUser(context:context,newName: _name , newPhone: _phone ,newAvatar: _avatar);
        emit(SuccessEditNameState());
      }on DioException catch (exception) {
        ApiServices messageErrorServer = ApiServices();
        String messageError = messageErrorServer.handelDioException(exception: exception);
        emit(ErrorEditNameState());
        print("------------------ Error --------------: $messageError");
      }
    }
  }

  String? get getName => _name;
  String? get getPhone => _phone;
  XFile? get getAvatar => _avatar;
}
