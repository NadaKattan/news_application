import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/features/news/data/data_sources/news_data_source.dart';
import 'package:news_application/features/news/data/models/article.dart';
import 'package:news_application/features/news/data/models/news_response.dart';
import 'package:news_application/services/api_constants.dart';

class NewsAPIDataSource extends NewsDataSource{

  @override
  Future<List<Article>> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndPoints,
        {"apiKey": ApiConstants.apiKey, "sources": sourceId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse=NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception("Failed to get news articles");
    }
  }
}