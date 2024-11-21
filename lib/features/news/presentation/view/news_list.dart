import 'package:flutter/material.dart';
import 'package:news_application/services/api_services.dart';
import 'package:news_application/core/widgets/error_indicator.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:news_application/features/news/presentation/view/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: ApiServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) => NewsCard(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    ));
  }
}
