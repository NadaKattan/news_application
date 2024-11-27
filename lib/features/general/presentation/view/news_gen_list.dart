import 'package:flutter/material.dart';
import 'package:news_application/core/widgets/error_indicator.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:news_application/features/general/presentation/view/news_gen_card.dart';
import 'package:news_application/features/general/presentation/view/news_gen_list_content.dart';
import 'package:news_application/features/general/presentation/view_model/news_gen_view_model.dart';
import 'package:provider/provider.dart';

class NewsGenList extends StatefulWidget {
  const NewsGenList(this.searchWord, {super.key});
  final String searchWord;

  @override
  State<NewsGenList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsGenList> {
  final viewModel = NewsGenViewModel();
  @override
  void initState() {
    super.initState();
    // viewModel.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getGenNews(widget.searchWord);
    return Expanded(
      child: ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<NewsGenViewModel>(
          builder: (context, value, child) {
            if (viewModel.isLoading) {
              return const LoadingIndicator();
            } else if (viewModel.errorMessage != null) {
              return ErrorIndicator();
            } else {
              final newsList = viewModel.news;
              return NewsGenListContent(newsList);
            }
          },
        ),
      ),
    );
  }
}
