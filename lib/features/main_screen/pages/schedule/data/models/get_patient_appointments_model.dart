class GetPatientAppointmentsModel {
  GetPatientAppointmentsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PatientAppointmentData> data;

  factory GetPatientAppointmentsModel.fromJson(Map<String, dynamic> json){
    return GetPatientAppointmentsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PatientAppointmentData>.from(json["data"]!.map((x) => PatientAppointmentData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PatientAppointmentData {
  PatientAppointmentData({
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
    required this.owner,
    required this.doctor,
    required this.appDateTimestamp,
    required this.appCreateTimestamp,
    required this.turn,
    required this.turnNow,
    required this.turnLeft,
    required this.turnLeftDuration,
    required this.turnLeftDurationString,
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
  final OwnerAppointmentOfPatient? owner;
  final DoctorAppointmentOfPatient? doctor;
  final int? appDateTimestamp;
  final int? appCreateTimestamp;
  final int? turn;
  final int? turnNow;
  final int? turnLeft;
  final int? turnLeftDuration;
  final String? turnLeftDurationString;

  factory PatientAppointmentData.fromJson(Map<String, dynamic> json){
    return PatientAppointmentData(
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
      owner: json["owner"] == null ? null : OwnerAppointmentOfPatient.fromJson(json["owner"]),
      doctor: json["doctor"] == null ? null : DoctorAppointmentOfPatient.fromJson(json["doctor"]),
      appDateTimestamp: json["appDateTimestamp"],
      appCreateTimestamp: json["appCreateTimestamp"],
      turn: json["turn"],
      turnNow: json["turnNow"],
      turnLeft: json["turnLeft"],
      turnLeftDuration: json["turnLeftDuration"],
      turnLeftDurationString: json["turnLeftDurationString"],
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
    "owner": owner?.toJson(),
    "doctor": doctor?.toJson(),
    "appDateTimestamp": appDateTimestamp,
    "appCreateTimestamp": appCreateTimestamp,
    "turn": turn,
    "turnNow": turnNow,
    "turnLeft": turnLeft,
    "turnLeftDuration": turnLeftDuration,
    "turnLeftDurationString": turnLeftDurationString,
  };

}

class DoctorAppointmentOfPatient {
  DoctorAppointmentOfPatient({
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

  factory DoctorAppointmentOfPatient.fromJson(Map<String, dynamic> json){
    return DoctorAppointmentOfPatient(
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

class OwnerAppointmentOfPatient {
  OwnerAppointmentOfPatient({
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

  factory OwnerAppointmentOfPatient.fromJson(Map<String, dynamic> json){
    return OwnerAppointmentOfPatient(
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
			"id": "3427041429912",
			"name": "anas",
			"phone": "01014563759",
			"age": 25,
			"sex": 1,
			"city": "cairo \t\t\t\t\t\t\t\t\t",
			"description": "dweveetvetvtwveyv3y3yv3vwyveyeytavwtvwveevwvwyeybeybb4yv3y\n \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-27",
			"completed": 0,
			"created_at": "2024-06-06T21:57:10.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1719446400000,
			"appCreateTimestamp": 1717711030000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3427041490956",
			"name": "today a",
			"phone": "01014563548",
			"age": 25,
			"sex": 1,
			"city": "xduvft \t\t\t\t\t\t\t\t\t",
			"description": "giygvh\n \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-06",
			"completed": 1,
			"created_at": "2024-06-06T21:58:11.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717632000000,
			"appCreateTimestamp": 1717711091000,
			"turn": 1,
			"turnNow": 3,
			"turnLeft": -2,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
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
			"created_at": "2024-06-06T21:58:44.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717632000000,
			"appCreateTimestamp": 1717711124000,
			"turn": 2,
			"turnNow": 3,
			"turnLeft": -1,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3427045322705",
			"name": "rrrrrt",
			"phone": "01026462456",
			"age": 25,
			"sex": 1,
			"city": "ffgh \t\t\t\t\t\t\t\t\t",
			"description": "t \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-06",
			"completed": 0,
			"created_at": "2024-06-06T23:02:03.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717632000000,
			"appCreateTimestamp": 1717714923000,
			"turn": 3,
			"turnNow": 3,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3427074690281",
			"name": "Ayman Ibrahim",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-6-8",
			"completed": 0,
			"created_at": "2024-06-06T07:11:30.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717804800000,
			"appCreateTimestamp": 1717657890000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3427074915791",
			"name": "El_dowsari",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-6-8",
			"completed": 0,
			"created_at": "2024-06-06T07:15:16.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717804800000,
			"appCreateTimestamp": 1717658116000,
			"turn": 2,
			"turnNow": 1,
			"turnLeft": 1,
			"turnLeftDuration": 600000,
			"turnLeftDurationString": "10m"
		},
		{
			"id": "3427075072457",
			"name": "Lamar",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-6-8",
			"completed": 0,
			"created_at": "2024-06-06T07:17:52.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717804800000,
			"appCreateTimestamp": 1717658272000,
			"turn": 3,
			"turnNow": 1,
			"turnLeft": 2,
			"turnLeftDuration": 1200000,
			"turnLeftDurationString": "20m"
		},
		{
			"id": "3427076250992",
			"name": "fofo",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-6-8",
			"completed": 0,
			"created_at": "2024-06-06T07:37:31.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			"appDateTimestamp": 1717804800000,
			"appCreateTimestamp": 1717659451000,
			"turn": 4,
			"turnNow": 1,
			"turnLeft": 3,
			"turnLeftDuration": 1800000,
			"turnLeftDurationString": "30m"
		}
	]
}*/


//*****************************************
//*****************************************
//*****************************************

/*


class GetPatientAppointmentsModel {
  GetPatientAppointmentsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PatientAppointmentData> data;

  factory GetPatientAppointmentsModel.fromJson(Map<String, dynamic> json){
    return GetPatientAppointmentsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PatientAppointmentData>.from(json["data"]!.map((x) => PatientAppointmentData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PatientAppointmentData {
  PatientAppointmentData({
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
    required this.owner,
    required this.doctor,
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
  final OwnerAppointmentOfPatient? owner;
  final DoctorAppointmentOfPatient? doctor;

  factory PatientAppointmentData.fromJson(Map<String, dynamic> json){
    return PatientAppointmentData(
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
      owner: json["owner"] == null ? null : OwnerAppointmentOfPatient.fromJson(json["owner"]),
      doctor: json["doctor"] == null ? null : DoctorAppointmentOfPatient.fromJson(json["doctor"]),
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
    "owner": owner?.toJson(),
    "doctor": doctor?.toJson(),
  };

}

class DoctorAppointmentOfPatient {
  DoctorAppointmentOfPatient({
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

  factory DoctorAppointmentOfPatient.fromJson(Map<String, dynamic> json){
    return DoctorAppointmentOfPatient(
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

class OwnerAppointmentOfPatient {
  OwnerAppointmentOfPatient({
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

  factory OwnerAppointmentOfPatient.fromJson(Map<String, dynamic> json){
    return OwnerAppointmentOfPatient(
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

*/
/*
{
	"message": "success",
	"data": [
		{
			"id": "3426946309599",
			"name": "Ashraf Mortada",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "October \t\t\t\t\t\t\t\t\t",
			"description": "A \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-09",
			"completed": 0,
			"created_at": "2024-06-04T19:31:50.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			}
		},
		{
			"id": "3426953335396",
			"name": "Osama",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "zaied \t\t\t\t\t\t\t\t\t",
			"description": " \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-05",
			"completed": 0,
			"created_at": "2024-06-04T21:28:55.000Z",
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
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
			}
		}
	]
}*//*









*/
