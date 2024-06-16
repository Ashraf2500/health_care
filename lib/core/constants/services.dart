import 'package:dio/dio.dart';



class ApiServices {
  static final dio = Dio(
    BaseOptions(baseUrl: "https://graduation-9a7o.onrender.com"),
  );

  //Dio get getDio =>  dio;

  static const String authorization = "13cc665abb3b9d8a07e3211208e3a5a2c6106baa0c2354487a785fc6ef2be1219f4a042ea822fe4087bd4fd9a2614595";
  static String? token;


  String connectionErrorMessage = "There is no internet , make sure your connection !";
  String badResponseMessage = "There is a problem, try again !";
  String cancelErrorMessage = "your process cancelled!";
  String statusCode404Message = "Your request not found, try again later !";
  String statusCode500Message = "Internal Server error, try again later !'";
  String statusCode401Message = "sorry ! , you must login again !";
  String otherErrorMessage = "There is a problem, try again later !";

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


}