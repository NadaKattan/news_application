import 'package:flutter/material.dart';
import 'package:news_application/models/sources_response/source.dart';

import 'package:news_application/widgets/news_list.dart';
import 'package:news_application/widgets/source_item.dart';

class SourcesTabs extends StatefulWidget {
  SourcesTabs({required this.sources, super.key});
  // List<Source> sources = List.generate(
  //     10, (index) => Source(id: "$index", name: "Source $index"));
  List<Source> sources;
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
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
                SourceName: source.name ?? "",
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
      NewsList(widget.sources[selectedIndex].id!),
    ]);
  }
}
