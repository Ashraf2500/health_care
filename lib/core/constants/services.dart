import 'package:dio/dio.dart';



class ApiServices {
  final _dio = Dio(
    BaseOptions(baseUrl: "https://graduation-9a7o.onrender.com"),
  );
  Dio get getDio =>  _dio;

  static const String authorization ="13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595";



  String connectionErrorMessage ="There is no internet , make sure your connection !";
  String badResponseMessage ="There is a problem, try again !";
  String cancelErrorMessage ="your process cancelled!";
  String statusCode404Message ="Your request not found, try again later !";
  String statusCode500Message ="Internal Server error, try again later !'";
  String statusCode401Message ="sorry ! , you must login again !";
  String otherErrorMessage ="There is a problem, try again later !";

  String handelDioException({required DioException exception}) {
    if (exception.type == DioExceptionType.connectionError) {
      return connectionErrorMessage;
    }
    if (exception.type == DioExceptionType.badResponse) {
      return badResponseMessage;
    }
    if (exception.type == DioExceptionType.cancel) {
      return cancelErrorMessage;
    }
    if (exception.response?.statusCode == 404) {
      return statusCode404Message;
    }
    if (exception.response?.statusCode == 500) {
      return statusCode500Message;
    }
    if (exception.response?.statusCode == 401) {
      return statusCode401Message;
    }
    return otherErrorMessage;
  }















  Future<void> login({required String phone,required  String password})async{
    try{
      Response response = await _dio.post(
        '/login',
        data: {
          'phone': phone,
          'pass': password,
        },
      );

      print(response);
    }catch(e){
      print("error");
    }
  }
  Future<void> createUser({required String name ,required String phone,required  String password})async{
    try{
      Response response = await _dio.post(
        '/users',
        data: {
          'name': name,
          'phone': phone,
          'pass': password,

        },

        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }
  Future<void> createDoctor({
    required String name ,
    required String phone,
    required  String password,
    required int speciality,
    required String experiment,

  })async{
    try{
      Response response = await _dio.post(
        '/doctors',
        data: {
          'name': name,
          'phone': phone,
          'pass': password,
          'speciality':speciality,
          'expertment':experiment

        },

        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }

  Future<void> createAdmin({
    required String name ,
    required String phone,
    required  String password,
    required  String avatar,
  })async{
    try{
      Response response = await _dio.post(
        '/admins',
        data: {
          "name":name,
          "phone": phone,
          "pass": password,
          "avatar": avatar,

        },

        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }

  Future<void> getAllUsers()async{
    try{
      Response response = await _dio.get(
        '/users',
        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }
  Future<void> getAllDoctors()async{
    try{
      Response response = await _dio.get(
        '/doctors',
        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }
  Future<void> getAllAdmins()async{
    try{
      Response response = await _dio.get(
        '/admins',
        options: Options(headers: {
          "authorization": "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595",
        }),
      );


      print(response);
    }catch(e){
      print("error");
    }
  }





}
// void main (){
//
//
//   //ApiServices().login(phone: "01014563769", password: "456456");
//   // ApiServices().createUser(name: "Ahmed",phone: "33333333333", password: "456456");
//   // ApiServices().createDoctor(name: "Ashraf Hatem",phone: "22222222222", password: "456456",speciality: 1,experiment: "2 years");
//   // ApiServices().createAdmin(name: "Ashraf Hatem",phone: "01033333332", password: "456456",avatar: "avatar");
//   // ApiServices().getAllUsers();
//   // ApiServices().getAllDoctors();
//   // ApiServices().getAllAdmins();
//
//
//
// }

// //{{auth}} authorization