import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';



class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
          child: Container(
            child: Text("Chat"),
          ),
      ),
    );
  }
}
