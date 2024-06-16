import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'profile_chat_state.dart';

class ProfileChatCubit extends Cubit<ProfileChatState> {
  ProfileChatCubit() : super(ProfileChatInitial());

  void getAllProfileChat({required BuildContext context  })async{
    try{
      List<AllProfileChatData>  allProfileChats =[];

      emit(LoadingProfileChatState());

      List<AllProfileChatData>  lostOfProfileChats = await getAllProfileChatRepo();
      allProfileChats = lostOfProfileChats ;

      List<AllProfileChatData>  lostOfChats = checkSourceId(context: context, lostOfProfileChats: lostOfProfileChats);
      emit(SuccessProfileChatState(listOfProfileChatData: lostOfChats));


    }on DioException catch (exception) {
      print("$exception");
      print("$exception");
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorProfileChatState(messageError: messageError));
    }
  }

  List<AllProfileChatData> checkSourceId({required BuildContext context,required List<AllProfileChatData>  lostOfProfileChats}){
     List<AllProfileChatData>  lostChats = [];
     CurrentUserDataCubit _userType = context.read<CurrentUserDataCubit>();
     for(int i=0 ; i< lostOfProfileChats.length ; i++ ){
        if(_userType.currentUserId == lostOfProfileChats[i].source?.id){
          lostChats.add(lostOfProfileChats[i]);
        }
     }
     return lostChats ;
  }

}
