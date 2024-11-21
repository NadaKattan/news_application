import 'package:flutter/material.dart';
import 'package:news_application/features/news/data/data_sources/news_data_source.dart';
import 'package:news_application/features/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier{
  List<Article> news = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String categoryId) async {
    isLoading = true;
    notifyListeners();
    final response = await NewsDataSource().getNews(categoryId);
    try {
      if (response.status == 'ok' && response.articles != null) {
        news = response.articles!;
      } else {
        errorMessage = "Failed to get sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}