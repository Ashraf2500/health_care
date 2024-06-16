class PopularDoctorsModel {
  PopularDoctorsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PopularDoctorsData> data;

  factory PopularDoctorsModel.fromJson(Map<String, dynamic> json){
    return PopularDoctorsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PopularDoctorsData>.from(json["data"]!.map((x) => PopularDoctorsData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PopularDoctorsData {
  PopularDoctorsData({
    required this.id,
    required this.name,
    required this.phone,
    required this.pass,
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
  final String? pass;
  final String? avatar;
  final int? speciality;
  final String? expertment;
  final int? defaultPatientTime;
  final DateTime? createdAt;
  final List<Rating> ratings;
  final int? ratingPoints;
  final int? rating;

  factory PopularDoctorsData.fromJson(Map<String, dynamic> json){
    return PopularDoctorsData(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      pass: json["pass"],
      avatar: json["avatar"],
      speciality: json["speciality"],
      expertment: json["expertment"],
      defaultPatientTime: json["default_patient_time"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
      ratingPoints: json["ratingPoints"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "pass": pass,
    "avatar": avatar,
    "speciality": speciality,
    "expertment": expertment,
    "default_patient_time": defaultPatientTime,
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x?.toJson()).toList(),
    "ratingPoints": ratingPoints,
    "rating": rating,
  };

}

class Rating {
  Rating({
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

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
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

/*
{
	"message": "success",
	"data": [
		{
			"id": "13579",
			"name": "Elena Rodriguez",
			"phone": "+1122334455",
			"pass": "elena_pass123",
			"avatar": "https://example.com/elena_avatar.jpg",
			"speciality": 1,
			"expertment": "Machine Learning",
			"default_patient_time": 600,
			"created_at": "2024-04-21T02:19:49.000Z",
			"ratings": [
				{
					"id": 4001,
					"doctor_id": "13579",
					"user_id": "12345",
					"rating": 5,
					"created_at": "2024-04-21T02:19:50.000Z"
				}
			],
			"ratingPoints": 5,
			"rating": 5
		},
		{
			"id": "24680",
			"name": "James Wilson",
			"phone": "+5555555555",
			"pass": "james_pass_123",
			"avatar": "https://example.com/james_avatar.jpg",
			"speciality": 7,
			"expertment": "Clinical Trials",
			"default_patient_time": 600,
			"created_at": "2024-04-21T02:19:49.000Z",
			"ratings": [
				{
					"id": 4002,
					"doctor_id": "24680",
					"user_id": "54321",
					"rating": 4,
					"created_at": "2024-04-21T02:19:50.000Z"
				}
			],
			"ratingPoints": 3,
			"rating": 4
		},
		{
			"id": "54321",
			"name": "Sophie Clark",
			"phone": "+1987654321",
			"pass": "sophie1234",
			"avatar": "https://example.com/sophie_avatar.jpg",
			"speciality": 5,
			"expertment": "Genetic Engineering",
			"default_patient_time": 600,
			"created_at": "2024-04-21T02:19:49.000Z",
			"ratings": [
				{
					"id": 4004,
					"doctor_id": "54321",
					"user_id": "13579",
					"rating": 4,
					"created_at": "2024-04-21T02:19:50.000Z"
				}
			],
			"ratingPoints": 3,
			"rating": 4
		},
		{
			"id": "3423108002482",
			"name": "Hatem",
			"phone": "01023014472",
			"pass": "$2b$10$mBuyso2V4Ce5FdL6YkqQYuQXl2OiptJIvHCHxcfzjquLQIfrS8fxq",
			"avatar": null,
			"speciality": 0,
			"expertment": "2 years",
			"default_patient_time": 600,
			"created_at": "2024-04-21T09:20:03.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		},
		{
			"id": "3423324295693",
			"name": "Ashraf Hatem",
			"phone": "01234567889",
			"pass": "$2b$10$VEp0vtcM8XpO5N9iZ2o.6O18th//EcIDHYkWdwBMM07vnozTG8A3K",
			"avatar": null,
			"speciality": 1,
			"expertment": "2 years",
			"default_patient_time": 600,
			"created_at": "2024-04-23T21:24:56.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		},
		{
			"id": "3423324514429",
			"name": "Ashraf Hatem",
			"phone": "22222222222",
			"pass": "$2b$10$Vjne/Sf4Fdd9zNdTiwOnVOge/Zg/Qm.UCOFg9Va5mgyPPeuS9Ybw6",
			"avatar": null,
			"speciality": 1,
			"expertment": "2 years",
			"default_patient_time": 600,
			"created_at": "2024-04-23T21:28:35.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		},
		{
			"id": "3424008547718",
			"name": "matata",
			"phone": "01522534867",
			"pass": "$2b$10$qnqpEi9O4H3rsvaDbMiR5eRapFatmpvn6w895sCGKOJfUuaqV0dDu",
			"avatar": null,
			"speciality": 0,
			"expertment": "2 years",
			"default_patient_time": 1800,
			"created_at": "2024-05-01T19:29:07.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		},
		{
			"id": "3424042441257",
			"name": "fofo",
			"phone": "01023014471",
			"pass": "$2b$10$fqyVDzzRkQYlf40zKuuk2epHZgu3SmwiIM/zbrQXV.Rdk82Sj.MqK",
			"avatar": null,
			"speciality": 0,
			"expertment": "2 years",
			"default_patient_time": 600,
			"created_at": "2024-05-02T04:54:01.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		},
		{
			"id": "98765",
			"name": "Daniel Garcia",
			"phone": "+1234567890",
			"pass": "daniel_password!",
			"avatar": "https://example.com/daniel_avatar.jpg",
			"speciality": 3,
			"expertment": "Robotics",
			"default_patient_time": 600,
			"created_at": "2024-04-21T02:19:49.000Z",
			"ratings": [],
			"ratingPoints": 0,
			"rating": null
		}
	]
}*/