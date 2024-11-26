import 'package:collection/collection.dart';

import 'source.dart';

class GenArticle {
	final Source? source;
	final String? author;
	final String? title;
	final String? description;
	final String? url;
	final String? urlToImage;
	final String? publishedAt;
	final String? content;

	const GenArticle({
		this.source, 
		this.author, 
		this.title, 
		this.description, 
		this.url, 
		this.urlToImage, 
		this.publishedAt, 
		this.content, 
	});

	factory GenArticle.fromJson(Map<String, dynamic> json) => GenArticle(
				source: json['source'] == null
						? null
						: Source.fromJson(json['source'] as Map<String, dynamic>),
				author: json['author'] as String?,
				title: json['title'] as String?,
				description: json['description'] as String?,
				url: json['url'] as String?,
				urlToImage: json['urlToImage'] as String?,
				publishedAt: json['publishedAt'] as String?,
				content: json['content'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'source': source?.toJson(),
				'author': author,
				'title': title,
				'description': description,
				'url': url,
				'urlToImage': urlToImage,
				'publishedAt': publishedAt,
				'content': content,
			};
}
