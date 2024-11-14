import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/views/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task_manager',
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      // darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}
