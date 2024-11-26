import 'package:flutter/material.dart';
import 'package:news_application/features/sources/data/data_sources/sources_data_source.dart';
import '../../../sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources([String categoryId="general"]) async {
    isLoading = true;
    notifyListeners();
    final response = await SourcesDataSource().getSources(categoryId);
    try {
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = "Failed to get sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
