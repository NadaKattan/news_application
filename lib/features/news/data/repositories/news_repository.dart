
import 'package:news_application/features/news/data/data_sources/news_data_source.dart';
import 'package:news_application/features/news/data/models/article.dart';

class NewsRepository {

  final NewsDataSource dataSource;
  const NewsRepository({required this.dataSource});

  Future<List<Article>> getSources(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}