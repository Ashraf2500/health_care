import 'package:flutter/material.dart';

class Message {
  final Image? image;
  final String? text;
  final bool fromUser;

  Message({this.image, this.text, required this.fromUser});
}