import 'package:news_application/features/news/data/data_sources/news_api_data_source.dart';
import 'package:news_application/features/news/data/data_sources/news_data_source.dart';
import 'package:news_application/features/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news_application/features/sources/data/data_sources/sources_data_source.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource=SourcesAPIDataSource();
  static NewsDataSource newsDataSource=NewsAPIDataSource();
}