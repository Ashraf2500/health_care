import 'package:health_care/features/features_exports.dart';

Map<String,List<Category>>AllCategories = {
  StringsApp.patientUser :[
    Category(
      label: "History",
      image: ImageHelper.historyIcon,
    ),
    Category(
      label: "Doctors",
      image: ImageHelper.doctorsIcon,
    ),
    Category(
      label: "Chat-bot",
      image: ImageHelper.chatBotIcon,
    ),
    Category(
      label: "Test X-ray",
      image: ImageHelper.testXRayIcon,
    ),
  ],

  //---------------------------------------
  StringsApp.doctorUser :[
    Category(
      label: "History",
      image: ImageHelper.historyIcon,
    ),
    Category(
      label: "Chat-bot",
      image: ImageHelper.chatBotIcon,
    ),
    Category(
      label: "Test X-ray",
      image: ImageHelper.testXRayIcon,
    ),
  ],

  //----------------------------------------
  StringsApp.adminUser :[
    Category(
      label: "Doctors",
      image: ImageHelper.doctorsIcon,
    ),
    Category(
      label: "Patients",
      image: ImageHelper.patientsIcon,
    ),
    Category(
      label: "Add Doctor",
      image: ImageHelper.doctorIcon,
    ),
  ],
};

// List<Category> listOfCategories = [
//   Category(
//       label: "Doctors",
//       image: ImageHelper.doctorsIcon,
//   ),
//   Category(
//       label: "History",
//       image: ImageHelper.historyIcon,
//   ),
//   Category(
//       label: "Chat-bot",
//       image: ImageHelper.chatBotIcon,
//   ),
//   Category(
//       label: "Test X-ray",
//       image: ImageHelper.testXRayIcon,
//   ),
//   Category(
//       label: "Patients",
//       image: ImageHelper.patientsIcon,
//   ),
//   Category(
//       label: "Add Doctor",
//       image: ImageHelper.doctorIcon,
//   ),
//
// ];
