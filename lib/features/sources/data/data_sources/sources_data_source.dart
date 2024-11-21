import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_application/features/sources/data/models/sources_response.dart';
import 'package:news_application/services/api_constants.dart';

class SourcesDataSource with ChangeNotifier{
  Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourcesEndPoints,
        {"apiKey": ApiConstants.apiKey, "category": categoryId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
