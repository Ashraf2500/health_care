import 'dart:ffi';

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

}
