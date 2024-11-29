
import 'package:news_application/features/news/data/models/article.dart';

abstract class NewsDataSource{
  Future<List<Article>> getNews(String sourceId);
}