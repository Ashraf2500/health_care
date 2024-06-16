class CovidResultModel {
  CovidResultModel({
    required this.prediction,
    required this.resultImage,
  });

  final String? prediction;
  final String? resultImage;

  factory CovidResultModel.fromJson(Map<String, dynamic> json){
    return CovidResultModel(
      prediction: json["prediction"],
      resultImage: json["result_image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "prediction": prediction,
    "result_image": resultImage,
  };

}

/*
{
	"prediction": "COVID-19 Positive",
	"result_image": "result_a5e7ead0-ac3c-43da-a5f8-236799201d13.jpg"
}*/