class AllPatientsModel {
  AllPatientsModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<AllPatientData> data;

  factory AllPatientsModel.fromJson(Map<String, dynamic> json){
    return AllPatientsModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<AllPatientData>.from(json["data"]!.map((x) => AllPatientData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class AllPatientData {
  AllPatientData({
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
  final String? avatar;
  final DateTime? createdAt;
  final List<AllPatientRating> ratings;

  factory AllPatientData.fromJson(Map<String, dynamic> json){
    return AllPatientData(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      pass: json["pass"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      ratings: json["ratings"] == null ? [] : List<AllPatientRating>.from(json["ratings"]!.map((x) => AllPatientRating.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "pass": pass,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "ratings": ratings.map((x) => x.toJson()).toList(),
  };

}

class AllPatientRating {
  AllPatientRating({
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

  factory AllPatientRating.fromJson(Map<String, dynamic> json){
    return AllPatientRating(
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
			"id": "12345",
			"name": "Rachel Adams",
			"phone": "+9876543210",
			"pass": "rachelPass!",
			"avatar": "https://example.com/rachel_avatar.jpg",
			"created_at": "2024-04-21T02:19:51.000Z",
			"ratings": [
				{
					"id": 4001,
					"doctor_id": "13579",
					"user_id": "12345",
					"rating": 5,
					"created_at": "2024-04-21T02:19:50.000Z"
				}
			]
		},
		{
			"id": "13579",
			"name": "tamatamatama",
			"phone": "+1234567890",
			"pass": "david_password!",
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
		},
		{
			"id": "24601",
			"name": "Laura White",
			"phone": "+1122334455",
			"pass": "laura_pass123",
			"avatar": "https://example.com/laura_avatar.jpg",
			"created_at": "2024-04-21T02:19:51.000Z",
			"ratings": []
		},
		{
			"id": "3423087647654",
			"name": "matrawy",
			"phone": "01126344753",
			"pass": "$2b$10$sI0BwWHE0Uayim/8vRtW3.vUA19.NA.Glf8aXsmLzwwU.KFfnP4VK",
			"avatar": null,
			"created_at": "2024-04-21T03:40:48.000Z",
			"ratings": []
		},
		{
			"id": "3423315397331",
			"name": "ahmed",
			"phone": "01234567899",
			"pass": "$2b$10$RjVWnT1pmcK55khKsytzYuJqcU7p0OjAkprQkCq2trKqcl9Cyx0I.",
			"avatar": null,
			"created_at": "2024-04-23T18:56:38.000Z",
			"ratings": []
		},
		{
			"id": "3423315499604",
			"name": "ahmed",
			"phone": "01234567898",
			"pass": "$2b$10$fUWriXN1T6zH2OHFVHlA8uOkWBQVOFiqZPmF93TVIG37QGQNE5b.y",
			"avatar": null,
			"created_at": "2024-04-23T18:58:20.000Z",
			"ratings": []
		},
		{
			"id": "3423315599957",
			"name": "Ahmed",
			"phone": "01060770145",
			"pass": "$2b$10$aZR1R/aqsuJZ2XxcO.rHA.1pm7.yI4oGwxrkYweX51ZmmgIpqBkny",
			"avatar": null,
			"created_at": "2024-04-23T19:00:00.000Z",
			"ratings": []
		},
		{
			"id": "3423324644141",
			"name": "Ahmed",
			"phone": "22222222222",
			"pass": "$2b$10$JtAcAZpQ44vFjuDif0E7qerqhqLDimsrO7vti/gmaqfzMSo3WnsnG",
			"avatar": null,
			"created_at": "2024-04-23T21:30:44.000Z",
			"ratings": []
		},
		{
			"id": "3423350462863",
			"name": "matrawy",
			"phone": "01025525366",
			"pass": "$2b$10$a.pExApxdsSYWAgTY9fshuw3URmDVgDYtLhNiboQWR86nuVr7xRw.",
			"avatar": null,
			"created_at": "2024-04-24T04:41:03.000Z",
			"ratings": []
		},
		{
			"id": "3423692303179",
			"name": "Ashraf Hatem",
			"phone": "01014563769",
			"pass": "$2b$10$rq1GNjSVZ0D.cefLtwwh5ua2JfdDwpWqmsKOpP7iaVJKPPDbs/PY2",
			"avatar": "avatar3423692303179.jpg",
			"created_at": "2024-04-28T03:38:24.000Z",
			"ratings": []
		},
		{
			"id": "3423693870026",
			"name": "Ashraf",
			"phone": "01014563767",
			"pass": "$2b$10$0zGkhoeN9WoEmX/db8G7O.uO3XDGQ2U.2a0veY6pPxt0be6jh..42",
			"avatar": null,
			"created_at": "2024-04-28T04:04:30.000Z",
			"ratings": []
		},
		{
			"id": "3423694911221",
			"name": "Ashraf",
			"phone": "12345678910",
			"pass": "$2b$10$xbauv96aoMcajCmU.9gbSOkRwjXFLkL2w6Fx7gxSbI5fZtjsC3fL6",
			"avatar": null,
			"created_at": "2024-04-28T04:21:52.000Z",
			"ratings": []
		},
		{
			"id": "3423700738233",
			"name": "ashraf ",
			"phone": "01014563762",
			"pass": "$2b$10$o6OdgOLxH1lG6z/0s.j3.uL50bFtOTA0qwf0eKyp3MuZSIWXo0dDy",
			"avatar": null,
			"created_at": "2024-04-28T05:58:59.000Z",
			"ratings": []
		},
		{
			"id": "54321",
			"name": "Kevin Lee",
			"phone": "+5555555555",
			"pass": "kevin_pass_123",
			"avatar": "https://example.com/kevin_avatar.jpg",
			"created_at": "2024-04-21T02:19:51.000Z",
			"ratings": [
				{
					"id": 4002,
					"doctor_id": "3423108002482",
					"user_id": "54321",
					"rating": 4,
					"created_at": "2024-04-21T02:19:50.000Z"
				}
			]
		}
	]
}*/