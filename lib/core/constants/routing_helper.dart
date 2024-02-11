import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class RoutingHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringsRouting.splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case StringsRouting.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case StringsRouting.userType:
        return MaterialPageRoute(builder: (_) => UserTypeView());
      case StringsRouting.authType:
        return MaterialPageRoute(builder: (_) => AuthTypeView());
      case StringsRouting.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }

  static void navToSplash(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.splash);
  }

  static void navToOnboarding(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.onboarding);
  }
  static void navToUserType(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.userType);
  }
  static void navToAuthType(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.authType);
  }
  static void navToLogin(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.login);
  }
  static void navToSignUp(BuildContext context) {
    Navigator.pushNamed(context, StringsRouting.signUp);
  }
}
