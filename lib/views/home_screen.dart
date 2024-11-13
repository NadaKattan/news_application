import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: HomeDrawer(),
      ),
    );
  }
}
