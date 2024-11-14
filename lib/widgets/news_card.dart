import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final String title;
  final String image;
  final String? subTitle;
  NewsCard(
      {super.key, required this.title, required this.image, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.amber,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(subTitle ?? ""),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(timeago.format(fifteenAgo))),
      ]),
    );
  }
}
