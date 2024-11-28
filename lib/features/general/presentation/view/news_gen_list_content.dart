import 'package:flutter/material.dart';
import 'package:news_application/features/general/presentation/view/news_gen_card.dart';
import 'package:news_application/features/general/presentation/view_model/news_gen_view_model.dart';
import 'package:provider/provider.dart';

class NewsGenListContent extends StatefulWidget {
  NewsGenListContent(this.newsList, {super.key});
  final newsList;
  int count = 10;
  int limit = 90;
  @override
  State<NewsGenListContent> createState() => _NewsGenListContentState();
}

class _NewsGenListContentState extends State<NewsGenListContent> {
  final viewModel = NewsGenViewModel();
  @override
  void initState() {
    super.initState();
    // viewModel.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<NewsGenViewModel>(builder: (context, value, child) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                // here you update your data or load your data from network
                setState(() {
                  if (widget.count <= widget.limit) widget.count += 10;
                  // else {
                  //   // NewsGenViewModel().increasePage();
                  //   widget.limit += 90;
                  // }
                });
              }
              return true;
            },
            // if you used network it would good to use the stream or future builder
            child: widget.newsList.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) =>
                        NewsGenCard(widget.newsList[index]),
                    itemCount: widget.count,
                  )
                : Container(),
          );
        }),
      ),
    );
  }
}
