class MedicineConverterModel {
  MedicineConverterModel({
    required this.medicines,
  });

  final List<MedicineConvertData> medicines;

  factory MedicineConverterModel.fromJson(Map<String, dynamic> json){
    return MedicineConverterModel(
      medicines: json["medicines"] == null ? [] : List<MedicineConvertData>.from(json["medicines"]!.map((x) => MedicineConvertData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "medicines": medicines.map((x) => x.toJson()).toList(),
  };

}

class MedicineConvertData {
  MedicineConvertData({
    required this.medicineName,
    required this.medicineDate,
  });

  final String? medicineName;
  final String? medicineDate;

  factory MedicineConvertData.fromJson(Map<String, dynamic> json){
    return MedicineConvertData(
      medicineName: json["medicineName"],
      medicineDate: json["medicineDate"],
    );
  }

  Map<String, dynamic> toJson() => {
    "medicineName": medicineName,
    "medicineDate": medicineDate,
  };

}

/*
{
	"medicines": [
		{
			"medicineName": "med1",
			"medicineDate": "date1"
		},
		{
			"medicineName": "med2",
			"medicineDate": "date2"
		},
		{
			"medicineName": "med3",
			"medicineDate": "date3"
		}
	]
}*/