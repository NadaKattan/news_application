import 'package:flutter/material.dart';
import 'package:news_application/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (_, index) => NewsCard(
          title: "BBC News",
          subTitle:
              "Why are football's biggest clubs starting a new tournament?",
          image:
              "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
      itemCount: 20,
    ));
  }
}
