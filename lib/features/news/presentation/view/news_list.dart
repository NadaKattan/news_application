import 'package:flutter/material.dart';
import 'package:news_application/features/news/presentation/view_models/news_view_model.dart';
import 'package:news_application/core/widgets/error_indicator.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:news_application/features/news/presentation/view/news_card.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // viewModel.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return Expanded(
        child: ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator();
          } else {
            final newsList = viewModel.news;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => NewsCard(newsList[index]),
              itemCount: newsList.length,
            );
          }
        },
      ),
    ));
  }
}
