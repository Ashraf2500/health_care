

import 'package:dio/dio.dart';
import 'package:health_care/features/features_exports.dart';


Future<void> createAppointmentRepo({
  required String doctorId,
  required String id,
  required String name,
  required String phone,
  required int age,
  required int sex,
  required String city,
  required String description,
  required String photos,
  required String ownerId,
  required int department,
  required String appDate,
})async{
  Response response = await ApiServices.dio.post(
    '/appointments/$doctorId',
    data: {
      "id":id,
      "name": name,
      "phone": phone,
      "age": 25,
      "sex": 1,
      "city": city,
      "description": description,
      "photos":"[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
      "owner_id": ownerId,
      "doctor_id": doctorId,
      "department": department,
      "app_date": appDate
    },
    options: Options(
      headers: {
        'Authorization': '${ApiServices.token}',
      },
    ),
  );

  print(ApiServices.token);
  print(response);



}


// void main ()async{
//
//   await createAppointmentRepo(
//       id: "3423107228712",
//       name: "Ayman Ibrahim",
//       phone: "01014563769",
//       age: 25,
//       sex: 1,
//       city: "New York",
//       description: "Patient with a history of allergies",
//       photos: "",
//       ownerId: "3423107228712",
//       doctorId: "3423108002482",
//       department: 0,
//       appDate:"2024-06-03"
//       );
// }