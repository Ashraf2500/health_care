import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';


enum UserType { doctor , patient , admin }

class UserCubit extends Cubit<UserState> {
  UserType? userType ;
  UserCubit() : super(UserInitial());

  void chooseUserType({required UserType type}){
    userType = type;
    emit(ChooseUserState());
  }

}
