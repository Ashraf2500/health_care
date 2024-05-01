class SignUpModel {
  SignUpModel({
    required this.status,
    required this.error,
  });

  final int? status;
  final String? error;

  factory SignUpModel.fromJson(Map<String, dynamic> json){
    return SignUpModel(
      status: json["status"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
  };

}

/*
{
	"status": 400,
	"error": "This phone is already signed up. Please try another one."
}*/