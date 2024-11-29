import 'package:flutter/material.dart';
import 'package:news_application/core/service_locator.dart';
import 'package:news_application/features/sources/data/repositories/sources_repository.dart';
import '../../../sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources([String categoryId = "general"]) async {
    isLoading = true;
    notifyListeners();
    final repository = SourcesRepository(
      dataSource: ServiceLocator.sourcesDataSource
    );

    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
