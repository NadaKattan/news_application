import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/general/presentation/view/news_gen_details.dart';
import 'package:news_application/features/home/presentation/view/home_screen.dart';
import 'package:news_application/features/news/presentation/view/news_details.dart';
import 'package:news_application/features/general/presentation/view/search_result.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewsDetails.routeName: (_) => NewsDetails(),
        SearchResult.routeName: (_) => SearchResult(),
        NewsGenDetails.routeName: (_) => NewsGenDetails(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      // darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}
