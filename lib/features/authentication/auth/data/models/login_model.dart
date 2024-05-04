class LoginModel {
  LoginModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final DataLogin? data;

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      message: json["message"],
      data: json["data"] == null ? null : DataLogin.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };

}

class DataLogin {
  DataLogin({
    required this.token,
    required this.user,
  });

  final String? token;
  final UserLogin? user;

  factory DataLogin.fromJson(Map<String, dynamic> json){
    return DataLogin(
      token: json["token"],
      user: json["user"] == null ? null : UserLogin.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };

}

class UserLogin {
  UserLogin({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.createdAt,
    required this.role,
    required this.experiment,
    required this.speciality,
    required this.default_patient_time,
  });

  final String? id;
  final String? name;
  final String? phone;
  final dynamic avatar;
  final DateTime? createdAt;
  final String? role;
  final String? experiment;          //only for doctor
  final int? speciality;             //only for doctor
   final int? default_patient_time;  //only for doctor

  factory UserLogin.fromJson(Map<String, dynamic> json){
    return UserLogin(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      role: json["role"],
      experiment: json["expertment"],    // * NOTE the syntax of this key is not correct on backend so cant correct it in flutter
      speciality: json["speciality"],
      default_patient_time: json["default_patient_time"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "role": role,
    "expertment": experiment,
    "speciality": speciality,
    "default_patient_time": default_patient_time,
  };

}

/*
{
	"message": "success",
	"data": {
		"token": "eyJpZCI6IjM0MjMxMDcyMjg3MTIiLCJpYXQiOjE3MTQxMTE1NjcsImV4cCI6MTcxNDE5Nzk2N30.cCC6IVpLesRCdLtobLlcbUW_g_mdErRn53pG1WQ4fKk",
		"user": {
			"id": "3423107228712",
			"name": "ashraf",
			"phone": "01014563769",
			"avatar": null,
			"created_at": "2024-04-21T09:07:09.000Z",
			"role": "user"
		}
	}
}*/


/*
{
    "message": "success",
    "data": {
        "token": "eyJpZCI6IjM0MjMxMDgwMDI0ODIiLCJpYXQiOjE3MTQ2MjY0MDYsImV4cCI6MTcxNDcxMjgwNn0.fe1oBdX-5C7vUzgENDkmyuDCTPHqYwlLmqWg5x13m4I",
        "user": {
            "id": "3423108002482",
            "name": "Hatem",
            "phone": "01023014472",
            "avatar": null,
            "speciality": 0,
            "expertment": "2 years",
            "default_patient_time": 600,
            "created_at": "2024-04-21T09:20:03.000Z",
            "role": "doctor"
        }
    }
}
* */