import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/features/sources/data/data_sources/sources_data_source.dart';
import 'package:news_application/features/sources/data/models/source.dart';
import 'package:news_application/features/sources/data/models/sources_response.dart';
import 'package:news_application/services/api_constants.dart';

class SourcesAPIDataSource extends SourcesDataSource{

  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourcesEndPoints,
        {"apiKey": ApiConstants.apiKey, "category": categoryId},);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse =  SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception("Failed to get sources");
    }
  }
}
