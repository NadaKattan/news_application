import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/general/presentation/view/news_gen_list.dart';
import 'package:news_application/features/general/presentation/view_model/news_gen_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResult extends StatelessWidget {
  static const String routeName = "/search";
  SearchResult({this.query, this.flag=true,super.key});
  late String? query;
  final viewModel = NewsGenViewModel();
  bool flag;
  // late String? args;
  @override
  Widget build(BuildContext context) {
    viewModel.getGenNews(query ?? "");
    // final genList = viewModel.news;
    // args = ModalRoute.of(context)!.settings.arguments as String;
    query ??= ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: flag
          ? AppBar(
              title: Text(
                AppLocalizations.of(context)!.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.white),
              ),
            )
          : null,
      backgroundColor: Colors.white,
      body: NewsGenList(query!),
    );
  }
}
