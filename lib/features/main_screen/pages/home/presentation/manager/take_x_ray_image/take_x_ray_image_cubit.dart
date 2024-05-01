import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:health_care/core/core_exports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'take_x_ray_image_state.dart';

class TakeXRayImageCubit extends Cubit<TakeXRayImageState> {
  TakeXRayImageCubit() : super(TakeXRayImageInitial());

  File? image ;

  Future takeImage({required BuildContext context, required ImageSource imageSource})async{
    try{
      emit(LoadingTakeImageXRayState());
      final img = await ImagePicker().pickImage(source: imageSource);
      if (img == null) {return;}

      //File imageTemporary = File(img!.path);
      File imagePermanently = await saveImagePermanently(imagePath: img.path);
      image = imagePermanently ;
      emit(SuccessTakeImageXRayState(image: image!));
    } on PlatformException catch (e) {
      showSnackbar(context: context, message: "Failed to take pictures, try again", backGroundColor:ColorHelper.redColor);
    }
    emit(ErrorTakeImageXRayState());
  }

  Future<File> saveImagePermanently({required String imagePath})async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final img = File('${directory.path}/$name');
    return File(imagePath).copy(img.path);
  }
}
