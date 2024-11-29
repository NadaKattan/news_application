import 'package:flutter/material.dart';
import 'package:news_application/core/service_locator.dart';
import 'package:news_application/features/news/data/models/article.dart';
import 'package:news_application/features/news/data/repositories/news_repository.dart';


class NewsViewModel with ChangeNotifier{
  List<Article> news = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    final repository = NewsRepository(
      dataSource: ServiceLocator.newsDataSource
    );

    try {
      news = await repository.getSources(sourceId);
    }catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}