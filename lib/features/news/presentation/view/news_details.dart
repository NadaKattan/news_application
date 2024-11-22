import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});
  static const String routeName = "/article";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("News Details"),
      ),
    );
  }
}
