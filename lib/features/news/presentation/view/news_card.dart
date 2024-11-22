import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/features/news/data/models/article.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:news_application/features/news/presentation/view/news_details.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  // final String title;
  // final String image;
  // final String? subTitle;
  final Article news;
  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.amber,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(NewsDetails.routeName);
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (news.urlToImage != null)
            CachedNetworkImage(
              imageUrl: news.urlToImage!,
              // ??
              //     "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg",
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined),
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          Text(
            news.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(news.description ?? ""),
          // if (publishedAgo != null)
            Align(
                alignment: AlignmentDirectional.centerEnd,
            child: Text(timeago.format(fifteenAgo))),
        ]),
      ),
    );
  }
}
