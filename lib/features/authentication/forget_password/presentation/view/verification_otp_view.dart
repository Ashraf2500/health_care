import 'package:flutter/material.dart';
import 'package:health_care/features/authentication/authentication_exports.dart';

class VerificationOtpView extends StatelessWidget {
  const VerificationOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: VerificationOtpBody(),
    );
  }
}
