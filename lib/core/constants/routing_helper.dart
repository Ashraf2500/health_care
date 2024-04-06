import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class _PageRouting {

  static Route<dynamic> page (RouteSettings settings , Widget page){
    return PageTransition(
      child: page,
      type: PageTransitionType.fade,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: Duration(milliseconds: FixedVariables.pageTransition),
      settings: settings,
    );
  }
}
class RoutingHelper {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringsRouting.splash:
        return _PageRouting.page(settings, SplashView());

      case StringsRouting.onboarding:
        return _PageRouting.page(settings, OnboardingView());

      case StringsRouting.userType:
        return _PageRouting.page(settings, UserTypeView());

      case StringsRouting.authType:
        return _PageRouting.page(settings, AuthTypeView());

      case StringsRouting.login:
        return _PageRouting.page(settings, LoginView());

      case StringsRouting.signUp:
        return _PageRouting.page(settings, SignUpView());

      case StringsRouting.takePhone:
        return _PageRouting.page(settings, TakePhoneView());

      case StringsRouting.verifyOtp:
        return _PageRouting.page(settings, VerificationOtpView());

      case StringsRouting.changePassword:
        return _PageRouting.page(settings, ChangePasswordView());

      case StringsRouting.mainScreen:
        return _PageRouting.page(settings, MainScreenView());

      case StringsRouting.doctorInfo:
        return _PageRouting.page(settings, DoctorInfoView());

      case StringsRouting.bookAppointmentTime:
        return _PageRouting.page(settings, BookAppointmentTime());

      case StringsRouting.bookAppointmentInfo:
        return _PageRouting.page(settings, OnboardingView());

      case StringsRouting.profileGeneralInfo:
        return _PageRouting.page(settings, CustomGeneralInfo());

      case StringsRouting.doctorsDepartments:
        return _PageRouting.page(settings, CustomDoctorsDepartments());


      default:
        return _PageRouting.page(settings, SplashView());
        //return MaterialPageRoute(builder: (_) => SplashView());
    }
  }

  static void navToSplash(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.splash);
  }

  static void navToOnboarding(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, StringsRouting.onboarding,(route) => false,);
  }

  static void navToUserType(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, StringsRouting.userType,(route) => false,);
  }

  static void navToAuthType(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.authType);
  }

  static void navToLogin(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.login);
  }

  static void navToLoginReplace(BuildContext context) {
    Navigator.pushReplacementNamed(context, StringsRouting.login);
  }

  static void navToSignUp(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.signUp);
  }

  static void navToTakePhone(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.takePhone);
  }

  static void navToVerificationOtp(BuildContext context) {
    Navigator.pushReplacementNamed(context, StringsRouting.verifyOtp);
  }
  static void navToChangePassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, StringsRouting.changePassword);
  }

  static void navToMainScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, StringsRouting.mainScreen,(route) => false,);
  }
  static void navToDoctorInfo(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.doctorInfo);
  }

  static void navToProfileGeneralInfo(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.profileGeneralInfo);
  }

  static void navToDoctorsDepartments(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.doctorsDepartments);
  }
  static void navToBookAppointmentTime(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.bookAppointmentTime);
  }

}
