
class PatientReportsModel {
  PatientReportsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PatientReportData> data;

  factory PatientReportsModel.fromJson(Map<String, dynamic> json){
    return PatientReportsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PatientReportData>.from(json["data"]!.map((x) => PatientReportData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PatientReportData {
  PatientReportData({
    required this.id,
    required this.doctorId,
    required this.appointmentId,
    required this.userId,
    required this.diagnosis,
    required this.reasons,
    required this.advices,
    required this.medicines,
    required this.treatments,
    required this.createdAt,
    required this.doctor,
    required this.user,
    required this.appointment,
  });

  final String? id;
  final String? doctorId;
  final String? appointmentId;
  final String? userId;
  final String? diagnosis;
  final String? reasons;
  final String? advices;
  final String? medicines;
  final String? treatments;
  final DateTime? createdAt;
  final PatientReportsDoctor? doctor;
  final PatientReportsUser? user;
  final PatientReportsAppointment? appointment;

  factory PatientReportData.fromJson(Map<String, dynamic> json){
    return PatientReportData(
      id: json["id"],
      doctorId: json["doctor_id"],
      appointmentId: json["appointment_id"],
      userId: json["user_id"],
      diagnosis: json["diagnosis"],
      reasons: json["reasons"],
      advices: json["advices"],
      medicines: json["medicines"],
      treatments: json["treatments"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      doctor: json["doctor"] == null ? null : PatientReportsDoctor.fromJson(json["doctor"]),
      user: json["user"] == null ? null : PatientReportsUser.fromJson(json["user"]),
      appointment: json["appointment"] == null ? null : PatientReportsAppointment.fromJson(json["appointment"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "appointment_id": appointmentId,
    "user_id": userId,
    "diagnosis": diagnosis,
    "reasons": reasons,
    "advices": advices,
    "medicines": medicines,
    "treatments": treatments,
    "created_at": createdAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
    "user": user?.toJson(),
    "appointment": appointment?.toJson(),
  };

}

class PatientReportsAppointment {
  PatientReportsAppointment({
    required this.id,
    required this.name,
    required this.phone,
    required this.age,
    required this.sex,
    required this.city,
    required this.description,
    required this.photos,
    required this.ownerId,
    required this.doctorId,
    required this.department,
    required this.appDate,
    required this.completed,
    required this.createdAt,
  });

  final String? id;
  final String? name;
  final String? phone;
  final int? age;
  final int? sex;
  final String? city;
  final String? description;
  final String? photos;
  final String? ownerId;
  final String? doctorId;
  final int? department;
  final String? appDate;
  final int? completed;
  final DateTime? createdAt;

  factory PatientReportsAppointment.fromJson(Map<String, dynamic> json){
    return PatientReportsAppointment(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      age: json["age"],
      sex: json["sex"],
      city: json["city"],
      description: json["description"],
      photos: json["photos"],
      ownerId: json["owner_id"],
      doctorId: json["doctor_id"],
      department: json["department"],
      appDate: json["app_date"],
      completed: json["completed"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "age": age,
    "sex": sex,
    "city": city,
    "description": description,
    "photos": photos,
    "owner_id": ownerId,
    "doctor_id": doctorId,
    "department": department,
    "app_date": appDate,
    "completed": completed,
    "created_at": createdAt?.toIso8601String(),
  };

}

class PatientReportsDoctor {
  PatientReportsDoctor({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.speciality,
    required this.expertment,
    required this.defaultPatientTime,
    required this.createdAt,
    required this.ratings,
    required this.ratingPoints,
    required this.rating,
  });

  final String? id;
  final String? name;
  final String? phone;
  final dynamic avatar;
  final int? speciality;
  final String? expertment;
  final int? defaultPatientTime;
  final DateTime? createdAt;
  final List<dynamic> ratings;
  final int? ratingPoints;
  final int? rating;

  factory PatientReportsDoctor.fromJson(Map<String, dynamic> json){
    return PatientReportsDoctor(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      speciality: json["speciality"],
      expertment: json["expertment"],
      defaultPatientTime: json["default_patient_time"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<dynamic>.from(json["ratings"]!.map((x) => x)),
      ratingPoints: json["ratingPoints"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "speciality": speciality,
    "expertment": expertment,
    "default_patient_time": defaultPatientTime,
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x).toList(),
    "ratingPoints": ratingPoints,
    "rating": rating,
  };

}

class PatientReportsUser {
  PatientReportsUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.createdAt,
    required this.ratings,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? avatar;
  final DateTime? createdAt;
  final List<dynamic> ratings;

  factory PatientReportsUser.fromJson(Map<String, dynamic> json){
    return PatientReportsUser(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<dynamic>.from(json["ratings"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x).toList(),
  };

}

/*
{
	"message": "success",
	"data": [
		{
			"id": "3427135734974",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041524177",
			"user_id": "3423692303179",
			"diagnosis": "New diagnisis ne",
			"reasons": "reasons",
			"advices": "New Advice\n",
			"medicines": "{\"medicines\":[{\"medicineName\":\"medicine 1\",\"medicineDate\":\"date 1\"}, {\"medicineName\":\"medicine 2\",\"medicineDate\":\"date 2\"}, {\"medicineName\":\"medicine 3\",\"medicineDate\":\"date 3\"}, {\"medicineName\":\"medicine 4\",\"medicineDate\":\"date 4\"}, {\"medicineName\":\"medicine 5\",\"medicineDate\":\"date 5\"}]}",
			"treatments": " ",
			"created_at": "2024-06-07T00:08:55.000Z",
			"doctor": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"ratings": [],
				"ratingPoints": 0,
				"rating": 0
			},
			"user": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appointment": {
				"id": "3427041524177",
				"name": "today b",
				"phone": "01014563548",
				"age": 25,
				"sex": 1,
				"city": "sghcssr \t\t\t\t\t\t\t\t\t",
				"description": "fj7tfbiu \t\t\t\t\t\t\t\t\t",
				"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
				"owner_id": "3423692303179",
				"doctor_id": "3426937860434",
				"department": 1,
				"app_date": "2024-06-06",
				"completed": 1,
				"created_at": "2024-06-05T21:58:44.000Z"
			}
		},
		{
			"id": "3427145562244",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041524177",
			"user_id": "3423692303179",
			"diagnosis": "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab",
			"reasons": "reasons",
			"advices": "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better",
			"medicines": "{\"medicines\":[{\"medicineName\":\"Azithromycim\",\"medicineDate\":\"1 after breakfast\"}, {\"medicineName\":\"Clarithromycin\",\"medicineDate\":\"1 every 2h\"}, {\"medicineName\":\"Doxycycline\",\"medicineDate\":\"1 every 12h\"}]}",
			"treatments": " ",
			"created_at": "2024-06-07T02:52:42.000Z",
			"doctor": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"ratings": [],
				"ratingPoints": 0,
				"rating": 0
			},
			"user": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appointment": {
				"id": "3427041524177",
				"name": "today b",
				"phone": "01014563548",
				"age": 25,
				"sex": 1,
				"city": "sghcssr \t\t\t\t\t\t\t\t\t",
				"description": "fj7tfbiu \t\t\t\t\t\t\t\t\t",
				"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
				"owner_id": "3423692303179",
				"doctor_id": "3426937860434",
				"department": 1,
				"app_date": "2024-06-06",
				"completed": 1,
				"created_at": "2024-06-05T21:58:44.000Z"
			}
		},
		{
			"id": "3427321132981",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041524177",
			"user_id": "3423692303179",
			"diagnosis": "Server",
			"reasons": "reasons",
			"advices": "HATEM\n",
			"medicines": "{\"medicines\":[{\"medicineName\":\"med 1\",\"medicineDate\":\"12\"}]}",
			"treatments": " ",
			"created_at": "2024-06-09T03:38:53.000Z",
			"doctor": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"ratings": [],
				"ratingPoints": 0,
				"rating": 0
			},
			"user": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appointment": {
				"id": "3427041524177",
				"name": "today b",
				"phone": "01014563548",
				"age": 25,
				"sex": 1,
				"city": "sghcssr \t\t\t\t\t\t\t\t\t",
				"description": "fj7tfbiu \t\t\t\t\t\t\t\t\t",
				"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
				"owner_id": "3423692303179",
				"doctor_id": "3426937860434",
				"department": 1,
				"app_date": "2024-06-06",
				"completed": 1,
				"created_at": "2024-06-05T21:58:44.000Z"
			}
		}
	]
}*/

/*

class PatientReportsModel {
  PatientReportsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PatientReportData> data;

  factory PatientReportsModel.fromJson(Map<String, dynamic> json){
    return PatientReportsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PatientReportData>.from(json["data"]!.map((x) => PatientReportData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PatientReportData {
  PatientReportData({
    required this.id,
    required this.doctorId,
    required this.appointmentId,
    required this.userId,
    required this.diagnosis,
    required this.reasons,
    required this.advices,
    required this.medicines,
    required this.treatments,
    required this.createdAt,
  });

  final String? id;
  final String? doctorId;
  final String? appointmentId;
  final String? userId;
  final String? diagnosis;
  final String? reasons;
  final String? advices;
  final String? medicines;
  final String? treatments;
  final DateTime? createdAt;

  factory PatientReportData.fromJson(Map<String, dynamic> json){
    return PatientReportData(
      id: json["id"],
      doctorId: json["doctor_id"],
      appointmentId: json["appointment_id"],
      userId: json["user_id"],
      diagnosis: json["diagnosis"],
      reasons: json["reasons"],
      advices: json["advices"],
      medicines: json["medicines"],
      treatments: json["treatments"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "appointment_id": appointmentId,
    "user_id": userId,
    "diagnosis": diagnosis,
    "reasons": reasons,
    "advices": advices,
    "medicines": medicines,
    "treatments": treatments,
    "created_at": createdAt?.toIso8601String(),
  };

}


*/
/*
{
	"message": "success",
	"data": [
		{
			"id": "3427057870745",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041429912",
			"user_id": "3423692303179",
			"diagnosis": "Common cold",
			"reasons": "Persistent cough and runny nose",
			"advices": "Get plenty of rest and stay hydrated",
			"medicines": "Ibuprofen, Cough syrup",
			"treatments": "Bed rest, Warm fluids",
			"created_at": "2024-06-06T02:31:11.000Z"
		},
		{
			"id": "3427064899540",
			"doctor_id": "3426937860434",
			"appointment_id": "3427045322705",
			"user_id": "3423692303179",
			"diagnosis": "MOHAMED SALAG\n",
			"reasons": "reasons",
			"advices": "Ahmed salah\n",
			"medicines": "[Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel', Instance of 'MedicineModel']",
			"treatments": " ",
			"created_at": "2024-06-06T04:28:20.000Z"
		},
		{
			"id": "3427095535530",
			"doctor_id": "3426937860434",
			"appointment_id": "3427055742860",
			"user_id": "3423692303179",
			"diagnosis": "A—----------a\n",
			"reasons": "reasons",
			"advices": "B________b",
			"medicines": "[Instance of 'MedicineModel', Instance of 'MedicineModel']",
			"treatments": " ",
			"created_at": "2024-06-06T12:58:55.000Z"
		},
		{
			"id": "3427099492063",
			"doctor_id": "3426937860434",
			"appointment_id": "3427055742860",
			"user_id": "3423692303179",
			"diagnosis": "MOHEMD HAS KORONA\nAHMED\n",
			"reasons": "reasons",
			"advices": "SALEM\n",
			"medicines": "[Instance of 'MedicineModel', Instance of 'MedicineModel']",
			"treatments": " ",
			"created_at": "2024-06-06T14:04:52.000Z"
		},
		{
			"id": "3427099853108",
			"doctor_id": "3426937860434",
			"appointment_id": "3427055742860",
			"user_id": "3423692303179",
			"diagnosis": "Salim asry",
			"reasons": "reasons",
			"advices": "Aduoyer\n\n",
			"medicines": "[Instance of 'MedicineModel', Instance of 'MedicineModel']",
			"treatments": " ",
			"created_at": "2024-06-06T14:10:53.000Z"
		},
		{
			"id": "3427133449340",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041490956",
			"user_id": "3423692303179",
			"diagnosis": "Diagnisis A",
			"reasons": "reasons",
			"advices": "ADVICE",
			"medicines": "{medicines\":[{\"medicineName\":\"med1\",\"medicineDate\":\"date1\"}, {\"medicineName\":\"med2\",\"medicineDate\":\"date2\"}, {\"medicineName\":\"med3\",\"medicineDate\":\"date3\"}]}",
			"treatments": " ",
			"created_at": "2024-06-06T23:30:49.000Z"
		},
		{
			"id": "3427135734974",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041524177",
			"user_id": "3423692303179",
			"diagnosis": "New diagnisis ne",
			"reasons": "reasons",
			"advices": "New Advice\n",
			"medicines": "{\"medicines\":[{\"medicineName\":\"medicine 1\",\"medicineDate\":\"date 1\"}, {\"medicineName\":\"medicine 2\",\"medicineDate\":\"date 2\"}, {\"medicineName\":\"medicine 3\",\"medicineDate\":\"date 3\"}, {\"medicineName\":\"medicine 4\",\"medicineDate\":\"date 4\"}, {\"medicineName\":\"medicine 5\",\"medicineDate\":\"date 5\"}]}",
			"treatments": " ",
			"created_at": "2024-06-07T00:08:55.000Z"
		},
		{
			"id": "3427145562244",
			"doctor_id": "3426937860434",
			"appointment_id": "3427041524177",
			"user_id": "3423692303179",
			"diagnosis": "The diagnostic results indicate that the patient has pneumonia, which is possible that the patient is infected with the Covid-19 virus, so the patient must do a Covid-19 swab",
			"reasons": "reasons",
			"advices": "Complete rest throughout the day and do not do any effort until you recover.Drink plenty of fluids to help thin the mucus.Quit smoking and avoid passive smoking.Lie down with your head and back elevated to help you breathe better",
			"medicines": "{\"medicines\":[{\"medicineName\":\"Azithromycim\",\"medicineDate\":\"1 after breakfast\"}, {\"medicineName\":\"Clarithromycin\",\"medicineDate\":\"1 every 2h\"}, {\"medicineName\":\"Doxycycline\",\"medicineDate\":\"1 every 12h\"}]}",
			"treatments": " ",
			"created_at": "2024-06-07T02:52:42.000Z"
		}
	]
}*//*



*/
