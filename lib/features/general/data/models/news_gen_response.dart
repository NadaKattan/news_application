
import 'gen_article.dart';

class NewsGenResponse {
	final String? status;
	final int? totalResults;
	final List<GenArticle>? articles;

	const NewsGenResponse({this.status, this.totalResults, this.articles});

	factory NewsGenResponse.fromJson(Map<String, dynamic> json) {
		return NewsGenResponse(
			status: json['status'] as String?,
			totalResults: json['totalResults'] as int?,
			articles: (json['articles'] as List<dynamic>?)
						?.map((e) => GenArticle.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'totalResults': totalResults,
				'articles': articles?.map((e) => e.toJson()).toList(),
			};
}
