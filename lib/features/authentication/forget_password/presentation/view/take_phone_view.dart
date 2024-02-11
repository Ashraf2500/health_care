import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class TakePhoneView extends StatelessWidget {
  const TakePhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: TakePhoneBody(),
    );
  }
}
