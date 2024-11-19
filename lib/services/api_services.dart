import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/models/news_response/news_response.dart';
import 'package:news_application/models/sources_response/sources_response.dart';
import 'package:news_application/services/api_constants.dart';

class ApiServices {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourcesEndPoints,
        {"apiKey": ApiConstants.apiKey, "category": categoryId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndPoints,
        {"apiKey": ApiConstants.apiKey, "sources": sourceId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
