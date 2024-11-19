import 'package:flutter/material.dart';
import 'package:news_application/services/api_services.dart';
import 'package:news_application/tabs/sources_tabs.dart';
import 'package:news_application/widgets/error_indicator.dart';
import 'package:news_application/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({required this.categoryId, super.key});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrorIndicator();
        } else {
          return SourcesTabs(
            sources: snapshot.data?.sources ?? [],
          );
        }
      },
    );
  }
}
