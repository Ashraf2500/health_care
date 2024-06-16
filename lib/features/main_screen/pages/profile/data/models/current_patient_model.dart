class CurrentPatientModel {
  CurrentPatientModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<DataCurrentPatient> data;

  factory CurrentPatientModel.fromJson(Map<String, dynamic> json){
    return CurrentPatientModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<DataCurrentPatient>.from(json["data"]!.map((x) => DataCurrentPatient.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class DataCurrentPatient {
  DataCurrentPatient({
    required this.id,
    required this.name,
    required this.phone,
    required this.pass,
    required this.avatar,
    required this.createdAt,
    required this.ratings,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? pass;
  final dynamic avatar;
  final DateTime? createdAt;
  final List<dynamic> ratings;

  factory DataCurrentPatient.fromJson(Map<String, dynamic> json){
    return DataCurrentPatient(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      pass: json["pass"],
      avatar: json["avatar"],
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
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x).toList(),
  };

}

/*
{
	"message": "success",
	"data": [
		{
			"id": "3423107228712",
			"name": "hwauei",
			"phone": "01014563769",
			"pass": "$2b$10$QPWdXnT6JGURZwazhzXFZOfS2bhUq1u/KgCM1mHtX4DVQO29e4ql6",
			"avatar": null,
			"created_at": "2024-04-21T09:07:09.000Z",
			"ratings": []
		}
	]
}*/