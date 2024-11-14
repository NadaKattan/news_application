import 'package:flutter/material.dart';
import 'package:news_application/models/source_model.dart';
import 'package:news_application/widgets/news_list.dart';
import 'package:news_application/widgets/source_item.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key});
  List<SourceModel> sources = List.generate(
      10, (index) => SourceModel(id: "$index", name: "Source $index"));
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 16,
      ),
      DefaultTabController(
        length: widget.sources.length,
        child: TabBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          tabs: widget.sources.map(
            (source) {
              return SourceItem(
                SourceName: source.name,
                isSelected: selectedIndex == widget.sources.indexOf(source),
              );
            },
          ).toList(),
          dividerColor: Colors.transparent,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.transparent,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const NewsList(),
    ]);
  }
}
