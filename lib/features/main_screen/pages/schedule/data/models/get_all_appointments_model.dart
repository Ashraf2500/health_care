class AllAppointmentsModel {
  AllAppointmentsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<AllAppointmentsData> data;

  factory AllAppointmentsModel.fromJson(Map<String, dynamic> json){
    return AllAppointmentsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<AllAppointmentsData>.from(json["data"]!.map((x) => AllAppointmentsData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class AllAppointmentsData {
  AllAppointmentsData({
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
    required this.doctor,
    required this.owner,
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
  final DoctorAppointmentOfAdmin? doctor;
  final OwnerAppointmentOfAdmin? owner;
  final int? appDateTimestamp;
  final int? appCreateTimestamp;
  final int? turn;
  final int? turnNow;
  final int? turnLeft;
  final int? turnLeftDuration;
  final String? turnLeftDurationString;

  factory AllAppointmentsData.fromJson(Map<String, dynamic> json){
    return AllAppointmentsData(
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
      doctor: json["doctor"] == null ? null : DoctorAppointmentOfAdmin.fromJson(json["doctor"]),
      owner: json["owner"] == null ? null : OwnerAppointmentOfAdmin.fromJson(json["owner"]),
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
    "doctor": doctor?.toJson(),
    "owner": owner?.toJson(),
    "appDateTimestamp": appDateTimestamp,
    "appCreateTimestamp": appCreateTimestamp,
    "turn": turn,
    "turnNow": turnNow,
    "turnLeft": turnLeft,
    "turnLeftDuration": turnLeftDuration,
    "turnLeftDurationString": turnLeftDurationString,
  };

}

class DoctorAppointmentOfAdmin {
  DoctorAppointmentOfAdmin({
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

  factory DoctorAppointmentOfAdmin.fromJson(Map<String, dynamic> json){
    return DoctorAppointmentOfAdmin(
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

class OwnerAppointmentOfAdmin {
  OwnerAppointmentOfAdmin({
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

  factory OwnerAppointmentOfAdmin.fromJson(Map<String, dynamic> json){
    return OwnerAppointmentOfAdmin(
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
			"id": "1001",
			"name": "John Doe",
			"phone": "+1234567890",
			"age": 35,
			"sex": 0,
			"city": "New York",
			"description": "Regular check-up",
			"photos": "https://example.com/photo1.jpg,https://example.com/photo2.jpg",
			"owner_id": "24601",
			"doctor_id": "3424008547718",
			"department": 0,
			"app_date": "2024-03-03",
			"completed": 1,
			"created_at": "2024-04-04T02:19:49.000Z",
			"doctor": null,
			"owner": {
				"id": "24601",
				"name": "Laura White",
				"phone": "+1122334455",
				"avatar": "https://example.com/laura_avatar.jpg",
				"created_at": "2024-04-21T02:19:51.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1709424000000,
			"appCreateTimestamp": 1712197189000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3424230793490",
			"name": "Emily Davis",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423087647654",
			"doctor_id": "3423108002482",
			"department": 0,
			"app_date": "2024-05-12",
			"completed": 1,
			"created_at": "2024-05-05T09:13:13.000Z",
			"doctor": null,
			"owner": {
				"id": "3423087647654",
				"name": "matrawy",
				"phone": "01126344753",
				"avatar": null,
				"created_at": "2024-04-21T03:40:48.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1715472000000,
			"appCreateTimestamp": 1714900393000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3425369939238",
			"name": "Ayman Ibrahim",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423087647654",
			"doctor_id": "3423108002482",
			"department": 0,
			"app_date": "2024-05-17",
			"completed": 1,
			"created_at": "2024-05-05T13:38:59.000Z",
			"doctor": null,
			"owner": {
				"id": "3423087647654",
				"name": "matrawy",
				"phone": "01126344753",
				"avatar": null,
				"created_at": "2024-04-21T03:40:48.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1715904000000,
			"appCreateTimestamp": 1714916339000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3425822688893",
			"name": "Ashraf Hatem",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423107228712",
			"doctor_id": "3423108002482",
			"department": 0,
			"app_date": "2024-05-22",
			"completed": 1,
			"created_at": "2024-05-05T19:24:49.000Z",
			"doctor": null,
			"owner": null,
			"appDateTimestamp": 1716336000000,
			"appCreateTimestamp": 1714937089000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3425822026780",
			"name": "Wageh",
			"phone": "01014563769",
			"age": 25,
			"sex": 1,
			"city": "New York",
			"description": "Patient with a history of allergies",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423107228712",
			"doctor_id": "3426881708878",
			"department": 0,
			"app_date": "2024-05-22",
			"completed": 1,
			"created_at": "2024-05-05T19:13:47.000Z",
			"doctor": null,
			"owner": null,
			"appDateTimestamp": 1716336000000,
			"appCreateTimestamp": 1714936427000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1717804800000,
			"appCreateTimestamp": 1717659451000,
			"turn": 4,
			"turnNow": 1,
			"turnLeft": 3,
			"turnLeftDuration": 1800000,
			"turnLeftDurationString": "30m"
		},
		{
			"id": "3427181863138",
			"name": "Ahmed Sharaf",
			"phone": "01060145562",
			"age": 25,
			"sex": 1,
			"city": "Monofiya \t\t\t\t\t\t\t\t\t",
			"description": "Corona  \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-07",
			"completed": 0,
			"created_at": "2024-06-06T12:57:43.000Z",
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1717718400000,
			"appCreateTimestamp": 1717678663000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		},
		{
			"id": "3427181925931",
			"name": "Ahmed Shady",
			"phone": "01068594325",
			"age": 25,
			"sex": 1,
			"city": "Cairo \t\t\t\t\t\t\t\t\t",
			"description": "PNEUMONIA  \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-07",
			"completed": 0,
			"created_at": "2024-06-06T12:58:46.000Z",
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1717718400000,
			"appCreateTimestamp": 1717678726000,
			"turn": 2,
			"turnNow": 1,
			"turnLeft": 1,
			"turnLeftDuration": 600000,
			"turnLeftDurationString": "10m"
		},
		{
			"id": "3427181992674",
			"name": "samy hany",
			"phone": "01094658357",
			"age": 25,
			"sex": 1,
			"city": "Giza \t\t\t\t\t\t\t\t\t",
			"description": "Coronq \t\t\t\t\t\t\t\t\t",
			"photos": "[\"https://example.com/photo1.jpg\", \"https://example.com/photo2.jpg\"]",
			"owner_id": "3423692303179",
			"doctor_id": "3426937860434",
			"department": 1,
			"app_date": "2024-06-16",
			"completed": 0,
			"created_at": "2024-06-06T12:59:53.000Z",
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			},
			"appDateTimestamp": 1718496000000,
			"appCreateTimestamp": 1717678793000,
			"turn": 1,
			"turnNow": 1,
			"turnLeft": 0,
			"turnLeftDuration": 0,
			"turnLeftDurationString": "0ms"
		}
	]
}*/


/*


class AllAppointmentsModel {
  AllAppointmentsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<AllAppointmentsData> data;

  factory AllAppointmentsModel.fromJson(Map<String, dynamic> json){
    return AllAppointmentsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<AllAppointmentsData>.from(json["data"]!.map((x) => AllAppointmentsData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class AllAppointmentsData {
  AllAppointmentsData({
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
    required this.doctor,
    required this.owner,
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
  final DoctorAppointmentOfAdmin? doctor;
  final OwnerAppointmentOfAdmin? owner;

  factory AllAppointmentsData.fromJson(Map<String, dynamic> json){
    return AllAppointmentsData(
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
      appDate:json["app_date"],
      completed: json["completed"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      doctor: json["doctor"] == null ? null : DoctorAppointmentOfAdmin.fromJson(json["doctor"]),
      owner: json["owner"] == null ? null : OwnerAppointmentOfAdmin.fromJson(json["owner"]),
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
    "app_date":appDate,
    "completed": completed,
    "created_at": createdAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
    "owner": owner?.toJson(),
  };

}

class DoctorAppointmentOfAdmin {
  DoctorAppointmentOfAdmin({
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

  factory DoctorAppointmentOfAdmin.fromJson(Map<String, dynamic> json){
    return DoctorAppointmentOfAdmin(
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

class OwnerAppointmentOfAdmin {
  OwnerAppointmentOfAdmin({
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
  final List<RatingAppointmentOfAdmin> ratings;

  factory OwnerAppointmentOfAdmin.fromJson(Map<String, dynamic> json){
    return OwnerAppointmentOfAdmin(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<RatingAppointmentOfAdmin>.from(json["ratings"]!.map((x) => RatingAppointmentOfAdmin.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x.toJson()).toList(),
  };

}

class RatingAppointmentOfAdmin {
  RatingAppointmentOfAdmin({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.rating,
    required this.createdAt,
  });

  final int? id;
  final String? doctorId;
  final String? userId;
  final int? rating;
  final DateTime? createdAt;

  factory RatingAppointmentOfAdmin.fromJson(Map<String, dynamic> json){
    return RatingAppointmentOfAdmin(
      id: json["id"],
      doctorId: json["doctor_id"],
      userId: json["user_id"],
      rating: json["rating"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "user_id": userId,
    "rating": rating,
    "created_at": createdAt?.toIso8601String(),
  };

}

*/
/*
{
	"message": "success",
	"data": [
		{
			"id": "1001",
			"name": "John Doe",
			"phone": "+1234567890",
			"age": 35,
			"sex": 0,
			"city": "New York",
			"description": "Regular check-up",
			"photos": "https://example.com/photo1.jpg,https://example.com/photo2.jpg",
			"owner_id": "24601",
			"doctor_id": "3424008547718",
			"department": 0,
			"app_date": "2024-03-03",
			"completed": 1,
			"created_at": "2024-04-21T02:19:49.000Z",
			"doctor": null,
			"owner": {
				"id": "24601",
				"name": "Laura White",
				"phone": "+1122334455",
				"avatar": "https://example.com/laura_avatar.jpg",
				"created_at": "2024-04-21T02:19:51.000Z",
				"ratings": []
			}
		},
		{
			"id": "1002",
			"name": "Jane Smith",
			"phone": "+1987654321",
			"age": 28,
			"sex": 1,
			"city": "Los Angeles",
			"description": "Allergic reactions",
			"photos": "https://example.com/photo3.jpg",
			"owner_id": "13579",
			"doctor_id": "98765",
			"department": 1,
			"app_date": "2024-03-04",
			"completed": 0,
			"created_at": "2024-04-21T02:19:49.000Z",
			"doctor": null,
			"owner": {
				"id": "13579",
				"name": "tamatamatama",
				"phone": "+1234567890",
				"avatar": "https://example.com/david_avatar.jpg",
				"created_at": "2024-04-21T02:19:51.000Z",
				"ratings": [
					{
						"id": 4004,
						"doctor_id": "3423108002482",
						"user_id": "13579",
						"rating": 4,
						"created_at": "2024-04-21T02:19:50.000Z"
					}
				]
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
			"owner": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"ratings": []
			}
		}
	]
}*//*



*/
