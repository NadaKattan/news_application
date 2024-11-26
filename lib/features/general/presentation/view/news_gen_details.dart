import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:news_application/features/general/data/models/gen_article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsGenDetails extends StatelessWidget {
  NewsGenDetails({super.key});
  static const String routeName = "/general-article";
  late GenArticle args;
  late final Uri url;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as GenArticle;
    final publishedAgo = args.publishedAt;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              if (args.urlToImage != null)
                CachedNetworkImage(
                  imageUrl: args.urlToImage!,
                  // ?? "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported_outlined),
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              const SizedBox(
                height: 5,
              ),
              if (args.source != null) Text(args.source!.name ?? ""),
              const SizedBox(
                height: 5,
              ),
              Text(
                args.title ?? "",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // if (publishedAgo != null)
              //   Align(
              //       alignment: AlignmentDirectional.centerEnd,
              //       child: Text(timeago.format(publishedAgo))),
              const SizedBox(
                height: 10,
              ),
              Text(args.description ?? ""),
              Text(args.content ?? ""),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                      onTap: () async {
                        url = Uri.parse(args.url ?? "");
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: const Text("View Full Article"))),
            ],
          ),
        ));
  }
}
