class AllProfileChatModel {
  AllProfileChatModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<AllProfileChatData> data;

  factory AllProfileChatModel.fromJson(Map<String, dynamic> json){
    return AllProfileChatModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<AllProfileChatData>.from(json["data"]!.map((x) => AllProfileChatData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class AllProfileChatData {
  AllProfileChatData({
    required this.id,
    required this.source,
    required this.destination,
    required this.content,
    required this.file,
    required this.createdAt,
  });

  final String? id;
  final DestinationProfileChat? source;
  final DestinationProfileChat? destination;
  final String? content;
  final String? file;
  final DateTime? createdAt;

  factory AllProfileChatData.fromJson(Map<String, dynamic> json){
    return AllProfileChatData(
      id: json["id"],
      source: json["source"] == null ? null : DestinationProfileChat.fromJson(json["source"]),
      destination: json["destination"] == null ? null : DestinationProfileChat.fromJson(json["destination"]),
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

class DestinationProfileChat {
  DestinationProfileChat({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    required this.createdAt,
    required this.role,
    required this.speciality,
    required this.expertment,
    required this.defaultPatientTime,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? avatar;
  final DateTime? createdAt;
  final String? role;
  final int? speciality;
  final String? expertment;
  final int? defaultPatientTime;

  factory DestinationProfileChat.fromJson(Map<String, dynamic> json){
    return DestinationProfileChat(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      role: json["role"],
      speciality: json["speciality"],
      expertment: json["expertment"],
      defaultPatientTime: json["default_patient_time"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
    "created_at": createdAt?.toIso8601String(),
    "role": role,
    "speciality": speciality,
    "expertment": expertment,
    "default_patient_time": defaultPatientTime,
  };

}

class SourceProfileChat {
  SourceProfileChat({
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

  factory SourceProfileChat.fromJson(Map<String, dynamic> json){
    return SourceProfileChat(
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
			"id": "2001",
			"source": {
				"id": "12345",
				"name": "Alice Johnson",
				"phone": "+1234567890",
				"avatar": "https://example.com/alice_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"destination": {
				"id": "13579",
				"name": "Sophia Wilson",
				"phone": "+9876543210",
				"avatar": "https://example.com/sophia_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "Hi Elena, I would like to schedule an appointment for next week.",
			"file": null,
			"created_at": "2024-04-21T02:19:49.000Z"
		},
		{
			"id": "2002",
			"source": {
				"id": "54321",
				"name": "Bob Smith",
				"phone": "+1987654321",
				"avatar": "https://example.com/bob_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"destination": {
				"id": "24680",
				"name": "Michael Brown",
				"phone": "+5555555555",
				"avatar": "https://example.com/michael_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "Dr. Wilson, could you please review my latest test results?",
			"file": "attachment1.pdf",
			"created_at": "2024-04-21T02:19:49.000Z"
		},
		{
			"id": "2003",
			"source": {
				"id": "98765",
				"name": "Emily Davis",
				"phone": "+1122334455",
				"avatar": "https://example.com/emily_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"destination": {
				"id": "24601",
				"name": null,
				"phone": null,
				"avatar": null,
				"role": null,
				"created_at": null
			},
			"content": "Laura, can you confirm my appointment time for tomorrow?",
			"file": null,
			"created_at": "2024-04-21T02:19:49.000Z"
		},
		{
			"id": "2004",
			"source": {
				"id": "13579",
				"name": "Sophia Wilson",
				"phone": "+9876543210",
				"avatar": "https://example.com/sophia_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"destination": {
				"id": "54321",
				"name": "Bob Smith",
				"phone": "+1987654321",
				"avatar": "https://example.com/bob_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "Bob, I need to reschedule our meeting to Friday afternoon.",
			"file": null,
			"created_at": "2024-04-21T02:19:49.000Z"
		},
		{
			"id": "2005",
			"source": {
				"id": "24680",
				"name": "Michael Brown",
				"phone": "+5555555555",
				"avatar": "https://example.com/michael_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"destination": {
				"id": "12345",
				"name": "Alice Johnson",
				"phone": "+1234567890",
				"avatar": "https://example.com/alice_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "Alice, could you provide me with more details about the upcoming event?",
			"file": null,
			"created_at": "2024-04-21T02:19:49.000Z"
		},
		{
			"id": "3426866481794",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "13579",
				"name": "Sophia Wilson",
				"phone": "+9876543210",
				"avatar": "https://example.com/sophia_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-03T21:21:22.000Z"
		},
		{
			"id": "3426866742258",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3423108002482",
				"name": null,
				"phone": null,
				"avatar": null,
				"role": null,
				"created_at": null
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-03T21:25:42.000Z"
		},
		{
			"id": "3427148980627",
			"source": {
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
			"destination": {
				"id": "13579",
				"name": "Sophia Wilson",
				"phone": "+9876543210",
				"avatar": "https://example.com/sophia_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-07T03:49:41.000Z"
		},
		{
			"id": "3427149043585",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "13579",
				"name": "Sophia Wilson",
				"phone": "+9876543210",
				"avatar": "https://example.com/sophia_avatar.jpg",
				"created_at": "2024-04-21T02:19:49.000Z",
				"role": "admin"
			},
			"content": "test ya phekhim",
			"file": null,
			"created_at": "2024-06-07T03:50:44.000Z"
		},
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
		},
		{
			"id": "3427264234034",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "baraweza @ yahoo . com",
			"file": null,
			"created_at": "2024-06-08T11:50:34.000Z"
		},
		{
			"id": "3427264298499",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": null,
			"created_at": "2024-06-08T11:51:38.000Z"
		},
		{
			"id": "3427264387549",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": null,
			"created_at": "2024-06-08T11:53:07.000Z"
		},
		{
			"id": "3427264432649",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": null,
			"created_at": "2024-06-08T11:53:52.000Z"
		},
		{
			"id": "3427264559033",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": null,
			"created_at": "2024-06-08T11:55:59.000Z"
		},
		{
			"id": "3427264797449",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": "chat34272647974248494.jpg",
			"created_at": "2024-06-08T11:59:57.000Z"
		},
		{
			"id": "3427264965515",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": null,
			"file": "chat34272649655061314.jpg",
			"created_at": "2024-06-08T12:02:45.000Z"
		},
		{
			"id": "3427264993356",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "baraweza @ yahoo . com",
			"file": null,
			"created_at": "2024-06-08T12:03:13.000Z"
		},
		{
			"id": "3427265064352",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "baraweza @ yahoo . com",
			"file": null,
			"created_at": "2024-06-08T12:04:24.000Z"
		},
		{
			"id": "3427265095017",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "baraweza @ yaho . com",
			"file": null,
			"created_at": "2024-06-08T12:04:55.000Z"
		},
		{
			"id": "3427265167239",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "baraweza @ yaho . com",
			"file": null,
			"created_at": "2024-06-08T12:06:07.000Z"
		},
		{
			"id": "3427265196138",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "walady",
			"file": "chat34272651961294189.jpg",
			"created_at": "2024-06-08T12:06:36.000Z"
		},
		{
			"id": "3427265216735",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "walady",
			"file": "chat34272652167277574.jpg,chat34272652167304180.jpg",
			"created_at": "2024-06-08T12:06:56.000Z"
		},
		{
			"id": "3427265616982",
			"source": {
				"id": "3423692303179",
				"name": "Ashraf Hatem",
				"phone": "01014563769",
				"avatar": "avatar3423692303179.jpg",
				"created_at": "2024-04-28T03:38:24.000Z",
				"role": "user"
			},
			"destination": {
				"id": "3426880932282",
				"name": "Ahmed Sharaf",
				"phone": "01024681014",
				"avatar": null,
				"speciality": 3,
				"expertment": "4 years",
				"default_patient_time": 600,
				"created_at": "2024-06-04T01:22:13.000Z",
				"role": "doctor"
			},
			"content": "rafady",
			"file": "chat34272656169727165.jpg,chat34272656169779692.jpg",
			"created_at": "2024-06-08T12:13:37.000Z"
		}
	]
}*/