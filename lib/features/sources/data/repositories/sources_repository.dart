import 'package:news_application/features/sources/data/data_sources/sources_data_source.dart';
import 'package:news_application/features/sources/data/models/source.dart';

class SourcesRepository {

  final SourcesDataSource dataSource;
  const SourcesRepository({required this.dataSource});

  Future<List<Source>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}