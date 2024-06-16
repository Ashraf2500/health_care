import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitial());

  Future<void> deleteUser({required BuildContext context,required String? userId})async{
    try{
      emit(LoadingDeleteUserState());

      await deleteUserRepo(userId: userId);

      emit(SuccessDeleteUserState());
      awesomeDialog(
          context: context ,
          message:  "Success Deleting" ,
          okOnPress:() {
            context.read<GetAllPatientsCubit>().getAllPatient(context: context);
          }
      );


    }on DioException catch(exception){
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      emit(ErrorDeleteUserState(messageError: messageError));
      showSnackbar(context: context, message: messageError, backGroundColor: ColorHelper.redColor);
    }
  }

}
