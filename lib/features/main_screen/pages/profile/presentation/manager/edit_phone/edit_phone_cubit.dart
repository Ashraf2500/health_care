// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
// import 'package:health_care/features/features_exports.dart';
//
// import '../../../data/repo/setPhoneCurrentUserRepo.dart';
//
//
// part 'edit_phone_state.dart';
//
// class EditPhoneCubit extends Cubit<EditPhoneState> {
//   EditPhoneCubit() : super(EditPhoneInitial());
//
//   String? _phone;
//   bool _canEdit = false;
//
//   void editProfilePhone({required bool canEdit}) {
//     _canEdit = canEdit;
//
//     emit(EditPhoneChanged(canEdit: canEdit));
//   }
//
//   // void set setPhone(String newPhone) {
//   //   if (_canEdit) {
//   //     _phone = newPhone;
//   //     emit(EditPhoneInitial());
//   //   }
//   // }
//   void setPhone({required BuildContext context,required String newPhone}) {
//     if (_canEdit) {
//       try{
//         _phone = newPhone;
//         setPhoneCurrentUser(context:context,newPhone: _phone);
//         emit(SuccessEditPhoneState());
//       }on DioException catch (exception) {
//         ApiServices messageErrorServer = ApiServices();
//         String messageError = messageErrorServer.handelDioException(exception: exception);
//         emit(ErrorEditPhoneState());
//         print("------------------ Error --------------: $messageError");
//       }
//     }
//   }
//
//
//
//   String? get getPhone => _phone;
// }
