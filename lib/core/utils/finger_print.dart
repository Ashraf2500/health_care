import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class FingerPrint {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> authAuth(BuildContext context) async {
    try {
      bool authenticate = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        authMessages: [
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
            
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);
        AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
          
        );

      final userTypeCash = await CacheHelper.getData(key: "userType");
      final token = await CacheHelper.getData(key: "token");

      /*if (token != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashView()));
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashView()));
      }*/

      if (token != null && authenticate) {
        if(userTypeCash=='user'){
          context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.patient);
        }
        else if(userTypeCash=='doctor'){
          context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.doctor);
        }
        else if(userTypeCash=='admin'){
          context.read<UserTypeCubit>().chooseUserType(type: UserTypeData.admin);
        }
        ApiServices.token=token;
        RoutingHelper.navToMainScreen(context);
        await context.read<CurrentUserDataCubit>().currentUserData(context: context);


      }
      else if(token == null && authenticate){
        RoutingHelper.navToLogin(context);

      }
      else{
        FingerPrint().authAuth(context);
      }
    } on PlatformException catch (e) {
      cancelApp();
      if (e.code == auth_error.notEnrolled) {
        print("should cancel 1");
        cancelApp();
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        print("should cancel 2");
        cancelApp();
      } else {
        print("should cancel 3");
       cancelApp();
      }
    }
  }

  void cancelApp() {
    exit(0);
  }
}
