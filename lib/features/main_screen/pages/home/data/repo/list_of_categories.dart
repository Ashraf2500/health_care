import 'package:health_care/features/features_exports.dart';

Map<String,List<Category>>AllCategories = {
  StringsApp.patientUser :[
    Category(
      label: "History",
      image: ImageHelper.compete_report,
    ),
    Category(
      label: "Reports",
      image: ImageHelper.reportIcon,
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
      label: "Schedule",
      image: ImageHelper.schedule_category,
    ),
    Category(
      label: "History",
      image: ImageHelper.compete_report,
    ),
    Category(
      label: "Reports",
      image: ImageHelper.reportIcon,
    ),
    Category(
      label: "Test X-ray",
      image: ImageHelper.testXRayIcon,
    ),
    Category(
      label: "Chat-bot",
      image: ImageHelper.chatBotIcon,
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
