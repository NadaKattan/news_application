import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/features/general/data/models/news_gen_response.dart';
import 'package:news_application/services/api_constants.dart';

class NewsGenDataSource with ChangeNotifier {
  Future<NewsGenResponse> getGenNews(String searchWord) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.everyEndPoints,
        {"apiKey": ApiConstants.apiKey, "q": searchWord});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsGenResponse.fromJson(json);
  }
}
