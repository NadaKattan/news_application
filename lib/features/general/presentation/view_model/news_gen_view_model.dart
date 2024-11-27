import 'package:flutter/material.dart';
import 'package:news_application/features/general/data/data_sources/news_gen_data_source.dart';
import 'package:news_application/features/general/data/models/gen_article.dart';

class NewsGenViewModel with ChangeNotifier {
  List<GenArticle> news = [];
  String? errorMessage;
  bool isLoading = false;
  int pageNum=1;

  Future<void> getGenNews(String searchWord) async {
    isLoading = true;
    notifyListeners();
    final response = await NewsGenDataSource().getGenNews(searchWord,pageNum);
    try {
      if (response.status == 'ok' && response.articles != null) {
        news.addAll(response.articles!);
      } else {
        errorMessage = "Failed to get sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
  // Future<void> increasePage() async {
  //   NewsGenDataSource.pageNum++;
  //   await getGenNews("a");
  // }
}
