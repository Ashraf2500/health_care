import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class AuthTypeView extends StatelessWidget {
  const AuthTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthTypeBody(),
    );
  }
}
