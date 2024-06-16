class GetDoctorScheduleModel {
  GetDoctorScheduleModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<DoctorScheduleData> data;

  factory GetDoctorScheduleModel.fromJson(Map<String, dynamic> json){
    return GetDoctorScheduleModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<DoctorScheduleData>.from(json["data"]!.map((x) => DoctorScheduleData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class DoctorScheduleData {
  DoctorScheduleData({
    required this.doctorId,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  final String? doctorId;
  final String? sunday;
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;

  factory DoctorScheduleData.fromJson(Map<String, dynamic> json){
    return DoctorScheduleData(
      doctorId: json["doctor_id"],
      sunday: json["sunday"],
      monday: json["monday"],
      tuesday: json["tuesday"],
      wednesday: json["wednesday"],
      thursday: json["thursday"],
      friday: json["friday"],
      saturday: json["saturday"],
    );
  }

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "sunday": sunday,
    "monday": monday,
    "tuesday": tuesday,
    "wednesday": wednesday,
    "thursday": thursday,
    "friday": friday,
    "saturday": saturday,
  };

}

/*
{
	"message": "success",
	"data": [
		{
			"doctor_id": "3423108002482",
			"sunday": "05:30-08:00",
			"monday": "05:30-08:00",
			"tuesday": "05:30-08:00",
			"wednesday": "07:30-13:00",
			"thursday": "07:00-10:00",
			"friday": "05:30-08:00",
			"saturday": "05:30-08:00"
		}
	]
}*/