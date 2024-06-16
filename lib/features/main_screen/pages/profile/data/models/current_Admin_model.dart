class CurrentAdminModel {
  CurrentAdminModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<DataCurrentAdmin> data;

  factory CurrentAdminModel.fromJson(Map<String, dynamic> json){
    return CurrentAdminModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<DataCurrentAdmin>.from(json["data"]!.map((x) => DataCurrentAdmin.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class DataCurrentAdmin {
  DataCurrentAdmin({
    required this.id,
    required this.name,
    required this.phone,
    required this.pass,
    required this.avatar,
    required this.createdAt,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? pass;
  final String? avatar;
  final DateTime? createdAt;

  factory DataCurrentAdmin.fromJson(Map<String, dynamic> json){
    return DataCurrentAdmin(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      pass: json["pass"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "pass": pass,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
  };

}

/*
{
	"message": "success",
	"data": [
		{
			"id": "3424042181169",
			"name": "Ashraf",
			"phone": "01023456789",
			"pass": "$2b$10$LAEfKhE7NXNlVTFN8ih1He58dqBc5hEdhiZ.cVaJs3eCqcmlAnUm.",
			"avatar": "dfdferg44gr4gdg",
			"created_at": "2024-05-02T04:49:41.000Z"
		}
	]
}*/