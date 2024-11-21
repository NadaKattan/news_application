import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/features/news/data/models/news_response.dart';
import 'package:news_application/services/api_constants.dart';

class ApiServices {
  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndPoints,
        {"apiKey": ApiConstants.apiKey, "sources": sourceId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
