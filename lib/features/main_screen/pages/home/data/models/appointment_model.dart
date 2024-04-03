import 'package:flutter/material.dart';

class AppointmentModel {
  String name;
  String image;
  String? phone;
  String? specialist;
  String date;
  String time;

  AppointmentModel({
   required this.name,
    required this.image,
   required this.date,
   required this.time,
    this.phone,
    this.specialist,
  });
}
