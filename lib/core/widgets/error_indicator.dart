import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  ErrorIndicator({this.message,super.key});
  String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message??"Something went wrong")
    );
  }
}