import 'dart:ui';

import 'package:health_care/features/features_exports.dart';

List<Category> listOfCategories = [
  Category(
      label: "Doctors",
      image: ImageHelper.doctorsIcon,
      userIsPatient: true,
      userIsDoctor: false,
      userIsAdmin: true,
  ),
  Category(
      label: "History",
      image: ImageHelper.historyIcon,
      userIsPatient: true,
      userIsDoctor: true,
      userIsAdmin: false
  ),
  Category(
      label: "Chatbot",
      image: ImageHelper.chatBotIcon,
      userIsPatient: true,
      userIsDoctor: true,
      userIsAdmin: false
  ),
  Category(
      label: "Test X-ray",
      image: ImageHelper.testXRayIcon,
      userIsPatient: false,
      userIsDoctor: true,
      userIsAdmin: false
  ),
  Category(
      label: "Patients",
      image: ImageHelper.patientsIcon,
      userIsPatient: false,
      userIsDoctor: false,
      userIsAdmin: true,
  ),
  Category(
      label: "Add Doctor",
      image: ImageHelper.doctorIcon,
      userIsPatient: false,
      userIsDoctor: false,
      userIsAdmin: true,
  ),

];
