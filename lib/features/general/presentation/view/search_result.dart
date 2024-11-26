import 'package:flutter/material.dart';
import 'package:news_application/features/category/presentation/view/widgets/category_details.dart';
import 'package:news_application/features/general/presentation/view/news_gen_card.dart';
import 'package:news_application/features/general/presentation/view/news_gen_list.dart';
import 'package:news_application/features/general/presentation/view_model/news_gen_view_model.dart';
import 'package:news_application/features/news/presentation/view/news_card.dart';

class SearchResult extends StatelessWidget {
  static const String routeName = "/search";
  SearchResult({this.query, super.key});
  late String? query;
  final viewModel = NewsGenViewModel();
  // late String? args;
  @override
  Widget build(BuildContext context) {
    viewModel.getGenNews(query ?? "");
    // final genList = viewModel.news;
    // args = ModalRoute.of(context)!.settings.arguments as String;
    query ??= ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      backgroundColor: Colors.white,
      body: NewsGenList(query!),
    );
  }
}
