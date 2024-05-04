import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_type_state.dart';


enum UserTypeData { doctor , patient , admin }

class UserTypeCubit extends Cubit<UserTypeState> {
  UserTypeData? userType ;
  UserTypeCubit() : super(UserTypeInitial());

  void chooseUserType({required UserTypeData type}){
    userType = type;
    emit(ChooseUserTypeState());
  }

}
