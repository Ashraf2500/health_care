
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'private_chat_state.dart';

class PrivateChatCubit extends Cubit<PrivateChatState> {
  PrivateChatCubit() : super(PrivateChatInitial());
  final ScrollController listScrollController = ScrollController();
  void GetAllPrivateChat({required BuildContext context , required String? destinationId})async{
    try{
      List<PrivateChatData>  allPrivateChats =[];

      emit(LoadingPrivateChatState());

      List<PrivateChatData>  lostOfPrivateChats = await getAllPrivateChatRepo(destinationId: destinationId);
      allPrivateChats = lostOfPrivateChats ;

      emit(SuccessPrivateChatState(listOfPrivateChatData: lostOfPrivateChats));


    }on DioException catch (exception) {
      print("$exception");
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorPrivateChatState(messageError: messageError));
    }
  }

  void scrollListToEnd (){
    listScrollController.animateTo(
      listScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds:10),
      curve: Curves.easeOut,
    );
  }


}
