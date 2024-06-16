class GetDoctorModel {
  GetDoctorModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<GetDoctorData> data;

  factory GetDoctorModel.fromJson(Map<String, dynamic> json){
    return GetDoctorModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<GetDoctorData>.from(json["data"]!.map((x) => GetDoctorData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class GetDoctorData {
  GetDoctorData({
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
  final List<dynamic> ratings;

  factory GetDoctorData.fromJson(Map<String, dynamic> json){
    return GetDoctorData(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      pass: json["pass"],
      avatar: json["avatar"],
      speciality: json["speciality"],
      expertment: json["expertment"],
      defaultPatientTime: json["default_patient_time"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<dynamic>.from(json["ratings"]!.map((x) => x)),
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
    "ratings": ratings.map((x) => x).toList(),
  };

}

/*
{
	"message": "success",
	"data": [
		{
			"id": "3423108002482",
			"name": "ashraf",
			"phone": "01023014472",
			"pass": "$2b$10$UNwhTPEpRGjB7UO7cMADvuwHVhPECgqohht2r7i.qzZEcMNF8AnFm",
			"avatar": "avatar3423108002482.jpg",
			"speciality": 0,
			"expertment": "2 years",
			"default_patient_time": 1800,
			"created_at": "2024-04-21T09:20:03.000Z",
			"ratings": []
		}
	]
}*/