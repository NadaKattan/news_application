import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/widgets/loading_indicator.dart';
import '../../data/models/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key});
  static const String routeName = "/article";
  late Article args;
  Uri? url;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Article;
    final publishedAgo = args.publishedAt;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.amber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
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
              if (publishedAgo != null)
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(timeago.format(publishedAgo))),
              const SizedBox(
                height: 10,
              ),
              Text(args.description ?? ""),
              Text(args.content ?? ""),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                      onTap: () async {
                        url = Uri.parse(args.url ?? "");
                        if (await canLaunchUrl(url!)) {
                          await launchUrl(url!, mode: LaunchMode.inAppWebView);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('cannot launch $url')));
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.view,
                        style: Theme.of(context).textTheme.labelMedium,
                      ))),
            ],
          ),
        ));
  }
}
