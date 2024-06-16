class AllPrivateChatModel {
  AllPrivateChatModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<PrivateChatData> data;

  factory AllPrivateChatModel.fromJson(Map<String, dynamic> json){
    return AllPrivateChatModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<PrivateChatData>.from(json["data"]!.map((x) => PrivateChatData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class PrivateChatData {
  PrivateChatData({
    required this.id,
    required this.source,
    required this.destination,
    required this.content,
    required this.file,
    required this.createdAt,
  });

  final String? id;
  final SourcePrivateChat? source;
  final DestinationPrivateChat? destination;
  final String? content;
  final String? file;
  final DateTime? createdAt;

  factory PrivateChatData.fromJson(Map<String, dynamic> json){
    return PrivateChatData(
      id: json["id"],
      source: json["source"] == null ? null : SourcePrivateChat.fromJson(json["source"]),
      destination: json["destination"] == null ? null : DestinationPrivateChat.fromJson(json["destination"]),
      content: json["content"],
      file: json["file"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "source": source?.toJson(),
    "destination": destination?.toJson(),
    "content": content,
    "file": file,
    "created_at": createdAt?.toIso8601String(),
  };

}

class DestinationPrivateChat {
  DestinationPrivateChat({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.speciality,
    required this.expertment,
    required this.defaultPatientTime,
    required this.createdAt,
    required this.role,
  });

  final String? id;
  final String? name;
  final String? phone;
  final dynamic avatar;
  final int? speciality;
  final String? expertment;
  final int? defaultPatientTime;
  final DateTime? createdAt;
  final String? role;

  factory DestinationPrivateChat.fromJson(Map<String, dynamic> json){
    return DestinationPrivateChat(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      speciality: json["speciality"],
      expertment: json["expertment"],
      defaultPatientTime: json["default_patient_time"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      role: json["role"],
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
    "role": role,
  };

}

class SourcePrivateChat {
  SourcePrivateChat({
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
  final String? avatar;
  final DateTime? createdAt;
  final String? role;

  factory SourcePrivateChat.fromJson(Map<String, dynamic> json){
    return SourcePrivateChat(
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
	"data": [
		{
			"id": "3427149082678",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-07T03:51:23.000Z"
		},
		{
			"id": "3427257550419",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf",
			"file": null,
			"created_at": "2024-06-08T09:59:10.000Z"
		},
		{
			"id": "3427257613733",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-08T10:00:14.000Z"
		},
		{
			"id": "3427257631692",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf",
			"file": null,
			"created_at": "2024-06-08T10:00:32.000Z"
		},
		{
			"id": "3427257712779",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf",
			"file": null,
			"created_at": "2024-06-08T10:01:53.000Z"
		},
		{
			"id": "3427257969368",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf ashraf",
			"file": null,
			"created_at": "2024-06-08T10:06:09.000Z"
		},
		{
			"id": "3427258244168",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": "chat34272582441669334.jpg",
			"created_at": "2024-06-08T10:10:44.000Z"
		},
		{
			"id": "3427258271581",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf send file",
			"file": null,
			"created_at": "2024-06-08T10:11:12.000Z"
		},
		{
			"id": "3427258345774",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf send file",
			"file": "chat34272583457733316.jpg",
			"created_at": "2024-06-08T10:12:26.000Z"
		},
		{
			"id": "3427258346422",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "Ahmed Sharaf send file",
			"file": null,
			"created_at": "2024-06-08T10:12:26.000Z"
		},
		{
			"id": "3427258371425",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": "chat34272583714243673.jpg",
			"created_at": "2024-06-08T10:12:51.000Z"
		},
		{
			"id": "3427259274049",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "ashraf z",
			"file": null,
			"created_at": "2024-06-08T10:27:54.000Z"
		},
		{
			"id": "3427259308450",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": "chat34272593084497887.jpg",
			"created_at": "2024-06-08T10:28:28.000Z"
		},
		{
			"id": "3427259386841",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "mohamed",
			"file": "chat34272593868403904.jpg",
			"created_at": "2024-06-08T10:29:47.000Z"
		},
		{
			"id": "3427259387484",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426937860434",
				"name": "Ashraf Omara",
				"phone": "01023014472",
				"avatar": null,
				"speciality": 1,
				"expertment": "6 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T17:11:01.000Z",
				"role": "doctor"
			},
			"content": "mohamed",
			"file": null,
			"created_at": "2024-06-08T10:29:47.000Z"
		}
	]
}*/