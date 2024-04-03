
import 'package:health_care/features/features_exports.dart';

List<AppointmentModel> todayAppointmentsPatients =[
  AppointmentModel(name: "Ahmed Ali", image: ImageHelper.person11,phone: "01023014472", date: "today", time: "8:00 - 9:00 AM",),
  AppointmentModel(name: "Ibrahim Ahmed", image: ImageHelper.person17,phone: "01265239756", date: "today", time: "4:00 - 5:00 PM" ,),
  AppointmentModel(name: "Omar Mohamed", image:ImageHelper.person12,phone:"01022994635", date: "today", time: "9:30 - 11:00 AM",),
  AppointmentModel(name: "Nada Khalid", image: ImageHelper.person13,phone: "01224054340", date: "today", time: "11:30 - 12:00 PM",),
  AppointmentModel(name: "Osama Wael", image: ImageHelper.person14,phone: "01168453459", date: "today", time: "1:00 - 2:00 PM",),
  AppointmentModel(name: "Hossam Wael", image: ImageHelper.person16,phone: "01066345291",date:"today",time: "5:00 - 6:00 PM",),

];

List<AppointmentModel> availableAppointmentsDoctors =[
  AppointmentModel(
    name: "Dr.Nada Mohamed",
    specialist: "Heart specialist",
    image: "${ImageHelper.doctor_11}",
      date: "Wed, 24 January",
      time: "10:00 - 12:00 AM"

  ),
  AppointmentModel(
    name: "Dr.Ashraf Mohamed",
    specialist: "Eyes specialist",
    image: "${ImageHelper.doctor_13}",
      date: "Mon, 03 February",
      time: "3:00 - 5:00 AM"
  ),
  AppointmentModel(
    name: "Dr.Mary Ibrahim",
    specialist: "Internal medicine specialist",
    image: "${ImageHelper.doctor_14}",
      date: "Thu, 15 March",
      time: "6:30 - 8:30 AM"

  ),
  AppointmentModel(
    name: "Dr.Roaa Hamed",
    specialist: "Bone Specialist",
    image: "${ImageHelper.doctor_15}",
      date: "Sat, 20 April",
      time: "9:45 - 11:45 AM"

  ),

  AppointmentModel(
    name: "Dr.Ibrahim Mohamed",
    specialist: "Mohamed Morad",
    image: "${ImageHelper.doctor_16}",
      date: "Tue, 14 November",
      time: "1:15 - 3:15 PM"
  ),
  AppointmentModel(
    name: "Dr.Radwa Emad",
    specialist: "Dentist Specialist",
    image: "${ImageHelper.doctor_17}",
      date: "Fri, 09 June",
      time: "4:30 - 6:30 PM"
  ),
  AppointmentModel(
    name: "Dr.Emad Ahmed",
    specialist: "Eyes specialist",
    image: "${ImageHelper.doctor_18}",
      date: "Tue, 22 August",
      time: "7:00 - 9:00 PM"

  ),
  AppointmentModel(
    name: "Dr.Youssef Emad",
    specialist: "Bone Specialist",
    image: "${ImageHelper.doctor_20}",
    date: "Wed, 24 January",
    time: "11:00 PM - 1:00 AM"
  ),


];