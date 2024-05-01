class LoginModel {
  LoginModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String? token;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };

}

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.createdAt,
    required this.role,
  });

  final String? id;
  final String? name;
  final String? phone;
  final dynamic avatar;
  final DateTime? createdAt;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "role": role,
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