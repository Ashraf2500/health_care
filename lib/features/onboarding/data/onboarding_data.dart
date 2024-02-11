import 'package:health_care/features/features_exports.dart';

class OnboardingModel {
  String image ;
  String description ;
  double percentageWidth = 1;                                                    //The percentage of width relative to the screen
  bool? hasBackGround = true;

  OnboardingModel({
    required this.image,
    required this.description,
    this.percentageWidth = 1,
    this.hasBackGround,
  });
}

class OnboardingData {

  static final List<OnboardingModel>  PagesLottie = [
    OnboardingModel(
      image:ImageHelper.lottie_23,
      description:"let's embark on a healthier lifestyle together",

    ),

    OnboardingModel(
      image:ImageHelper.alottie_1_5,
      description:"You can find a suitable doctor in all specialties and communicate with them",

    ),

    OnboardingModel(
      image:ImageHelper.lottie_20,
      description:"You can choose a suitable appointment for you from the list of appointments for each doctor",
      percentageWidth: 0.5,

    ),

    OnboardingModel(
      image:ImageHelper.lottie_2,
      description:"You can use the X-ray diagnosis feature based on the experience of doctors by AI",
      percentageWidth: 0.65,

    ),

    OnboardingModel(
      image:ImageHelper.alottie_7,
      description:"There is a feature to clarify and explain medical reports using artificial intelligence",
      percentageWidth: 0.6,
    ),

    OnboardingModel(
      image:ImageHelper.alottie_6_6,
      description:"You can use the chatBot feature to inquire about medical conditions",
      percentageWidth: 0.55,
    ),


  ];

}



/*
for logo
(
image:ImageHelper.lottie_31,
description:"31-Consult only with a doctor you trust",
),*/
