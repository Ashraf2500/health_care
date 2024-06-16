import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../../../../../../features_exports.dart';

part 'edit_photo_state.dart';

class EditPhotoCubit extends Cubit<EditPhotoState> {
  EditPhotoCubit() : super(EditPhotoInitial());

  XFile? image; // Change the type to XFile

  Future<void> takeImage({required BuildContext context, required ImageSource imageSource}) async {
    try {
      emit(LoadingEditPhotoState());
      final img = await ImagePicker().pickImage(source: imageSource);
      if (img == null) {
        return;
      }

      final File imageFile = File(img.path);
      final XFile xFile = XFile(imageFile.path); // Convert File to XFile

      final imagePermanently = await saveImagePermanently(imagePath: img.path);
      image = xFile;

      context.read<EditGeneralInfoCubit>().setAvatar = image;
      Navigator.pop(context);
      emit(SuccessEditPhotoState(image: image!));
    } on PlatformException catch (e) {
      showSnackbar(context: context, message: "Failed to take pictures, try again", backGroundColor: ColorHelper.redColor);
      emit(ErrorEditPhotoState());
    }
  }

  Future<File> saveImagePermanently({required String imagePath}) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final img = File('${directory.path}/$name');
    return File(imagePath).copy(img.path);
  }
}

// class EditPhotoCubit extends Cubit<EditPhotoState> {
//   EditPhotoCubit() : super(EditPhotoInitial());
//
//   File? image ;
//
//   Future takeImage({required BuildContext context, required ImageSource imageSource})async{
//     try{
//       emit(LoadingEditPhotoState());
//       final img = await ImagePicker().pickImage(source: imageSource);
//       if (img == null) {return;}
//
//       //File imageTemporary = File(img!.path);
//       File imagePermanently = await saveImagePermanently(imagePath: img.path);
//       image = imagePermanently ;
//
//       context.read<EditGeneralInfoCubit>().setAvatar = image;
//       Navigator.pop(context);
//       emit(SuccessEditPhotoState(image: image!));
//     } on PlatformException catch (e) {
//       showSnackbar(context: context, message: "Failed to take pictures, try again", backGroundColor:ColorHelper.redColor);
//     }
//     emit(ErrorEditPhotoState());
//   }
//
//   Future<File> saveImagePermanently({required String imagePath})async{
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final img = File('${directory.path}/$name');
//     return File(imagePath).copy(img.path);
//   }
//
// }
