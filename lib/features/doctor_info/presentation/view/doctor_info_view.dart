import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class DoctorInfoView extends StatelessWidget {
   const DoctorInfoView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(context: context,title: "Doctor Details",),
      body: DoctorInfoBody(),
    );
  }
}


