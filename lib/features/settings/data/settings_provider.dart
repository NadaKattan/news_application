import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider with ChangeNotifier {
  // ThemeMode themeMode=ThemeMode.light;
  String languageCode="en";
  // bool get isDark => themeMode==ThemeMode.dark;
  // String get background => isDark?"dark_bg":"default_bg";
  Future<String?> get language async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString(languageCode);
  }
  // void changeTheme(ThemeMode theme){
  //   themeMode=theme;
  //   // print(themeMode);
  //   notifyListeners();
  // }
  Future<void> getData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    // sharedPreferences.setString("languageCode",selectedLanguageCode);
    languageCode=sharedPreferences.getString("languageCode")!;
    notifyListeners();
  }
  Future<void> changeLanguage(String selectedLanguageCode) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("languageCode",selectedLanguageCode);
    languageCode=sharedPreferences.getString("languageCode")!;
    // print(sharedPreferences.getString("languageCode"));
    notifyListeners();
  }
}