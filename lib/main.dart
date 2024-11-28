import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/general/presentation/view/news_gen_details.dart';
import 'package:news_application/features/home/presentation/view/home_screen.dart';
import 'package:news_application/features/news/presentation/view/news_details.dart';
import 'package:news_application/features/general/presentation/view/search_result.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_application/features/settings/data/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: const NewsApp(),
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
     SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'News App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode??"en"),
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
