import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:health_care/features/main_screen/pages/home/data/repo/create_appointment_repo.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit() : super(CreateAppointmentInitial());

  final GlobalKey<FormState> createAppointmentFormKey = GlobalKey<FormState>();


  String? nameValidation(value) {
    if (value.isEmpty) {
      return 'name is required !';
    }
    else if (value.length <4) {
      return 'name must be more than 3 letters !';
    }
    return null;
  }
  String? phoneValidation(value) {
    if (value!.isEmpty) {
      return 'Phone is required !';
    } else if (value.length != 11) {
      return 'The phone must be 11 numbers !';
    }
    return null;
  }
  String? ageValidation(value) {
    if (value!.isEmpty) {
      return 'Age is required !';
    }
    return null;
  }
  String? cityValidation(value) {
    if (value!.isEmpty) {
      return 'City is required !';
    }
    else if (value.length <4) {
      return 'City must be more than 3 letters !';
    }
    return null;
  }

  List<String> days = [];

  DateTime? dateTimeInt ;

  String dateAppointment="";
  PopularDoctorsData? doctorsData;

  void setDays({required List<String> listOfDays}){
    days = listOfDays ;
  }

  void setDateInt({required DateTime dateInt}){
    dateTimeInt = dateInt ;
  }


  void setDate({required String date}){
    dateAppointment =date ;
  }

  void setDoctorsData({required PopularDoctorsData? dataOfDoctor}){
    doctorsData = dataOfDoctor ;

  }

  void createAppointment({required BuildContext context,required String fullName,required String phone, required String age , required String city ,  required String description ,required int gender, required String photos }) {

    if (createAppointmentFormKey.currentState!.validate()) {
      _createAppointment(context:context,fullName: fullName, phone: phone,age: age,city: city,description: description ,gender: gender,photos: photos  );
    }

  }

  void _createAppointment({required BuildContext context,required String fullName,required String phone, required String age , required String city ,  required String description ,required int gender, required String photos}) async{
    try{
      emit(LoadingCreateAppointmentState());
      print("create Account Loading");
      CurrentUserDataCubit userData = context.read<CurrentUserDataCubit>();


      await createAppointmentRepo(
          id: userData.currentUserId??"",
          name: fullName,
          phone: phone,
          age: int.parse(age),
          sex: gender,
          city: "$city \t\t\t\t\t\t\t\t\t",
          description: "$description \t\t\t\t\t\t\t\t\t",
          photos: "",
          ownerId:userData.currentUserId??"",
          doctorId:  doctorsData?.id??"",
          department: doctorsData?.speciality??0,
          appDate:dateAppointment

      );
      emit(SuccessCreateAppointmentState());
      print("create Account Success");
      awesomeDialog(
          context: context ,
          message:  "Success Booking" ,
          okOnPress:() {
            Navigator.pop(context);
            Navigator.pop(context);
            context.read<PatientScheduleCubit>().getUerAppointments(context: context );
          }
      );
    }on DioException catch (exception) {
      ApiServices messageErrorServer = ApiServices();
      String messageError = messageErrorServer.handelDioException(exception: exception);
      showSnackbar(context:context,message: messageError, backGroundColor: ColorHelper.redColor.shade500);
      emit(ErrorCreateAppointmentState(messageError: messageError));

    }
  }

}
